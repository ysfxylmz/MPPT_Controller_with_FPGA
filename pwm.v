//////////////////////////////////////////////////////////////////////////////////
// Company: Rising Edge
// Engineer: Yusuf YILMAZ
// 
// Create Date: 12/22/2022 11:44:31 PM
// Design Name: 
// Module Name: pwm
// Project Name: MPPT Controller
// Target Devices: Nexys 4 DDR
// Tool Versions: Vivado 2021.1
// Description: This verilog HDL generates PWM.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pwm
    #(parameter RESOLUTION=8)
(
    input [RESOLUTION-1:0] duty_i,
    input clk_i,
    input reset_i,
    output pwm_o
    );


    

reg temp;
reg [RESOLUTION-1:0] counter=0;
assign  pwm_o=temp;
    always @(posedge clk_i)
    begin
        if(!reset_i)
        begin
            counter<=counter+1;
            if(counter>= {RESOLUTION{1'b1}})
            begin 
                counter<=0;
            end
            if(counter<duty_i)
            begin 
                temp<=1;
            end else begin
                temp<=0;
            end
        end else begin
            counter<=0;
            temp<=0;
        end
    end
endmodule
