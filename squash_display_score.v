`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 12:11:33 AM
// Design Name: 
// Module Name: squash_display_score
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


module squash_display_score(
    input clock,reset,
    output [7:0] AN_Out,
    output [6:0] C_Out,
    input [1:0]rightpscore,
    input gamestate

    );
    
    reg [6:0]rightdisplay;
    reg [7:0] AN_In; 
    reg [55:0] C_In;
    
    parameter ZERO= 7'b0111111, ONE = 7'b0000110, TWO= 7'b1011011, THREE=7'b1001111, P= 7'b1110011;
    
    SevenSegmentLED SevenSegmentLED(.clk(clock),.rst(reset),.AN_In(AN_In),.C_In(C_In),.AN_Out(AN_Out),.C_Out(C_Out));
    
    
    always @ (posedge clock or negedge reset) begin
    if(!reset==1'b1)begin
        AN_In <= 8'h0;
        C_In <= 56'h0;
        rightdisplay <= 0;
    end
    else begin
        case(rightpscore)
        2'b00: rightdisplay <= ZERO;
        2'b01: rightdisplay <= ONE;
        2'b10: rightdisplay <= TWO;
        2'b11: rightdisplay <= THREE;
    endcase
    
    AN_In <= 8'b11111111;
    
    C_In <= {7'b0,7'b0,7'b0,7'b0,P,ONE,7'b0,rightdisplay};
    end
           
end

endmodule
