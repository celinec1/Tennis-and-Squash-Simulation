`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 05:17:38 PM
// Design Name: 
// Module Name: slow_ball
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


module slow_ball(
    input clock, 
    input reset, 
    input leftdirection, 
    input rightdirection,
    input [1:0]serve,
    output [15:0]light,
    output [1:0]direction
//    input [23:0]toggle_value
    
    );
    
    reg [25:0]toggle_value;
    wire slowclock;
    wire [2:0]hitnum;
    
    always @ (posedge clock)begin

    case(hitnum)
        3'b000: toggle_value <= 26'b00111111111111111111111111;
        3'b001: toggle_value <= 26'b00011111111111111111111111;
        3'b010: toggle_value <= 26'b00011111111110111111111111;
        3'b011: toggle_value <= 26'b00001111111111111111111111;        
        3'b100: toggle_value <= 26'b00001111111110111111111111;
        3'b101: toggle_value <= 26'b00000111111111111111111111;
        3'b110: toggle_value <= 26'b00000111111110111111111111;
        3'b111: toggle_value <= 26'b00000011111111111111111111;
    endcase
    end
    clk_divider slow1(.clk_in(clock), .rst(reset), .divided_clk(slowclock), .toggle_value(toggle_value));
    
    
   ball b1(.clock(slowclock), .reset(reset), .light(light), .rightdirection(rightdirection), .leftdirection(leftdirection), .serve(serve), .direction(direction), .hitnum(hitnum));
    endmodule
