`timescale 1ns/1ps

module mux2 (in0,in1,select,out);

input in0,in1,select;
output out;
wire s0,w0,w1;

not n1 (s0,select);
and a1 (w0,s0,in0);
and a2 (w1,select,in1);
or g3 (out,w0,w1);

endmodule

module mux4 (in0,in1,in2,in3,select1,select2,out);

input in0,in1,in2,in3,select1,select2;
output out;
wire mout1,mout2;

mux2 m1 (in0,in1,select1,mout1);
mux2 m2 (in2,in3,select1,mout2);
mux2 m3 (mout1,mout2,select2,out);

endmodule

module tb_mux4;

    reg Data_in_0;
    reg Data_in_1;
    reg Data_in_2;
    reg Data_in_3;
    reg sel0;
    reg sel1;
    
    wire Data_out;
    
    mux4 uut (
        .in0(Data_in_0),
        .in1(Data_in_1),
        .in2(Data_in_2),
        .in3(Data_in_3),
        .select1(sel0),
        .select2(sel1),
        .out(Data_out)
    );

    initial begin
    $dumpfile ("mux4_out.vcd");
    $dumpvars(0, tb_mux4);
    
    Data_in_0 = 0;
    Data_in_1 = 0;
    Data_in_2 = 0;
    Data_in_3 = 0;
    sel0 = 0;
    sel1 = 0;
    
    #100
    
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 0;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 0;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 0;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 0;    Data_in_3 = 1;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 0;  sel0 = 1;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 0;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 0;     sel1 = 1;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 1;     sel1 = 0;  #10;
    Data_in_0 = 1;      Data_in_1 = 1;    Data_in_2 = 1;    Data_in_3 = 1;  sel0 = 1;     sel1 = 1;  #10;
end
    
endmodule
