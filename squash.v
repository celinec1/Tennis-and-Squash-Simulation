`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 10:22:42 PM
// Design Name: 
// Module Name: squash
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


module squash(
    input clock, 
    input rightplayer,
    
    output [15:0] light,
    input reset,
    output [7:0] AN_Out,
    output [6:0] C_Out
    );
    
    wire [1:0] rightpscore;
    wire [1:0] leftpscore;
    wire cleanleftplayer;
    wire cleanrightplayer;
    wire gamestate; // 1 = ingame, 0 = not ingame
    
    wire slowclock;
    wire slowclock2;
    
    wire leftplayer = 1;
    debouncer d2(.clock(clock), .reset(reset), .btn(rightplayer), .out(cleanrightplayer));
    squash_player p(.clock(clock), .reset(reset), .light(light), .leftplayer(leftplayer), .rightplayer(cleanrightplayer), .rightpscore(rightpscore), .gamestate(gamestate));
    squash_display_score display1(.clock(clock), .reset(reset), .AN_Out(AN_Out), .C_Out(C_Out), .rightpscore(rightpscore), . gamestate(gamestate));
    
    
    
endmodule
