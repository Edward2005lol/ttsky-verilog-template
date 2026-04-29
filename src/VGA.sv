module horizontal_counter 
(
    input logic clk,
    output reg [9:0] H_count_value,
    output logic enable_V_counter
);
    initial H_count_value = 0;
    always @(posedge clk) begin
        if (H_count_value < 799) begin
            H_count_value <= H_count_value + 1;
            enable_V_counter <= 0;
        end
        else begin
            H_count_value <= 0;
            enable_V_counter <= 1;
        end
    end
endmodule: horizontal_counter

module vertical_counter
(
    input logic clk, 
    input logic enable_V_counter,
    output reg [9:0] V_count_value
);
	initial V_count_value = 0;
    always @(posedge clk) begin
        if (enable_V_counter == 1'b1) begin
            if (V_count_value < 524) begin
                V_count_value <= V_count_value + 1;
            end
            else begin
                V_count_value <= 0;
            end
        end
    end
endmodule: vertical_counter

            

