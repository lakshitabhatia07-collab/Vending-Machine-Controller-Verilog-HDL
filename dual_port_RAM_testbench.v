module stimulas();
  reg[7:0] data_a,data_b;
  reg [5:0] addr_a, addr_b;
  reg we_a,we_b;
  reg clk;
  wire [7:0] q_a,q_b;
  
  dual_port_ram d0(.data_a(data_a),
                   .data_b(data_b),
                   .addr_a(addr_a),
                   .addr_b(addr_b),
                           .we_a(we_a),
                           .we_b(we_b),
                           .clk(clk),
                           .q_a(q_a),
                           .q_b(q_b)
                  );
  
  initial
    begin
      $dumpfile("dump.vcd");
    $dumpvars(1,stimulas);
      clk=1'b1;
      forever #50 clk=~clk;
    end
  initial
    begin
      data_a=8'h55;
      addr_a=6'h01;
      
      data_b=8'h66;
      addr_b=6'h02;
      
      we_a=1'b1;//write
      we_b=1'b1;//write
      
      #100
      //read data from addr port b
      addr_a=6'h02;
      addr_b=6'h01;
      
      we_a=1'b0;
      we_b=1'b0;
      
      #100
      $stop;
    end
  endmodule
