`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 12:36:15 AM
// Design Name: 
// Module Name: squash_player_tb
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


module squash_player_tb(

    );
    
    reg clock;
    reg rightplayer;
    reg leftplayer;
    
    wire [15:0] light;
    wire [1:0] rightpscore;
    reg reset;
    
    
    squash_player sp1(.clock(clock), .reset(reset), .rightplayer(rightplayer), .leftplayer(leftplayer), .light(light), .rightpscore(rightpscore));
    
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