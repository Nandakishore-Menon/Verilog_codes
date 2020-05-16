`timescale 1ns/1ps

//Assume the full adder shown below.
//Write a test bench to test it

module Full_Adder( 
  input D1, D2, Cin, 
  output Sum_out, Cout
  );  
    wire a1, a2, a3;    

xor u1(a1,D1,D2);
and u2(a2,D1,D2);
and u3(a3,a1,Cin);
or u4(Cout,a2,a3);
xor u5(Sum_out,a1,Cin); 

endmodule  

module tb_fadder;

    reg Data_in_D1;
    reg Data_in_D2;
    reg Data_in_Cin;
    
    wire Sum,Coutput;

    Full_Adder uut (
        .D1(Data_in_D1),
        .D2(Data_in_D2),
        .Cin(Data_in_Cin),
        .Sum_out(Sum),
        .Cout(Coutput)
    );

    initial begin
    $dumpfile ("Full_adder.vcd");
    $dumpvars(0, tb_fadder);
    
    Data_in_D1 = 0;
    Data_in_D2 = 0;
    Data_in_Cin = 0;
    
    #100

    Data_in_D1 = 0;     Data_in_D2 = 0;     Data_in_Cin = 1;  #10;
    Data_in_D1 = 0;     Data_in_D2 = 1;     Data_in_Cin = 0;  #10;
    Data_in_D1 = 0;     Data_in_D2 = 1;     Data_in_Cin = 1;  #10;
    Data_in_D1 = 1;     Data_in_D2 = 0;     Data_in_Cin = 0;  #10;
    Data_in_D1 = 1;     Data_in_D2 = 0;     Data_in_Cin = 1;  #10;
    Data_in_D1 = 1;     Data_in_D2 = 1;     Data_in_Cin = 0;  #10;
    Data_in_D1 = 1;     Data_in_D2 = 1;     Data_in_Cin = 1;  #10;
end

endmodule
    
    
