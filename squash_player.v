`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 11:04:33 PM
// Design Name: 
// Module Name: squash_player
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


module squash_player(

    input clock,
    input leftplayer,
    input rightplayer,
    output [15:0] light,
    input reset,
    output reg [1:0] rightpscore,
    output reg gamestate //1 = in game | 0 = not in game;
    //output point
    );
    reg [1:0] rightppenalty;
    reg [1:0] leftppenalty;
    reg [1:0]serve;
    reg [1:0]nextserve; // 0 for right 1 for left
    wire [1:0]direction;
    reg dontinc;
    reg dontpen;
    
    reg penaltylight;
    
    reg speed;
    
    slow_ball b1(.clock(clock), .reset(reset), .leftdirection(rightplayer), .rightdirection(leftplayer), .light(light), .direction(direction), .serve(serve));
    
    always @ (posedge clock or negedge reset) begin
        if (!reset == 1'b1) begin
        rightpscore = 2'b00;
        rightppenalty <= 2'b00;
        serve <= 2'b01; //right serves
        dontinc <= 0;
        dontpen <= 0;
        gamestate <= 0;
        end
        else begin
        
        // serving logic
        
        //right player begins serve
        if (direction == 2'b00 && serve == 2'b01)begin
            if(rightplayer == 1'b1)begin
                rightpscore <= 2'b00;
                serve <= 2'b00;
                nextserve <= 2'b01;
                dontinc <= 1;
                dontpen <= 0;
                rightppenalty <= 2'b00;
                gamestate <= 1;
            end
        end
        
        ///////////////////////////////////////////////////
        //hitting score
        if(direction == 2'b01 && light == 16'b0000000000000001 && rightplayer == 1'b1 && !dontinc && serve == 2'b00)begin 
                 rightpscore <= rightpscore + 2'b01;
                dontinc = 1;
        end
        if (direction == 2'b01 && light == 16'b0000000000000010)begin
            dontinc = 0;
        end
        
        if(direction == 2'b10 && light == 16'b0000000000000001 && rightplayer == 1'b0 && !dontinc)begin 
                serve <= 2'b01;
        end
        
        
//////////////////////////penalty

    if (direction == 2'b10 && light != 16'b0000000000000001)begin
        if (rightplayer == 1'b1 && !dontpen)begin
            if (rightppenalty != 2'b10)begin
                rightppenalty <= rightppenalty + 2'b01;
                dontpen<=1;
            end
            else if (rightppenalty == 2'b10) begin
                serve <= 2'b01;
            end
        end
        else if (rightplayer == 1'b0 && dontpen) begin
                dontpen<=0;
        end
  end 

       
        
      end  
  end  
               
endmodule       
        

