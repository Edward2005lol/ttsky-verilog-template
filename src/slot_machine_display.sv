module display_slots 
(
    input logic clk,  
    input logic [1:0] symbol1, 
    input logic [1:0] symbol2,
    input logic [1:0] symbol3,
    input logic [9:0] hcount,
    input logic [9:0] vcount,
    output logic [1:0] red,
    output logic [1:0] green,
    output logic [1:0] blue 
);

    //Draw the slots
    logic slot1, slot2, slot3;

    assign slot1 = (((vcount >= 175) && (vcount <= 375)) && ((hcount >= 150) && (hcount <= 300)));
    assign slot2 = (((vcount >= 175) && (vcount <= 375)) && ((hcount >= 375) && (hcount <= 525)));
    assign slot3 = (((vcount >= 175) && (vcount <= 375)) && ((hcount >= 600) && (hcount <= 750)));

    logic slot1_condition1, slot1_condition2, slot1_condition3, slot1_condition4, slot1_condition5, slot1_condition6;
    logic [9:0] vcount_lower_cond1, vcount_upper_cond1, hcount_lower_cond1, hcount_upper_cond1;
    logic [9:0] vcount_lower_cond2, vcount_upper_cond2, hcount_lower_cond2, hcount_upper_cond2;
    logic [9:0] vcount_lower_cond3, vcount_upper_cond3, hcount_lower_cond3, hcount_upper_cond3;
    logic [9:0] vcount_lower_cond4, vcount_upper_cond4, hcount_lower_cond4, hcount_upper_cond4;
    logic [9:0] vcount_lower_cond5, vcount_upper_cond5, hcount_lower_cond5, hcount_upper_cond5;
    logic [9:0] vcount_lower_cond6, vcount_upper_cond6, hcount_lower_cond6, hcount_upper_cond6;

    assign slot1_condition1 = (((vcount >= vcount_lower_cond1) && (vcount <= vcount_upper_cond1)) && ((hcount >= hcount_lower_cond1) && (hcount <= hcount_upper_cond1)));
    assign slot1_condition2 = (((vcount >= vcount_lower_cond2) && (vcount <= vcount_upper_cond2)) && ((hcount >= hcount_lower_cond2) && (hcount <= hcount_upper_cond2)));
    assign slot1_condition3 = (((vcount >= vcount_lower_cond3) && (vcount <= vcount_upper_cond3)) && ((hcount >= hcount_lower_cond3) && (hcount <= hcount_upper_cond3)));
    assign slot1_condition4 = (((vcount >= vcount_lower_cond4) && (vcount <= vcount_upper_cond4)) && ((hcount >= hcount_lower_cond4) && (hcount <= hcount_upper_cond4)));
    assign slot1_condition5 = (((vcount >= vcount_lower_cond5) && (vcount <= vcount_upper_cond5)) && ((hcount >= hcount_lower_cond5) && (hcount <= hcount_upper_cond5)));
    assign slot1_condition6 = (((vcount >= vcount_lower_cond6) && (vcount <= vcount_upper_cond6)) && ((hcount >= hcount_lower_cond6) && (hcount <= hcount_upper_cond6)));
    
    always_comb begin
        if (symbol1 == 2'b00) begin
            //First condition
            vcount_lower_cond1 = 200;
            vcount_upper_cond1 = 225;
            hcount_lower_cond1 = 180;
            hcount_upper_cond1 = 240;
            //Second condition
            vcount_lower_cond2 = 200;
            vcount_upper_cond2 = 350;
            hcount_lower_cond2 = 220;
            hcount_upper_cond2 = 240;
            //Third condition
            vcount_lower_cond3 = 265;
            vcount_upper_cond3 = 290;
            hcount_lower_cond3 = 200;
            hcount_upper_cond3 = 210;
            //Fourth condition
            vcount_lower_cond4 = 265;
            vcount_upper_cond4 = 290;
            hcount_lower_cond4 = 210;
            hcount_upper_cond4 = 220;
            //Fifth condition 
            vcount_lower_cond5 = 265;
            vcount_upper_cond5 = 290;
            hcount_lower_cond5 = 220;
            hcount_upper_cond5 = 230;
            //Sixth condition
            vcount_lower_cond6 = 265;
            vcount_upper_cond6 = 290;
            hcount_lower_cond6 = 230;
            hcount_upper_cond6 = 260;
        end
        else if (symbol1 == 2'b01) begin
            //Condition1
            vcount_lower_cond1 = 230;
            vcount_upper_cond1 = 350;
            hcount_lower_cond1 = 170;
            hcount_upper_cond1 = 200;
            //Condition 2
            vcount_lower_cond2 = 200;
            vcount_upper_cond2 = 230;
            hcount_lower_cond2 = 170;
            hcount_upper_cond2 = 280;
            //Condition 3
            vcount_lower_cond3 = 230;
            vcount_upper_cond3 = 350;
            hcount_lower_cond3 = 250;
            hcount_upper_cond3 = 255;
            //Condition 4
            vcount_lower_cond4 = 230;
            vcount_upper_cond4 = 350;
            hcount_lower_cond4 = 255;
            hcount_upper_cond4 = 260;
            //Condition 5 
            vcount_lower_cond5 = 230;
            vcount_upper_cond5 = 350;
            hcount_lower_cond5 = 260;
            hcount_upper_cond5 = 270;
            //Condition 6
            vcount_lower_cond6 = 230;
            vcount_upper_cond6 = 350;
            hcount_lower_cond6 = 270;
            hcount_upper_cond6 = 280;
        end
        else if (symbol1 == 2'b10) begin
            //Condition1
            vcount_lower_cond1 = 260;
            vcount_upper_cond1 = 320;
            hcount_lower_cond1 = 175;
            hcount_upper_cond1 = 195;
            //Condition 2
            vcount_lower_cond2 = 230;
            vcount_upper_cond2 = 320;
            hcount_lower_cond2 = 215;
            hcount_upper_cond2 = 235;
            //Condition 3
            vcount_lower_cond3 = 260;
            vcount_upper_cond3 = 320;
            hcount_lower_cond3 = 255;
            hcount_upper_cond3 = 275;
            //Condition 4
            vcount_lower_cond4 = 290;
            vcount_upper_cond4 = 320;
            hcount_lower_cond4 = 175;
            hcount_upper_cond4 = 205;
            //Condition 5 
            vcount_lower_cond5 = 290;
            vcount_upper_cond5 = 320;
            hcount_lower_cond5 = 205;
            hcount_upper_cond5 = 255;
            //Condition 6
            vcount_lower_cond6 = 290;
            vcount_upper_cond6 = 320;
            hcount_lower_cond6 = 255;
            hcount_upper_cond6 = 275;
        end
        else if (symbol1 == 2'b11) begin
            //Condition1
            vcount_lower_cond1 = 195;
            vcount_upper_cond1 = 215;
            hcount_lower_cond1 = 175;
            hcount_upper_cond1 = 275;
            //Condition 2
            vcount_lower_cond2 = 215;
            vcount_upper_cond2 = 265;
            hcount_lower_cond2 = 175;
            hcount_upper_cond2 = 190;
            //Condition 3
            vcount_lower_cond3 = 265;
            vcount_upper_cond3 = 285;
            hcount_lower_cond3 = 175;
            hcount_upper_cond3 = 275;
            //Condition 4
            vcount_lower_cond4 = 285;
            vcount_upper_cond4 = 335;
            hcount_lower_cond4 = 260;
            hcount_upper_cond4 = 275;
            //Condition 5 
            vcount_lower_cond5 = 335;
            vcount_upper_cond5 = 355;
            hcount_lower_cond5 = 175;
            hcount_upper_cond5 = 275;
            //Condition 6
            vcount_lower_cond6 = 180;
            vcount_upper_cond6 = 370;
            hcount_lower_cond6 = 215;
            hcount_upper_cond6 = 235;
        end
        else begin
            //Condition1
            vcount_upper_cond1 = 0;
            vcount_lower_cond1 = 0;
            hcount_lower_cond1 = 0;
            hcount_upper_cond1 = 0;
            //Condition 2
            vcount_lower_cond2 = 0;
            vcount_upper_cond2 = 0;
            hcount_lower_cond2 = 0;
            hcount_upper_cond2 = 0;
            //Condition 3
            vcount_lower_cond3 = 0;
            vcount_upper_cond3 = 0;
            hcount_lower_cond3 = 0;
            hcount_upper_cond3 = 0;
            //Condition 4
            vcount_lower_cond4 = 0;
            vcount_upper_cond4 = 0;
            hcount_lower_cond4 = 0;
            hcount_upper_cond4 = 0;
            //Condition 5
            vcount_lower_cond5 = 0;
            vcount_upper_cond5 = 0;
            hcount_lower_cond5 = 0;
            hcount_upper_cond5 = 0;
            //Condition 6
            vcount_lower_cond6 = 0;
            vcount_upper_cond6 = 0;
            hcount_lower_cond6 = 0;
            hcount_upper_cond6 = 0;
        end
    end
    
    logic slot2_condition1, slot2_condition2, slot2_condition3, slot2_condition4, slot2_condition5, slot2_condition6;
    logic [9:0] slot2_vcount_lower_cond1, slot2_vcount_upper_cond1, slot2_hcount_lower_cond1, slot2_hcount_upper_cond1;
    logic [9:0] slot2_vcount_lower_cond2, slot2_vcount_upper_cond2, slot2_hcount_lower_cond2, slot2_hcount_upper_cond2;
    logic [9:0] slot2_vcount_lower_cond3, slot2_vcount_upper_cond3, slot2_hcount_lower_cond3, slot2_hcount_upper_cond3;
    logic [9:0] slot2_vcount_lower_cond4, slot2_vcount_upper_cond4, slot2_hcount_lower_cond4, slot2_hcount_upper_cond4;
    logic [9:0] slot2_vcount_lower_cond5, slot2_vcount_upper_cond5, slot2_hcount_lower_cond5, slot2_hcount_upper_cond5;
    logic [9:0] slot2_vcount_lower_cond6, slot2_vcount_upper_cond6, slot2_hcount_lower_cond6, slot2_hcount_upper_cond6;

    assign slot2_condition1 = (((vcount >= slot2_vcount_lower_cond1) && (vcount <= slot2_vcount_upper_cond1)) && ((hcount >= slot2_hcount_lower_cond1) && (hcount <= slot2_hcount_upper_cond1)));
    assign slot2_condition2 = (((vcount >= slot2_vcount_lower_cond2) && (vcount <= slot2_vcount_upper_cond2)) && ((hcount >= slot2_hcount_lower_cond2) && (hcount <= slot2_hcount_upper_cond2)));
    assign slot2_condition3 = (((vcount >= slot2_vcount_lower_cond3) && (vcount <= slot2_vcount_upper_cond3)) && ((hcount >= slot2_hcount_lower_cond3) && (hcount <= slot2_hcount_upper_cond3)));
    assign slot2_condition4 = (((vcount >= slot2_vcount_lower_cond4) && (vcount <= slot2_vcount_upper_cond4)) && ((hcount >= slot2_hcount_lower_cond4) && (hcount <= slot2_hcount_upper_cond4)));
    assign slot2_condition5 = (((vcount >= slot2_vcount_lower_cond5) && (vcount <= slot2_vcount_upper_cond5)) && ((hcount >= slot2_hcount_lower_cond5) && (hcount <= slot2_hcount_upper_cond5)));
    assign slot2_condition6 = (((vcount >= slot2_vcount_lower_cond6) && (vcount <= slot2_vcount_upper_cond6)) && ((hcount >= slot2_hcount_lower_cond6) && (hcount <= slot2_hcount_upper_cond6)));
    
    always_comb begin
        if (symbol2 == 2'b00) begin
            //First condition
            slot2_vcount_lower_cond1 = 200;
            slot2_vcount_upper_cond1 = 225;
            slot2_hcount_lower_cond1 = 405;
            slot2_hcount_upper_cond1 = 465;
            //Second condition
            slot2_vcount_lower_cond2 = 200;
            slot2_vcount_upper_cond2 = 350;
            slot2_hcount_lower_cond2 = 445;
            slot2_hcount_upper_cond2 = 465;
            //Third condition
            slot2_vcount_lower_cond3 = 265;
            slot2_vcount_upper_cond3 = 290;
            slot2_hcount_lower_cond3 = 425;
            slot2_hcount_upper_cond3 = 430;
            //Fourth condition
            slot2_vcount_lower_cond4 = 265;
            slot2_vcount_upper_cond4 = 290;
            slot2_hcount_lower_cond4 = 430;
            slot2_hcount_upper_cond4 = 460;
            //Fifth condition 
            slot2_vcount_lower_cond5 = 265;
            slot2_vcount_upper_cond5 = 290;
            slot2_hcount_lower_cond5 = 460;
            slot2_hcount_upper_cond5 = 470;
            //Sixth condition
            slot2_vcount_lower_cond6 = 265;
            slot2_vcount_upper_cond6 = 290;
            slot2_hcount_lower_cond6 = 470;
            slot2_hcount_upper_cond6 = 485;
        end
        else if (symbol2 == 2'b01) begin
            //First condition
            slot2_vcount_lower_cond1 = 230;
            slot2_vcount_upper_cond1 = 350;
            slot2_hcount_lower_cond1 = 395;
            slot2_hcount_upper_cond1 = 425;
            //Second condition
            slot2_vcount_lower_cond2 = 200;
            slot2_vcount_upper_cond2 = 230;
            slot2_hcount_lower_cond2 = 395;
            slot2_hcount_upper_cond2 = 505;
            //Third condition
            slot2_vcount_lower_cond3 = 230;
            slot2_vcount_upper_cond3 = 350;
            slot2_hcount_lower_cond3 = 475;
            slot2_hcount_upper_cond3 = 485;
            //Fourth condition
            slot2_vcount_lower_cond4 = 230;
            slot2_vcount_upper_cond4 = 350;
            slot2_hcount_lower_cond4 = 485;
            slot2_hcount_upper_cond4 = 490;
            //Fifth condition 
            slot2_vcount_lower_cond5 = 230;
            slot2_vcount_upper_cond5 = 350;
            slot2_hcount_lower_cond5 = 490;
            slot2_hcount_upper_cond5 = 500;
            //Sixth condition
            slot2_vcount_lower_cond6 = 230;
            slot2_vcount_upper_cond6 = 350;
            slot2_hcount_lower_cond6 = 500;
            slot2_hcount_upper_cond6 = 505;
        end
        else if (symbol2 == 2'b10) begin
            //First condition
            slot2_vcount_lower_cond1 = 260;
            slot2_vcount_upper_cond1 = 320;
            slot2_hcount_lower_cond1 = 400;
            slot2_hcount_upper_cond1 = 420;
            //Second condition
            slot2_vcount_lower_cond2 = 230;
            slot2_vcount_upper_cond2 = 320;
            slot2_hcount_lower_cond2 = 440;
            slot2_hcount_upper_cond2 = 460;
            //Third condition
            slot2_vcount_lower_cond3 = 260;
            slot2_vcount_upper_cond3 = 320;
            slot2_hcount_lower_cond3 = 480;
            slot2_hcount_upper_cond3 = 500;
            //Fourth condition
            slot2_vcount_lower_cond4 = 290;
            slot2_vcount_upper_cond4 = 320;
            slot2_hcount_lower_cond4 = 400;
            slot2_hcount_upper_cond4 = 410;
            //Fifth condition 
            slot2_vcount_lower_cond5 = 290;
            slot2_vcount_upper_cond5 = 320;
            slot2_hcount_lower_cond5 = 410;
            slot2_hcount_upper_cond5 = 420;
            //Sixth condition
            slot2_vcount_lower_cond6 = 290;
            slot2_vcount_upper_cond6 = 320;
            slot2_hcount_lower_cond6 = 420;
            slot2_hcount_upper_cond6 = 500;
        end
        else if (symbol2 == 2'b11) begin
            //First condition
            slot2_vcount_lower_cond1 = 195;
            slot2_vcount_upper_cond1 = 215;
            slot2_hcount_lower_cond1 = 400;
            slot2_hcount_upper_cond1 = 500;
            //Second condition
            slot2_vcount_lower_cond2 = 215;
            slot2_vcount_upper_cond2 = 265;
            slot2_hcount_lower_cond2 = 400;
            slot2_hcount_upper_cond2 = 415;
            //Third condition
            slot2_vcount_lower_cond3 = 265;
            slot2_vcount_upper_cond3 = 285;
            slot2_hcount_lower_cond3 = 400;
            slot2_hcount_upper_cond3 = 500;
            //Fourth condition
            slot2_vcount_lower_cond4 = 285;
            slot2_vcount_upper_cond4 = 335;
            slot2_hcount_lower_cond4 = 485;
            slot2_hcount_upper_cond4 = 500;
            //Fifth condition 
            slot2_vcount_lower_cond5 = 335;
            slot2_vcount_upper_cond5 = 355;
            slot2_hcount_lower_cond5 = 400;
            slot2_hcount_upper_cond5 = 500;
            //Sixth condition
            slot2_vcount_lower_cond6 = 180;
            slot2_vcount_upper_cond6 = 370;
            slot2_hcount_lower_cond6 = 440;
            slot2_hcount_upper_cond6 = 460;
        end
        else begin
            //First condition
            slot2_vcount_lower_cond1 = 0;
            slot2_vcount_upper_cond1 = 0;
            slot2_hcount_lower_cond1 = 0;
            slot2_hcount_upper_cond1 = 0;
            //Second condition
            slot2_vcount_lower_cond2 = 0;
            slot2_vcount_upper_cond2 = 0;
            slot2_hcount_lower_cond2 = 0;
            slot2_hcount_upper_cond2 = 0;
            //Third condition
            slot2_vcount_lower_cond3 = 0;
            slot2_vcount_upper_cond3 = 0;
            slot2_hcount_lower_cond3 = 0;
            slot2_hcount_upper_cond3 = 0;
            //Fourth condition
            slot2_vcount_lower_cond4 = 0;
            slot2_vcount_upper_cond4 = 0;
            slot2_hcount_lower_cond4 = 0;
            slot2_hcount_upper_cond4 = 0;
            //Fifth condition 
            slot2_vcount_lower_cond5 = 0;
            slot2_vcount_upper_cond5 = 0;
            slot2_hcount_lower_cond5 = 0;
            slot2_hcount_upper_cond5 = 0;
            //Sixth condition
            slot2_vcount_lower_cond6 = 0;
            slot2_vcount_upper_cond6 = 0;
            slot2_hcount_lower_cond6 = 0;
            slot2_hcount_upper_cond6 = 0;
        end
    end

    logic slot3_condition1, slot3_condition2, slot3_condition3, slot3_condition4, slot3_condition5, slot3_condition6;
    logic [9:0] slot3_vcount_lower_cond1, slot3_vcount_upper_cond1, slot3_hcount_lower_cond1, slot3_hcount_upper_cond1;
    logic [9:0] slot3_vcount_lower_cond2, slot3_vcount_upper_cond2, slot3_hcount_lower_cond2, slot3_hcount_upper_cond2;
    logic [9:0] slot3_vcount_lower_cond3, slot3_vcount_upper_cond3, slot3_hcount_lower_cond3, slot3_hcount_upper_cond3;
    logic [9:0] slot3_vcount_lower_cond4, slot3_vcount_upper_cond4, slot3_hcount_lower_cond4, slot3_hcount_upper_cond4;
    logic [9:0] slot3_vcount_lower_cond5, slot3_vcount_upper_cond5, slot3_hcount_lower_cond5, slot3_hcount_upper_cond5;
    logic [9:0] slot3_vcount_lower_cond6, slot3_vcount_upper_cond6, slot3_hcount_lower_cond6, slot3_hcount_upper_cond6;

    assign slot3_condition1 = (((vcount >= slot3_vcount_lower_cond1) && (vcount <= slot3_vcount_upper_cond1)) && ((hcount >= slot3_hcount_lower_cond1) && (hcount <= slot3_hcount_upper_cond1)));
    assign slot3_condition2 = (((vcount >= slot3_vcount_lower_cond2) && (vcount <= slot3_vcount_upper_cond2)) && ((hcount >= slot3_hcount_lower_cond2) && (hcount <= slot3_hcount_upper_cond2)));
    assign slot3_condition3 = (((vcount >= slot3_vcount_lower_cond3) && (vcount <= slot3_vcount_upper_cond3)) && ((hcount >= slot3_hcount_lower_cond3) && (hcount <= slot3_hcount_upper_cond3)));
    assign slot3_condition4 = (((vcount >= slot3_vcount_lower_cond4) && (vcount <= slot3_vcount_upper_cond4)) && ((hcount >= slot3_hcount_lower_cond4) && (hcount <= slot3_hcount_upper_cond4)));
    assign slot3_condition5 = (((vcount >= slot3_vcount_lower_cond5) && (vcount <= slot3_vcount_upper_cond5)) && ((hcount >= slot3_hcount_lower_cond5) && (hcount <= slot3_hcount_upper_cond5)));
    assign slot3_condition6 = (((vcount >= slot3_vcount_lower_cond6) && (vcount <= slot3_vcount_upper_cond6)) && ((hcount >= slot3_hcount_lower_cond6) && (hcount <= slot3_hcount_upper_cond6)));
    
    always_comb begin
        if (symbol3 == 2'b00) begin
            //First condition
            slot3_vcount_lower_cond1 = 200;
            slot3_vcount_upper_cond1 = 225;
            slot3_hcount_lower_cond1 = 630;
            slot3_hcount_upper_cond1 = 690;
            //Second condition
            slot3_vcount_lower_cond2 = 200;
            slot3_vcount_upper_cond2 = 350;
            slot3_hcount_lower_cond2 = 670;
            slot3_hcount_upper_cond2 = 690;
            //Third condition
            slot3_vcount_lower_cond3 = 265;
            slot3_vcount_upper_cond3 = 290;
            slot3_hcount_lower_cond3 = 650;
            slot3_hcount_upper_cond3 = 660;
            //Fourth condition
            slot3_vcount_lower_cond4 = 265;
            slot3_vcount_upper_cond4 = 290;
            slot3_hcount_lower_cond4 = 660;
            slot3_hcount_upper_cond4 = 670;
            //Fifth condition 
            slot3_vcount_lower_cond5 = 265;
            slot3_vcount_upper_cond5 = 290;
            slot3_hcount_lower_cond5 = 670;
            slot3_hcount_upper_cond5 = 700;
            //Sixth condition
            slot3_vcount_lower_cond6 = 265;
            slot3_vcount_upper_cond6 = 290;
            slot3_hcount_lower_cond6 = 700;
            slot3_hcount_upper_cond6 = 710;
        end
        else if (symbol3 == 2'b01) begin
            //First condition
            slot3_vcount_lower_cond1 = 230;
            slot3_vcount_upper_cond1 = 350;
            slot3_hcount_lower_cond1 = 620;
            slot3_hcount_upper_cond1 = 650;
            //Second condition
            slot3_vcount_lower_cond2 = 200;
            slot3_vcount_upper_cond2 = 230;
            slot3_hcount_lower_cond2 = 620;
            slot3_hcount_upper_cond2 = 730;
            //Third condition
            slot3_vcount_lower_cond3 = 230;
            slot3_vcount_upper_cond3 = 350;
            slot3_hcount_lower_cond3 = 700;
            slot3_hcount_upper_cond3 = 705;
            //Fourth condition
            slot3_vcount_lower_cond4 = 230;
            slot3_vcount_upper_cond4 = 350;
            slot3_hcount_lower_cond4 = 705;
            slot3_hcount_upper_cond4 = 710;
            //Fifth condition 
            slot3_vcount_lower_cond5 = 230;
            slot3_vcount_upper_cond5 = 350;
            slot3_hcount_lower_cond5 = 710;
            slot3_hcount_upper_cond5 = 715;
            //Sixth condition
            slot3_vcount_lower_cond6 = 230;
            slot3_vcount_upper_cond6 = 350;
            slot3_hcount_lower_cond6 = 715;
            slot3_hcount_upper_cond6 = 730;
        end
        else if (symbol3 == 2'b10) begin
            //First condition
            slot3_vcount_lower_cond1 = 260;
            slot3_vcount_upper_cond1 = 320;
            slot3_hcount_lower_cond1 = 625;
            slot3_hcount_upper_cond1 = 645;
            //Second condition
            slot3_vcount_lower_cond2 = 230;
            slot3_vcount_upper_cond2 = 320;
            slot3_hcount_lower_cond2 = 665;
            slot3_hcount_upper_cond2 = 685;
            //Third condition
            slot3_vcount_lower_cond3 = 260;
            slot3_vcount_upper_cond3 = 320;
            slot3_hcount_lower_cond3 = 705;
            slot3_hcount_upper_cond3 = 725;
            //Fourth condition
            slot3_vcount_lower_cond4 = 290;
            slot3_vcount_upper_cond4 = 320;
            slot3_hcount_lower_cond4 = 625;
            slot3_hcount_upper_cond4 = 640;
            //Fifth condition 
            slot3_vcount_lower_cond5 = 290;
            slot3_vcount_upper_cond5 = 320;
            slot3_hcount_lower_cond5 = 640;
            slot3_hcount_upper_cond5 = 690;
            //Sixth condition
            slot3_vcount_lower_cond6 = 290;
            slot3_vcount_upper_cond6 = 320;
            slot3_hcount_lower_cond6 = 690;
            slot3_hcount_upper_cond6 = 725;
        end
        else if (symbol3 == 2'b11) begin
            //First condition
            slot3_vcount_lower_cond1 = 195;
            slot3_vcount_upper_cond1 = 215;
            slot3_hcount_lower_cond1 = 625;
            slot3_hcount_upper_cond1 = 725;
            //Second condition
            slot3_vcount_lower_cond2 = 215;
            slot3_vcount_upper_cond2 = 265;
            slot3_hcount_lower_cond2 = 625;
            slot3_hcount_upper_cond2 = 640;
            //Third condition
            slot3_vcount_lower_cond3 = 265;
            slot3_vcount_upper_cond3 = 285;
            slot3_hcount_lower_cond3 = 625;
            slot3_hcount_upper_cond3 = 725;
            //Fourth condition
            slot3_vcount_lower_cond4 = 285;
            slot3_vcount_upper_cond4 = 335;
            slot3_hcount_lower_cond4 = 715;
            slot3_hcount_upper_cond4 = 725;
            //Fifth condition 
            slot3_vcount_lower_cond5 = 335;
            slot3_vcount_upper_cond5 = 355;
            slot3_hcount_lower_cond5 = 625;
            slot3_hcount_upper_cond5 = 725;
            //Sixth condition
            slot3_vcount_lower_cond6 = 180;
            slot3_vcount_upper_cond6 = 370;
            slot3_hcount_lower_cond6 = 665;
            slot3_hcount_upper_cond6 = 685;
        end
        else begin
            //First condition
            slot3_vcount_lower_cond1 = 0;
            slot3_vcount_upper_cond1 = 0;
            slot3_hcount_lower_cond1 = 0;
            slot3_hcount_upper_cond1 = 0;
            //Second condition
            slot3_vcount_lower_cond2 = 0;
            slot3_vcount_upper_cond2 = 0;
            slot3_hcount_lower_cond2 = 0;
            slot3_hcount_upper_cond2 = 0;
            //Third condition
            slot3_vcount_lower_cond3 = 0;
            slot3_vcount_upper_cond3 = 0;
            slot3_hcount_lower_cond3 = 0;
            slot3_hcount_upper_cond3 = 0;
            //Fourth condition
            slot3_vcount_lower_cond4 = 0;
            slot3_vcount_upper_cond4 = 0;
            slot3_hcount_lower_cond4 = 0;
            slot3_hcount_upper_cond4 = 0;
            //Fifth condition 
            slot3_vcount_lower_cond5 = 0;
            slot3_vcount_upper_cond5 = 0;
            slot3_hcount_lower_cond5 = 0;
            slot3_hcount_upper_cond5 = 0;
            //Sixth condition
            slot3_vcount_lower_cond6 = 0;
            slot3_vcount_upper_cond6 = 0;
            slot3_hcount_lower_cond6 = 0;
            slot3_hcount_upper_cond6 = 0;
        end
    end


    always_ff @(posedge clk) begin
        if (slot2_condition1 || slot2_condition2 || slot2_condition3 || slot2_condition4 || slot2_condition5 || slot2_condition6) begin
            red <= 2'b00;
            green <= 2'b00;
            blue <= 2'b00;
        end
        else if (slot3_condition1 || slot3_condition2 || slot3_condition3 || slot3_condition4 || slot3_condition5 || slot3_condition6) begin
            red <= 2'b00;
            green <= 2'b00;
            blue <= 2'b00;
        end
        else if (slot1_condition1 || slot1_condition2 || slot1_condition3 || slot1_condition4 || slot1_condition5 || slot1_condition6) begin
            red <= 2'b00;
            green <= 2'b00;
            blue <= 2'b00;
        end
        else if (slot1 || slot2 || slot3) begin
            red <= 2'b11;
            green <= 2'b11;
            blue <= 2'b11;
        end
        else begin
            red <= 2'b00;
            green <= 2'b00;
            blue <= 2'b00;
        end
    end
endmodule: display_slots