`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 10:28:50 PM
// Design Name: 
// Module Name: display_score
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


module display_score(
    input clock,reset,
    output [7:0] AN_Out,
    output [6:0] C_Out,
    input [1:0]rightpscore,
    input [1:0]leftpscore,
    input gamestate

    );
    
    reg [6:0]rightdisplay;
    reg [6:0]leftdisplay;
    reg [7:0] AN_In; 
    reg [55:0] C_In;
    
    parameter ZERO= 7'b0111111, ONE = 7'b0000110, TWO= 7'b1011011, THREE=7'b1001111, P= 7'b1110011;
    
    SevenSegmentLED SevenSegmentLED(.clk(clock),.rst(reset),.AN_In(AN_In),.C_In(C_In),.AN_Out(AN_Out),.C_Out(C_Out));
    
    
    always @ (posedge clock or negedge reset) begin
    if(!reset==1'b1)begin
        AN_In <= 8'h0;
        C_In <= 56'h0;
        rightdisplay <= 0;
        leftdisplay <= 0;
    end
    else begin
        case(rightpscore)
        2'b00: rightdisplay <= ZERO;
        2'b01: rightdisplay <= ONE;
        2'b10: rightdisplay <= TWO;
        2'b11: rightdisplay <= THREE;
    endcase
    
    case(leftpscore)
        2'b00: leftdisplay <= ZERO;
        2'b01: leftdisplay <= ONE;
        2'b10: leftdisplay <= TWO;
        2'b11: leftdisplay <= THREE;
    endcase
    
    AN_In <= 8'b11111111;
    
    
        if(leftpscore != 2'b11 && rightpscore != 2'b11)begin 
            C_In <= {P,ONE,7'b0,leftdisplay,P,TWO,7'b0,rightdisplay};
        end
        else if(leftpscore == 2'b11 && gamestate == 0)begin
            C_In <= {P,ONE,7'b0,7'b0,P,ONE,7'b0,7'b0};
        end
        else if(rightpscore == 2'b11  && gamestate == 0)begin
            C_In <= {P,TWO,7'b0,7'b0,P,TWO,7'b0,7'b0};
        end
    end
           
end

endmodule
