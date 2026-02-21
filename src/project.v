/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_Edward2005lol_top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out[7:3] = 5'd0;
  assign uio_out[1:0] = 2'd0;
  assign uio_oe = 8'b11111100;

  RangeFinder #(8) range_finder (.data_in(ui_in), 
              .clock(clk), 
              .reset(rst_n), 
              .go(uio_in[0]), 
              .finish(uio_in[1]), 
              .range(uo_out), 
              .debug_error(uio_out[2]));

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, 1'b0};
  wire unused2 = &{uio_in[7:2], 6'd0};

endmodule

module Register
    #(parameter WIDTH = 6)
    (input logic en, clear, clock,
     input logic [WIDTH-1:0] D,
     output logic [WIDTH-1:0] Q);
    
    always_ff @(posedge clock)        
        //when en and clear are both 0 we hold
        if (~en & ~clear) begin
            Q <= Q;
        end
        //when enable is 0 and clear is 1 we clear
        else if (~en & clear) begin
            Q <= '0;
        end
        //when enable is 1 we enable
        else if (en) begin
            Q <= D;
        end
endmodule: Register

module RangeFinder 
    #(parameter WIDTH = 8)
    (input logic [WIDTH-1:0] data_in,
     input logic             clock, reset,
     input logic             go, finish,
     output logic [WIDTH-1:0] range,
     output logic             debug_error);

    logic large_reg_enable, small_reg_enable, compare, reg_go_load, handle_finish;
    logic [WIDTH-1:0] number;
    logic [WIDTH-1:0] largest_num, smallest_num;
    logic [WIDTH-1:0] new_largest_num, new_smallest_num;
    
    fsm #(8) control (.clock(clock), 
                .reset(reset), 
                .go(go), 
                .finish(finish),
                .data_in(data_in),
                .compare(compare),
                .reg_go_load(reg_go_load),
                .handle_finish(handle_finish),
                .error(debug_error),
                .number(number));
    
    //Register that stores the largest number we've seen
    Register #(WIDTH) r1(.clock(clock), .en(large_reg_enable), .clear('0), .D(largest_num), .Q(new_largest_num));
    
    //Register that stores the smallest number we've seen
    Register #(WIDTH) r2(.clock(clock), .en(small_reg_enable), .clear('0), .D(smallest_num), .Q(new_smallest_num));

    logic [WIDTH-1:0] largest, smallest;
    logic smaller, larger;
    //Using an always-comb block
    always_comb begin
        //if we are comparing then we need to check the current
        //largest and smallest number to the data_in value
        //that is stored in number 
        largest = new_largest_num;
        smallest = new_smallest_num;
        large_reg_enable = 0;
        small_reg_enable = 0;
        smallest_num = '0;
        largest_num = '0;
        larger = 0;
        smaller = 0;
        
      	if (handle_finish) begin
          if ((number > new_largest_num) & (number > new_smallest_num)) begin
            largest = number;
            smallest = new_smallest_num;
          end
          else if ((number < new_largest_num) & (number > new_smallest_num)) begin
            largest = new_largest_num;
            smallest = new_smallest_num;
          end
          else if ((number < new_largest_num) & (number < new_smallest_num)) begin
            smallest = number;
            largest = new_largest_num;
          end
          else if ((number < new_largest_num) & (number > new_smallest_num)) begin
            largest = new_largest_num;
            smallest = new_smallest_num;
          end
          range = largest - smallest; 
        end
      else if (debug_error) begin
            large_reg_enable = 0;
            small_reg_enable = 0;
        end
        else if (reg_go_load) begin
            large_reg_enable = 1;
            small_reg_enable = 1;
            smallest_num = number;
            largest_num = number;
        end
        else if (compare) begin
            range = '0;
            larger = number > new_largest_num;
            smaller = number < new_smallest_num;
            //This is when the data_in number is larger 
            //than the current large number so we replace
            if (larger & ~smaller) begin
                largest_num = number;
                small_reg_enable = 0;
                large_reg_enable = 1;
            end
            //This is the case the current data_in value is smaller than
            //the currently stored smallest number so we replace
            else if (smaller & ~larger) begin
                smallest_num = number;
                small_reg_enable = 1;
                large_reg_enable = 0;
            end
            // This is the case where the current number is not greater than
            //or less than the stored numbers
            else if (~larger & ~smaller) begin
                large_reg_enable = 0;
                small_reg_enable = 0;
            end
        end
    end  


endmodule: RangeFinder
 
