module tlc(clk,r,ta,tb,ra,ya,ga,rb,yb,gb,state);

    input clk,r,ta,tb;
    parameter garb=3'b000,yarb=3'b001,yarb2=3'b010,ragb=3'b011,rayb=3'b100,rayb2=3'b101;
    output reg ra,ya,ga,rb,yb,gb;
    reg[2:0] next;
    output reg[2:0] state;
    always @(posedge clk or posedge r)
    begin
        if(r)
        begin
            state <= 3'b000;
        end
        else
        begin
            state<=next;
        end
    end
    always @(*)
    begin
    case(state)
    garb:
        begin
        ra<=0;
        ya<=0;
        ga<=1;
        rb<=1;
        yb<=0;
        gb<=0;
        if(ta)
            next=garb;
        else
            next= yarb;
        end
    yarb:
        begin
        ra<=0;
        ya<=1;
        ga<=0;
        rb<=1;
        yb<=0;
        gb<=0;
        next=yarb2;
        end
    yarb2:
        begin
        ra<=0;
        ya<=1;
        ga<=0;
        rb<=1;
        yb<=0;
        gb<=0;
        next=ragb;
        end
    ragb:
        begin
        ra<=1;
        ya<=0;
        ga<=0;
        rb<=0;
        yb<=0;
        gb<=1;
        if(tb)
            next=ragb;
        else
            next= rayb;
        end
    rayb:
        begin
        ra<=1;
        ya<=0;
        ga<=0;
        rb<=0;
        yb<=1;
        gb<=0;
        next=rayb2;
        end
    rayb2:
        begin
        ra<=1;
        ya<=0;
        ga<=0;
        rb<=0;
        yb<=1;
        gb<=0;
        next=garb;
        end

    default:next=garb;
    endcase
    end

endmodule

`timescale 1ns/1ps
module tlc_test;
reg a,b;
reg clock;
reg reset;
wire [2:0]st;
wire RA,RB,YA,YB,GA,GB;

tlc uut(clock,reset,a,b,RA,YA,GA,RB,YB,GB,st);

initial
begin
$dumpfile("tlc.vcd");
$dumpvars(0, tlc_test);
clock=0;
reset=1;
a=1;b=0;
end

always
begin
#5 reset=0;
#2 a=0;
#2 b=1;
#12 b=0;
#1 a=1;
#5 a=0;
#10 reset=1;
end

always
begin
#2 clock<=~clock;
end

endmodule
