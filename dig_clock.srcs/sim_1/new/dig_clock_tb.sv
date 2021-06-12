`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 16:31:25
// Design Name: 
// Module Name: dig_clock_tb
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

`define CLK_PERIOD 40
module dig_clock_tb();
    logic sys_clk, sys_rst_n, i_start;
    logic [3 : 0]    an;
    logic [7 : 0]    a_to_g;
    dig_clock dut( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .i_start(i_start), .an(an), .a_to_g(a_to_g) );
    // 时钟、复位、输入数据初始化，复位信号生成
    initial begin
        sys_clk <= 1'b0;
        sys_rst_n <= 1'b0;
        i_start <= 1'b0;
        #100;
        sys_rst_n <= 1'b1;
    end
    always #(`CLK_PERIOD/2) sys_clk = ~sys_clk;//产生时钟
    initial begin//产生测试激励
        //@(posedge sys_rst_n);   @(posedge sys_clk);
        //@(posedge sys_clk);             #10;sys_rst_n <= 1'b1;
        @(posedge sys_clk);             #522;i_start <= 1'b1;
        //@(posedge sys_clk);             #82;i_start <= 1'b0;
        @(posedge sys_clk);             #2000000;sys_rst_n <= 1'b0;
        @(posedge sys_clk);             #2000000;sys_rst_n <= 1'b1;
        //@(posedge sys_clk);     
        //#30;                    $finish;
    end
    initial begin
        $timeformat(-9, 0, "ns", 5);
        $monitor("At time %t:sys_rst_n = %b, an = %b, a_to_g = %b", $time, sys_rst_n, an, a_to_g);
    end
endmodule
