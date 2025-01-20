
typedef int list_int[$];


`include "monitor.svh"
`include "stimulus.svh"
 
module tb();
  monitor monitor_;
  psudo_dut psudo_dut;

  Stimulus stim;
  DUT dut;
  list_q queue_,queue_1;
  opcode_u oop;
  int c,d;
  
  
  initial begin

    dut= new();
    stim = new();
    monitor_=new();
    psudo_dut =new();

    
    stim.generate_inputs();
    stim.generate_arg();
    
   
    
    
    
    repeat (20) begin
      stim.generate_inputs();
      stim.generate_arg();
      queue_1 = stim.queue_arg;
      queue_=stim.queue_data;
      oop=stim.opcode();
      $display("--------------------------------------------------");
      $display("Arg queue: %p", queue_1);
      $display("Data queue: %p", queue_);
      $display("Opcode: %p",oop);
      
      monitor_.check(queue_,dut.run(NEW,queue_),NEW);
      monitor_.check(queue_1,dut.run(oop,queue_1),oop);
      $display("--------------------------------------------------");
      stim.queue_data= {};
      stim.queue_arg= {};
    end
    
    
    
    $display(psudo_dut.run(NEW,{5,6,5,6}));

    $display(psudo_dut.run(FIND,{5}));


    
  end
endmodule
