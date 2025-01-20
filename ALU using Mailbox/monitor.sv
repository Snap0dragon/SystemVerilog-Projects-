class Monitor;
  mailbox #(Transaction) gen2mon,dut2mon;
  DUT dut;
  Transaction txn;
  bit [3:0] p_sum;

  function new(mailbox #(Transaction) gen2mon, dut2mon);
    this.gen2mon = gen2mon;
    this.dut2mon = dut2mon;
  endfunction

  task monitor();
//     txn = new();
//     dut = new();
    gen2mon.get(txn);

     
    case(txn.op)
      ADD: txn.result = txn.a + txn.b;
      SUB: txn.result = txn.a - txn.b;
      INV: txn.result = ~txn.a;
      RED: txn.result = |txn.b;
      default: txn.result = 0;
    endcase
    
    
    $display("Psudo result -> %p[%b]",txn.result,txn.result);
    
    dut2mon.get(txn);  
    

      
    $display("A: %0d, B: %0d, Opcode: %0p, DUT Result: %0d, Expected: %0d, Match: %s", 
         txn.a, txn.b, txn.op, txn.result_dut, txn.result, 
         (txn.result_dut == txn.result) ? "YES" : "NO");

    $display("---------------------------------------");

      

  endtask
endclass