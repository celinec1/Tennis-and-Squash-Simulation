//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 04/25/2023 11:58:04 PM
//// Design Name: 
//// Module Name: ball_tb
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module ball_tb(

//    );
//    reg clock;
//    reg reset;
//    reg leftdirection;
//    reg rightdirection;
//    reg [1:0]serve;
//    wire [1:0]direction;
//    wire [15:0]light;
//    wire [2:0]hitnum; 

//ball b1(.clock(clock), .reset(reset), .light(light), .rightdirection(rightdirection), .leftdirection(leftdirection), .serve(serve), .direction(direction), .hitnum(hitnum));

//initial 
//    begin 
//    clock = 0;
//    reset = 1;
//    serve = 2'b01;
//    leftdirection=1;
//    rightdirection=0;
    
//    #50
//    reset=0;
//    end
    
//    always begin
//    #600 
//    leftdirection = leftdirection + 1;
//    rightdirection = rightdirection + 1;
//    end
    
//    always begin
//    #300
//    serve = serve + 2'b01;
//    end
    
//    always begin 
//    #20 clock = clock+1'b1;
//    end 
    
    

//endmodule
`timescale 1ns / 1ps

module ball_tb(

);

    reg clock;
    reg reset;
    reg leftdirection;
    reg rightdirection;
    reg [1:0] serve;
    wire [1:0] direction;
    wire [15:0] light;
    wire [2:0] hitnum;
    
    ball b1 (.clock(clock), .reset(reset), .leftdirection(leftdirection), .rightdirection(rightdirection), .serve(serve), .direction(direction), .light(light), .hitnum(hitnum));
    
    initial begin
        clock = 0;
        reset = 1;
        leftdirection = 0;
        rightdirection = 0;
        serve = 2'b01;
    
        #10 reset = 0;
        leftdirection = 1;
        #10
        serve = 2'b00;
        #500
        leftdirection = 0;
        #500
    
        // ball served to the left
        serve = 2'b01;
        #100;
        rightdirection = 1;
        #500;
    
        // ball served to the right
        serve = 2'b10;
        #100;
        serve = 2'b00;
        #500;
    
        // ball hit left when moving left
        leftdirection = 1;
        #40000;
    
        // ball hit right when moving left
        leftdirection = 0;
        rightdirection = 1;
        #40000;
    
        // ball hit right when moving right
        rightdirection = 0;
       // direction = 2'b10;
        leftdirection = 1;
        #40000;
    
        // ball hit left when moving right
        leftdirection = 0;
        rightdirection = 1;
        #40000;
    end
    
    always begin
        #5 clock = clock + 1'b1;
    end

endmodule

