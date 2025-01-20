
`include "Transaction.sv"
`include "generator.sv"
`include "monitor.sv"
`include "Driver.sv"


module tb;
  mailbox #(Transaction) gen2mon;
  mailbox #(Transaction) gen2dut;
  mailbox #(Transaction) dut2mon;
  Generator gen;
  Monitor mon;
  Driver div;

  

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb_ALU);

    gen2mon = new(1);
    gen2dut = new(1);
    dut2mon = new(1);
    
    gen = new(gen2mon, gen2dut);
    mon = new(gen2mon, dut2mon);
    div = new(gen2dut, dut2mon);
    repeat(5) begin 
    fork
      div.driver();
      mon.monitor();
      gen.generator();
      
    join
    end

    $finish;
  end
endmodule
