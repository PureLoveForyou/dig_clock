`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/24 21:29:55
// Design Name: 
// Module Name: edge_det
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


module edge_det(
    input sys_clk,
    input sys_rst_n,
    input i_btn,
    output logic posedge_flag
    );
    //����2λ��λ�Ĵ����ı��ؼ���·
    logic [1:0] diffe;
    always_ff @(posedge sys_clk)begin
        if(!sys_rst_n)begin
            diffe <= 2'b00;
            //posedge_flag <= 1'b0;
        end
        else
            diffe[1:0] <= {diffe[0], i_btn};
    end
        
    assign posedge_flag = diffe[0] & (~diffe[1]);
endmodule
