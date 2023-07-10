`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 05:01:04 PM
// Design Name: 
// Module Name: ball
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


module ball(
input clock,
input reset,
input leftdirection, 
input rightdirection,
input [1:0]serve,
output reg [1:0]direction,  // 2b'01 ball moves left  2'b10 ball moves right
output reg [15:0]light,
output reg [2:0]hitnum
    );

reg [4:0]counter;

always @ (posedge clock or negedge reset)
    begin
        //continuing ball movement
        if (!reset == 1'b1) begin 
            direction <= 2'b00;
            counter <= 5'b00001;
            light <= 16'b0000000000000001;
            hitnum <= 3'b000;
        end
        else begin
        
        //continuing ball movement
         if(direction == 2'b01)begin // ball moves left
            if (counter != 5'b10001) begin
                counter <= counter + 1'b1;
            end
        end
        else if (direction == 2'b10) begin // ball moves right
            if(counter != 5'b00000)begin
                counter <= counter - 1'b1;
            end
        end
        
        ///////////////////////////////////////////////////////////////
        
        //seeing if ball is hit at correct state
        if(direction == 2'b00)begin
            if(leftdirection == 1'b1)begin
                 direction <= 2'b01; // move left
            end
            else if(rightdirection == 1'b1)begin
                direction <= 2'b10; // move right
            end
        end
         else if(direction == 2'b01)begin // moving left
            if(counter == 5'b10000 && rightdirection == 1'b1)begin // correct hit input
                direction <= 2'b10; // move right
                hitnum <= hitnum + 3'b001;
            end
        end
        else if(direction == 2'b10)begin // moving right
            if(counter == 5'b00001 && leftdirection == 1'b1)begin // correct hit input
                direction <= 2'b01; // move left
                hitnum <= hitnum + 3'b001;
            end
        end
        
        //////////////////////////////////////////////////////////////
        
        //serving
        
        if(serve == 2'b01)begin
            counter <= 5'b00001;
            direction <= 2'b00;
            hitnum <= 3'b000;
        end
        else if(serve == 2'b10)begin
            counter <= 5'b10000;
            direction <= 2'b00;
            hitnum <= 3'b000;
        end
        
        /////////////////////////////////////////////////////////////////////////
                //setting the light value
        case (counter)
            5'b00000: light <= 16'b0000000000000000;
            5'b00001: light <= 16'b0000000000000001;
            5'b00010: light <= 16'b0000000000000010;
            5'b00011: light <= 16'b0000000000000100;
            5'b00100: light <= 16'b0000000000001000;
            5'b00101: light <= 16'b0000000000010000;
            5'b00110: light <= 16'b0000000000100000;
            5'b00111: light <= 16'b0000000001000000;
            5'b01000: light <= 16'b0000000010000000;
            5'b01001: light <= 16'b0000000100000000;
            5'b01010: light <= 16'b0000001000000000;
            5'b01011: light <= 16'b0000010000000000;
            5'b01100: light <= 16'b0000100000000000;
            5'b01101: light <= 16'b0001000000000000;
            5'b01110: light <= 16'b0010000000000000;
            5'b01111: light <= 16'b0100000000000000;
            5'b10000: light <= 16'b1000000000000000;
            5'b10001: light <= 16'b0000000000000000;


        endcase
      end
   end
       
endmodule
       
        
        
        
        
        
        
        
        