module fsm
    #(parameter WIDTH = 8)
    (input logic clock, reset, go, finish,
     input logic [WIDTH-1:0] data_in,
     output logic compare,
     output logic reg_go_load, handle_finish,
     output logic error, 
     output logic [WIDTH-1:0] number);

    
  enum logic [1:0] {start, looping, error_state} currState, nextState;

    logic go_asserted;
    always_comb begin
        case (currState) 
            start: begin
                //if go is asserted then the sequence begins
                //NOTE: We need to load the data_in value into the registers initially since 
                //that first number will be both the largest and the smallest
                if (go & ~finish) begin
                    go_asserted = 1;
                    compare = 1;
                    reg_go_load = 1;
                    number = data_in;
                    error = 0;
                    handle_finish = 0;
                    nextState = looping;
                end
                // if both go and finish are asserted its an error
                else if (go & finish) begin
                    go_asserted = 0;
                    compare = 0;
                    number = '0;
                    reg_go_load = 0;
                    error = 1;
                    handle_finish = 0;
                    nextState = error_state;
                end
                //finish can not be asserted before go so its an error
                else if (~go & finish) begin
                    go_asserted = 0;
                    compare = 0;
                    number = '0;
                    reg_go_load = 0;
                    error = 1;
                    handle_finish = 0;
                    nextState = error_state;
                end
                //If none of them are asserted then we just stay in the start loop
              else if (~go & ~finish) begin
                    go_asserted = 0;
                    compare = 0;
                    number = '0;
                    reg_go_load = 0;
                    error = 0;
                    handle_finish = 0;
                  	nextState = start;
                end
            end 
            looping: begin
                //This is the case where the sequence is finished and we have
                //to go back to the start state since we are going to start a new sequence
                //NOTE: since we need to output the range and take a look at the finish value as well
                //that means that we need to have a status variable that tells us that we are finished
                if (finish) begin
                  	go_asserted = 0;  
                  	handle_finish = 1;
                    compare = 1;
                    number = data_in;
                    reg_go_load = 0;
                    error = 0;
                    nextState = start;
                end
                //This is the case where go and finish are not asserted
                //Since we are in the loop we just take a look at the data_in
                //and compare it to the values we have in the registers
                else if (~go) begin
                    go_asserted = 0;
                    compare = 1;
                    number = data_in;
                    reg_go_load = 0;
                    error = 0;
                    handle_finish = 0;
                    nextState = looping;
                end
                //This is the case where the go signal was unasserted in the middle of the sequence and then was asserted again before finish
                else if (go & ~go_asserted & ~finish) begin
                    go_asserted = 1;
                    compare = 0;
                    number = '0;
                    reg_go_load = 0;
                    error = 1;
                    handle_finish = 0;
                    nextState = error_state;
                end

                else begin
                    go_asserted = 1;
                    compare = 1;
                    number = data_in;
                    reg_go_load = 0;
                    error = 0;
                    handle_finish = 0;
                    nextState = looping;
                end
            end
            error_state: begin
                //When we are in the error the only way to leave this state is if go is asserted and
                //a new sequence begins

                //This is the case where go is asserted so we would leave the error state and start
                //a new sequence
              	if (go & ~finish) begin
                  	go_asserted = 1;
                    error = 0;
                    reg_go_load = 1;
                    compare = 1;
                    number = data_in;
                    handle_finish = 0;
                    nextState = looping;
                end
                
                //This is the case where go and finish are both asserted which is still an error
                //So stay in error state
                else if (go & finish) begin
                    error = 1;
                    reg_go_load = 0;
                    compare = 0;
                    number = data_in;
                    handle_finish = 0;
                    nextState = error_state;
                end

                //This is the case where finish is asserted but go is not, which is still an error since 
                //we are in the error state and no sequence is being run rn
                else if (~go & finish) begin
                    error = 1;
                    reg_go_load = 0;
                    compare = 0;
                    number = data_in;
                    handle_finish = 0;
                    nextState = error_state;
                end

                //This is the case where both finish and go are both unasserted, in which case we just stay
                //in the error state since error latches
                else if (~go & ~finish) begin
                    error = 1;
                    reg_go_load = 0;
                    compare = 0;
                    number = data_in;
                    handle_finish = 0;
                    nextState = error_state;
                end
            end 
            default: begin
              go_asserted = 0;
              compare = 0;
              number = data_in;
              reg_go_load = 0;
              error = 0;
              handle_finish = 0;
              nextState = start;
            end
        endcase
    end

  always_ff@(posedge clock, posedge reset) begin
        if (reset) begin
            currState <= start;
        end
        else begin
            currState <= nextState;
        end
    end 
                 
endmodule: fsm
