`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 05:58:51 PM
// Design Name: 
// Module Name: player
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


module player(
    input clock,
    input leftplayer,
    input rightplayer,
    output [15:0] light,
    input reset,
    output reg [1:0] rightpscore,
    output reg [1:0] leftpscore,
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
        leftpscore = 2'b00;
        rightppenalty <= 2'b00;
        leftppenalty <= 2'b00;
        serve <= 2'b01; //right serves
        nextserve <= 2'b10; //nextserve
        dontinc <= 0;
        dontpen <= 0;
        gamestate <= 0;
        end
        else begin
        
        // serving logic
        
        //right player begins serve
        if (direction == 2'b00 && serve == 2'b01)begin
            if(rightplayer == 1'b1)begin
                if(gamestate == 0)begin
                    leftpscore = 2'b00;
                    rightpscore = 2'b00;
                end
                serve <= 2'b00;
                nextserve <= 2'b10;
                dontinc <= 0;
                dontpen <= 0;
                leftppenalty <= 2'b00;
                rightppenalty <= 2'b00;
                gamestate <= 1;
            end
        end
        //left player begins serve
        else if (direction == 2'b00 && serve == 2'b10)begin 
                if(leftplayer == 1'b1)begin
                    if(gamestate == 0)begin
                        leftpscore = 2'b00;
                        rightpscore = 2'b00;
                    end
                    serve <= 2'b00;
                    nextserve <= 2'b01;
                    dontinc <= 0;
                    dontpen <= 0;
                    leftppenalty <= 2'b00;
                    rightppenalty <= 2'b00;
                    gamestate <= 1;
                end
            end
        
        ///////////////////////////////////////////////////
        //hitting score
        if(direction == 2'b10 && light == 16'b0000000000000001 && rightplayer != 1'b1 && !dontinc )begin // moving right & rightplayer & missed hit
                leftpscore = leftpscore + 2'b01;
                serve <= nextserve;
                dontinc <= 1;
        end
        
        else if(direction == 2'b01 && light == 16'b1000000000000000 && leftplayer != 1'b1 && !dontinc)begin // moving left & leftplayer & missed hit
                rightpscore = rightpscore + 2'b01;
                serve <= nextserve;
                dontinc <= 1;
        end
       

        ///////////////////////////////////////////////////
        //penalty score

    if (direction == 2'b10 && light != 16'b0000000000000001)begin
        if (rightplayer == 1'b1 && !dontpen)begin
            if (rightppenalty != 2'b10)begin
                rightppenalty <= rightppenalty + 2'b01;
                dontpen<=1;
            end
            else if (rightppenalty == 2'b10) begin
                leftpscore = leftpscore +2'b01;
                rightppenalty <= 2'b00;
                serve <= 2'b10;
            end
        end
        else if (rightplayer == 1'b0 && dontpen) begin
                dontpen<=0;
        end
  end 
        
    if (direction == 2'b01 && light != 16'b1000000000000000)begin
        if (leftplayer == 1'b1 && !dontpen)begin
            if (leftppenalty != 2'b10)begin
                leftppenalty <= leftppenalty + 2'b01;
                dontpen<=1;
            end
            else if (leftppenalty == 2'b10) begin
                rightpscore = rightpscore +2'b01;
                leftppenalty <= 2'b00;
                serve <= 2'b01;
            end
        end
        else if (leftplayer == 1'b0 && dontpen) begin
                dontpen<=0;
        end
    end 
  
 
        
///////////if leftplayer wins thus right will serve
        if (leftpscore == 2'b11)begin
            serve <= 2'b01;
            gamestate <= 0;
        end
        else if (rightpscore == 2'b11)begin
            serve <= 2'b10;
            gamestate <= 0;
        end
        
      end  
  end  
               
endmodule       
        

