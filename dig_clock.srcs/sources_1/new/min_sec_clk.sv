`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/24 22:10:19
// Design Name: 
// Module Name: min_sec_clk
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


module min_sec_clk(
    input sys_clk,
    input sys_rst_n,
    input start,
    output logic [7:0] min,
    output logic [7:0] sec
    );
    //��ʱ
    //startΪ1��ʾ�ڼ�ʱ��Ϊ0��ʾ��ͣ
    int cnt;//�����ж��ٸ�40����
    //logic [14:0] cnt;//�����ж��ٸ�����
    always_ff @(posedge sys_clk)begin
        if(!sys_rst_n)begin
            //��λ����ֵ
            cnt <= 0;
            min <= 0;
            sec <= 0;
        end
        else if(cnt == 24999999 && start == 1)begin
            //�Ƶ�һ����;
            cnt <= 0;
            sec <= sec + 1;//��һ��
            if(sec == 60)begin
                //����һ���ӣ�
                sec <= 0;
                min <= (min + 1) % 60;
            end
        end
        else if(start == 1)
            cnt <= cnt + 1'b1;
    end
endmodule
