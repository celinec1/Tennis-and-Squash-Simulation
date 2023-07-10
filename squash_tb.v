`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 12:26:58 AM
// Design Name: 
// Module Name: squash_tb
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


module squash_tb(

    );
    
    reg clock;
    reg rightplayer;
    
    wire [15:0] light;
    reg reset;
    wire [7:0] AN_Out;
    wire [6:0] C_Out;
    
    
    squash s1(.clock(clock), .reset(reset), .rightplayer(rightplayer), .light(light), .AN_Out(AN_Out), .C_Out(C_Out));
    
    initial begin
    
        clock = 0;
        reset = 1;
        rightplayer = 1;
        
        #10 reset = 0;
    end
    
    always begin
        #20 clock = clock + 1'b1;
        
    end
        
        
    
endmodule
