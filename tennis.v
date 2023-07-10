`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 09:27:17 PM
// Design Name: 
// Module Name: tennis
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


module tennis(
    input clock,
    input leftplayer,
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
    
        
        debouncer d1(.clock(clock), .reset(reset), .btn(leftplayer), .out(cleanleftplayer));
        debouncer d2(.clock(clock), .reset(reset), .btn(rightplayer), .out(cleanrightplayer));
        player p(.clock(clock), .reset(reset), .light(light), .leftplayer(cleanleftplayer), .rightplayer(cleanrightplayer), .rightpscore(rightpscore), .leftpscore(leftpscore), .gamestate(gamestate));
        display_score display1(.clock(clock), .reset(reset), .AN_Out(AN_Out), .C_Out(C_Out), .rightpscore(rightpscore), .leftpscore(leftpscore),. gamestate(gamestate));

        
endmodule




