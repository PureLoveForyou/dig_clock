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
    
    clken CLKEN( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .clk_flag(EnClk) );//1kHZ的使能时钟
    an_ctrl An(.sys_clk(EnClk), .sys_rst_n(sys_rst_n), .an(an));//控制四个使能端
    
    edge_det Start( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .i_btn(i_start), .posedge_flag(posedge_flag) );//检测i_start的上升沿
    continue_stop c_s_sinal(  .posedge_flag(posedge_flag), .sys_rst_n(sys_rst_n), .con(start_out));//检查是否进行暂停和开始的切换
    
    min_sec_clk Min_Sec( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .start(start_out), .min(min), .sec(sec) );//计时
    
    bin2bcd_0 transfer_time0(.bin(min), .bcd(min_bcd));//转换分为10进制数
    bin2bcd_0 transfer_time1(.bin(sec), .bcd(sec_bcd));//转换秒为10进制数

    FourLights FL( .an(an), .a_to_g(a_to_g), .min_bcd(min_bcd), .sec_bcd(sec_bcd) );//控制4个七段数码管
endmodule