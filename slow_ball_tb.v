`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2023 11:57:49 PM
// Design Name: 
// Module Name: slow_ball_tb
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

module slow_ball_tb(

    );

    reg clock = 0;
    reg reset = 1;
    reg leftdirection = 0;
    reg rightdirection = 0;
    reg [1:0] serve = 0;
    wire [15:0] light;
    wire [1:0] direction;
    wire [2:0] hitnum;

    slow_ball sb1 (.clock(clock), .reset(reset), .leftdirection(leftdirection), .rightdirection(rightdirection), .serve(serve), .light(light), .direction(direction), .hitnum(hitnum));

    always begin
        #5 clock = ~clock;
    end

    always begin
        #10 reset = 0;
    end

    always begin
        #25 serve = serve + 1;
    end
    always begin
        #50 leftdirection = ~leftdirection;
    end
    always begin
        #75 rightdirection = ~rightdirection;
    end

endmodule
