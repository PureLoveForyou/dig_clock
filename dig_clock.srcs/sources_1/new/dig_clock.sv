`timescale 1ns / 1ps

module dig_clock(
    input                   sys_clk,
    input                   sys_rst_n,
    input                   i_start,
    output logic [3 : 0]    an,
    output logic [7 : 0]    a_to_g
    );
    logic EnClk;
    logic posedge_flag, start_out;
    logic [7:0] min, sec;
    logic [7:0] min_bcd, sec_bcd;
    
    clken CLKEN( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .clk_flag(EnClk) );//1kHZ��ʹ��ʱ��
    an_ctrl An(.sys_clk(EnClk), .sys_rst_n(sys_rst_n), .an(an));//�����ĸ�ʹ�ܶ�
    
    edge_det Start( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .i_btn(i_start), .posedge_flag(posedge_flag) );//���i_start��������
    continue_stop c_s_sinal(  .posedge_flag(posedge_flag), .sys_rst_n(sys_rst_n), .con(start_out));//����Ƿ������ͣ�Ϳ�ʼ���л�
    
    min_sec_clk Min_Sec( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .start(start_out), .min(min), .sec(sec) );//��ʱ
    
    bin2bcd_0 transfer_time0(.bin(min), .bcd(min_bcd));//ת����Ϊ10������
    bin2bcd_0 transfer_time1(.bin(sec), .bcd(sec_bcd));//ת����Ϊ10������

    FourLights FL( .an(an), .a_to_g(a_to_g), .min_bcd(min_bcd), .sec_bcd(sec_bcd) );//����4���߶������
endmodule