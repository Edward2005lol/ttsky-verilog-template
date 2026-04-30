module slot_spinner 
(
    input logic clk, 
    input logic reset_n,
    input logic start,
    output logic [1:0] symbol1,
    output logic [1:0] symbol2,
    output logic [1:0] symbol3
);

    enum logic [2:0] {seed_state, start_state, spin_slots, stop_spinning_slot1, stop_spinning_slot2, stop_spinning_slot3} curr_state, next_state;

    always_comb begin
        symbol1 = 2'b10;
        symbol2 = 2'b10;
        symbol3 = 2'b11;
        next_state = start_state;
        case (curr_state) 
            seed_state: begin
                symbol1 = 2'b01;
                symbol2 = 2'b10;
                symbol3 = 2'b00;
                next_state = start_state;
            end
            start_state: begin
                symbol1 = temp_symbol1;
                symbol2 = temp_symbol2;
                symbol3 = temp_symbol3;
                if (start) begin
                    next_state = spin_slots;
                end
                else begin
                    next_state = start_state;
                end
            end
            spin_slots: begin
                symbol1 = temp_symbol1;
                symbol2 = temp_symbol2;
                symbol3 = temp_symbol3;
                if (done_spinning) begin
                    next_state = stop_spinning_slot1;
                end
                else begin
                    next_state = spin_slots;
                end
            end
            stop_spinning_slot1: begin
                symbol1 = temp_symbol1;
                symbol2 = temp_symbol2;
                symbol3 = temp_symbol3;
                if (done_spinning_slot1) begin
                    next_state = stop_spinning_slot2;
                end
                else begin
                    next_state = stop_spinning_slot1;
                end
            end
            stop_spinning_slot2: begin
                symbol1 = temp_symbol1;
                symbol2 = temp_symbol2;
                symbol3 = temp_symbol3;
                if (done_spinning_slot2) begin
                    next_state = stop_spinning_slot3;
                end
                else begin
                    next_state = stop_spinning_slot2;
                end
            end
            stop_spinning_slot3: begin
                symbol1 = temp_symbol1;
                symbol2 = temp_symbol2;
                symbol3 = temp_symbol3;
                if (start) begin
                    next_state = spin_slots;
                end
                else begin
                    next_state = stop_spinning_slot3; 
                end
            end
            default: 
                symbol1 = temp_symbol1;
                symbol2 = temp_symbol2;
                symbol3 = temp_symbol3;
                next_state = start_state;
        endcase
    end

    logic [21:0] slow_count, slot1_slow_count, slot2_slow_count;
    logic [24:0] start_slow_count;
    logic [4:0] time_spent_spinning, time_spent_spinning_slot1, time_spent_spinning_slot2; 
    logic [1:0] temp_symbol1, temp_symbol2, temp_symbol3;
    logic done_spinning, done_spinning_slot1, done_spinning_slot2;

    
    logic [2:0] delay_index;
    logic [4:0] delay_array[8];
    assign delay_array[0] = 5'd21;
    assign delay_array[1] = 5'd26;
    assign delay_array[2] = 5'd28;
    assign delay_array[3] = 5'd31;
    assign delay_array[4] = 5'd23;
    assign delay_array[5] = 5'd29;
    assign delay_array[6] = 5'd26;
    assign delay_array[7] = 5'd30;

    logic [2:0] delay_index1;
    logic [4:0] delay_array1[8];
    assign delay_array1[0] = 5'd18;
    assign delay_array1[1] = 5'd21;
    assign delay_array1[2] = 5'd20;
    assign delay_array1[3] = 5'd19;
    assign delay_array1[4] = 5'd16;
    assign delay_array1[5] = 5'd21;
    assign delay_array1[6] = 5'd23;
    assign delay_array1[7] = 5'd17;

    logic [2:0] delay_index2;
    logic [4:0] delay_array2[8];
    assign delay_array2[0] = 5'd18;
    assign delay_array2[1] = 5'd23;
    assign delay_array2[2] = 5'd17;
    assign delay_array2[3] = 5'd18;
    assign delay_array2[4] = 5'd16;
    assign delay_array2[5] = 5'd21;
    assign delay_array2[6] = 5'd24;
    assign delay_array2[7] = 5'd20;
    

    always_ff @(posedge clk) begin
        if (~reset_n) begin
            curr_state <= seed_state;
        end
        else begin
            if ((curr_state == start_state) && start_slow_count >= 25'd25000000) begin
                start_slow_count <= 0;
                temp_symbol1 <= temp_symbol1 + 1;
                temp_symbol2 <= temp_symbol2 + 1;
                temp_symbol3 <= temp_symbol3 + 1;
            end
            else if (curr_state == start_state) begin
                start_slow_count <= start_slow_count + 1;
            end 
            else if ((curr_state == spin_slots) && slow_count >= 22'd4028479) begin
                slow_count <= 0;
                time_spent_spinning <= time_spent_spinning + 1;
                if (time_spent_spinning >= delay_array[delay_index]) begin
                    time_spent_spinning <= 0;
                    delay_index <= delay_index + 1;
                    done_spinning <= 1;
                end
                else begin
                    temp_symbol1 <= temp_symbol1 + 1;
                    temp_symbol2 <= temp_symbol2 + 1;
                    temp_symbol3 <= temp_symbol3 + 1;
                    done_spinning <= 0;
                end
            end
            else if ((curr_state == spin_slots)) begin
                slow_count <= slow_count + 1;
            end
            else if ((curr_state == stop_spinning_slot1) && (slot1_slow_count >= 22'd4028479)) begin
                slot1_slow_count <= 0;
                time_spent_spinning_slot1 <= time_spent_spinning_slot1 + 1;
                if (time_spent_spinning_slot1 >= delay_array1[delay_index1]) begin
                    time_spent_spinning_slot1 <= 0;
                    delay_index1 <= delay_index1 + 1;
                    done_spinning_slot1 <= 1;
                end
                else begin
                    temp_symbol1 <= temp_symbol1;
                    temp_symbol2 <= temp_symbol2 + 1;
                    temp_symbol3 <= temp_symbol3 + 1;
                    done_spinning_slot1 <= 0;
                end
            end
            else if ((curr_state == stop_spinning_slot1)) begin
                slot1_slow_count <= slot1_slow_count + 1;
            end
            else if ((curr_state == stop_spinning_slot2) && (slot2_slow_count >= 22'd4028479)) begin
                slot2_slow_count <= 0;
                time_spent_spinning_slot2 <= time_spent_spinning_slot2 + 1;
                if (time_spent_spinning_slot2 >= delay_array2[delay_index2]) begin
                    time_spent_spinning_slot2 <= 0;
                    delay_index2 <= delay_index2 + 1;
                    done_spinning_slot2 <= 1;
                end
                else begin
                    temp_symbol1 <= temp_symbol1;
                    temp_symbol2 <= temp_symbol2;
                    temp_symbol3 <= temp_symbol3 + 1;
                    done_spinning_slot2 <= 0;
                end
            end
            else if ((curr_state == stop_spinning_slot2)) begin
                slot2_slow_count <= slot2_slow_count + 1;
            end    
            else if ((curr_state == stop_spinning_slot3)) begin
                temp_symbol1 <= temp_symbol1;
                temp_symbol2 <= temp_symbol2;
                temp_symbol3 <= temp_symbol3;  
            end 
            else begin
                temp_symbol1 <= 2'b00;
                temp_symbol2 <= 2'b10;
                temp_symbol3 <= 2'b11;
                delay_index <= 0;
                delay_index1 <= 0;
                delay_index2 <= 1;
                start_slow_count <= 0;
                slow_count <= 0;
                slot1_slow_count <= 0;
                slot2_slow_count <= 0;
                time_spent_spinning <= 0;
                time_spent_spinning_slot1 <= 0;
                time_spent_spinning_slot2 <= 0;
            end
            curr_state <= next_state;
        end
    end
endmodule: slot_spinner