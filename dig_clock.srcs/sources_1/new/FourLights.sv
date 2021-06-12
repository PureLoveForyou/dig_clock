`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 21:57:02
// Design Name: 
// Module Name: FourLights
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FourLights(
    input [3:0] an,
    input [7:0] min_bcd,
    input [7:0] sec_bcd,
    output logic [7:0] a_to_g
    );
    logic [7:0] a_to_g1, a_to_g2, a_to_g3, a_to_g4;
    x7seg_d Light1(.x(sec_bcd[3:0]), .a_to_g(a_to_g1));
    x7seg_d Light2(.x(sec_bcd[7:4]), .a_to_g(a_to_g2));
    x7seg_d Light3(.x(min_bcd[3:0]), .a_to_g(a_to_g3));
    x7seg_d Light4(.x(min_bcd[7:4]), .a_to_g(a_to_g4));
    always_comb begin
//        a_to_g = 8'b00000000;
        if(an == 4'b0001)
            a_to_g = a_to_g1;
        else if(an == 4'b0010)
            a_to_g = a_to_g2;
        else if(an == 4'b0100)
            a_to_g = a_to_g3;
        else if(an == 4'b1000)
            a_to_g = a_to_g4;
        else
            a_to_g = a_to_g1;
//            a_to_g = 8'b00000001;
//            4'b0001:a_to_g = 8'b00001111;
//            4'b0010:a_to_g = 8'b00011100;
//            4'b0100:a_to_g = 8'b11111111;
//            4'b1000:a_to_g = 8'b11110000;
//            default:a_to_g = 8'b00000000;
    end
endmodule
