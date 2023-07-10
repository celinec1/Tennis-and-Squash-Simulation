`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 01:52:23 AM
// Design Name: 
// Module Name: game
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


module game(
    input clock,
    input leftplayer,
    input rightplayer,
    input tennisgame,
    input squashgame,
    input reset,
    output wire [15:0] light,
    output wire [7:0] AN_Out,
    output wire [6:0] C_Out
    );
    
    wire [15:0] t_light;
    wire [7:0] t_AN_Out;
    wire [6:0] t_C_Out;
    
    wire [15:0] s_light;
    wire [7:0] s_AN_Out;
    wire [6:0] s_C_Out;
    
    reg gamepick;// 1 = tennis | 0 = squash
    
    
    tennis t1(.clock(clock) ,.leftplayer(leftplayer), .rightplayer(rightplayer), .light(t_light), .reset(reset), .AN_Out(t_AN_Out), .C_Out(t_C_Out));
    squash s1(.clock(clock), .rightplayer(rightplayer), .light(s_light), .reset(reset), .AN_Out(s_AN_Out), .C_Out(s_C_Out));
    
    
    always @ (posedge clock or negedge reset) begin
        if(!reset==1'b1)begin
            gamepick <= 1;
            
        end
        else begin
            
            if(tennisgame == 1)begin
                gamepick = 1;
            end
            else if(squashgame == 1)begin
                gamepick = 0;
            end
            
        end
    end
    
    assign {light, AN_Out, C_Out} = gamepick ? {t_light, t_AN_Out, t_C_Out} : {s_light, s_AN_Out, s_C_Out};

    
    
endmodule
