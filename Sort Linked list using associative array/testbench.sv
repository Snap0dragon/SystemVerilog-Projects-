// Code your testbench here
// or browse Examples

//typedef class rand_val;
typedef int list_int[$];


`include "monitor.svh"
`include "stimulus.svh"
 
module tb();
  monitor monitor_;
  psudo_dut psudo_dut;
  //monitor::monitor_disp monitor_disp;
  Stimulus stim;
  DUT dut;
  list_q queue_,queue_1;
  opcode_u oop;
  int c,d;
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);

    dut= new();
    stim = new();
    monitor_=new();
    psudo_dut =new();
    //monitor_disp =new();
    
    stim.generate_inputs();
    stim.generate_arg();

    
    $display(dut.run(NEW,{5,5,5,300}));

    $display(dut.run(SORT));

    

    
  end
endmodule
