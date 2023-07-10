`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 02:37:05 AM
// Design Name: 
// Module Name: player_tb
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


module player_tb(
    );
     reg clock;
    reg rightplayer;
    reg leftplayer;
    wire [1:0] leftpscore;
    wire [15:0] light;
    wire [1:0] rightpscore;
    reg reset;
    
    
    player p1(.clock(clock), .reset(reset), .rightplayer(rightplayer), .leftplayer(leftplayer), .light(light), .rightpscore(rightpscore), .leftpscore(leftpscore));
    
    initial begin
    
        clock = 0;
        reset = 1;
        rightplayer = 1;
        leftplayer = 1;
        
        #10 reset = 0;
    end
    
    always begin
        #20 clock = clock + 1'b1;
        
    end
    endmodule 