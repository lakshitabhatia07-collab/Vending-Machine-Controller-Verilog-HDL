module stimulas;
  reg clk;
  reg reset ;
  reg[1:0] in;
  wire [1:0] out;
  wire [1:0] change;
  //instation
  vending_machine v0(
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out),
    .change(change)
  );
  initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1,stimulas);
    reset=1;
    clk=1;
    #6 in=1;
    #11 in=1;
    #25 $finish;
  end
  always #5 clk=~clk;
    endmodule
