module fsm(clk,r,in,out,state);

   input clk, r, in;
   output out;

   output reg [1:0] state;
   reg out;

   always @(posedge clk or posedge r)
   begin
   if(r)
   begin
       state <= 2'b00;
       out <= 0;
   end
   else
   begin
       case(state)
       2'b00:
       begin
            if(in)
            begin
               state<= 2'b10;
               out<= 0;
            end
            else
            begin
                state<= 2'b01;
                out<= 0;
            end
   end

       2'b01:
       begin
            if(in)
            begin
                state<= 2'b10;
                out<= 1;
            end
            else
            begin
               state<= 2'b01;
               out<= 0;
            end

       end

       2'b10:
       begin
            if(in)
            begin
                state<= 2'b10;
                out<= 0;
            end
            else
            begin
               state<= 2'b01;
               out<= 1;
            end

       end

       default:
       begin
            state<= 2'b00;
            out<= 0;
       end
     endcase
   end
   end

endmodule

`timescale 1ns/1ps
module fsm_test;
reg Input;
reg clk;
reg reset;
wire Output;
wire [1:0] st;
fsm uut (clk,reset,Input,Output,st);
initial
begin
$dumpfile("fsm.vcd");
$dumpvars(0, fsm_test);
Input=0;
reset=1;
clk=0;
end
always
begin
#5 reset=0;
#6 reset =1;
Input=1;
#4 reset=0;
#6 Input=0;
#4 Input=1;
#4 reset=1;
end

always
begin
#2 clk<=~clk;
end


endmodule
