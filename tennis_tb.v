`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 03:41:24 AM
// Design Name: 
// Module Name: tennis_tb
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


module tennis_tb(

    );
    
    reg clock;
    reg rightplayer;
    reg leftplayer;
    
    wire [15:0] light;
    reg reset;
    wire [7:0] AN_Out;
    wire [6:0] C_Out;
    
    
    tennis t1(.clock(clock), .reset(reset), .rightplayer(rightplayer), .leftplayer(leftplayer), .light(light), .AN_Out(AN_Out), .C_Out(C_Out));
    
    initial begin
    
        clock = 0;
        reset = 1;
        rightplayer = 1;
        leftplayer = 0;
        
        #10 reset = 0;
    end
    
    always begin
        #20 clock = clock + 1'b1;
        
    end
    
    always begin 
        #100 {rightplayer, leftplayer} = {rightplayer, leftplayer} + 1'b1;
    end
        
        
    
endmodule
