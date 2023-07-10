`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2023 03:00:08 AM
// Design Name: 
// Module Name: debouncer
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

module debouncer(
        output out,
        input clock, reset, btn
    );
    reg [13:0] deb_count;
    reg output_exist;
    parameter  MAX = 14'b11110100001001;
    parameter  CLEAN_MAX = 24'b111111111111111111111111;
    

    reg clean;
    reg [23:0] clean_count;
    
   
     
    always @(posedge clock or negedge reset) begin
        if(!reset == 1'b1) begin
            clean_count <= 0;
            clean <= 1'b0;
            deb_count <= 0;
            output_exist <= 1'b0;
        end 
        
        else if(btn == 1'b1) begin
            if (output_exist == 1'b0) begin
            if(deb_count == MAX) begin
                clean <= 1'b1;
                deb_count <= 1'b0;
                output_exist <= 1'b1;
            end 
            else begin
                deb_count <= deb_count + 1;
            end
        end 
        else begin
            if(clean_count == CLEAN_MAX) begin
                clean <= 1'b0;
                clean_count <= 1'b0;
            end
            else 
                clean_count <= clean_count + 1;
            end
            end else begin
                clean <=1'b0;
                deb_count<=1'b0;
                output_exist<=1'b0;
            end
        
end


   
assign out = clean;
   
endmodule



     
            
                
            
//endmodule