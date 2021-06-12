`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/24 22:43:14
// Design Name: 
// Module Name: continue_stop
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


module continue_stop(
    input posedge_flag,
    input sys_rst_n,
    output logic con
    );
    //����һ��Ϊ��ͣ���ٰ�һ��Ϊ����
    int cnt;
    //assign cnt = 0;
    always_ff @(posedge posedge_flag) begin
        if(!sys_rst_n)begin
            cnt <= 0;
        end
        else begin
            cnt <= (cnt + 1) % 2;//0Ϊ��ͣ��1Ϊ��ʼ
            con <= cnt;
        end
     end
endmodule
