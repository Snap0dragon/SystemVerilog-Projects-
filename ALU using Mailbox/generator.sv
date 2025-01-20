class Generator;
  mailbox #(Transaction) gen2mon;
  mailbox #(Transaction) gen2dut;
  Transaction txn;
	
  function new(mailbox #(Transaction) gen2mon, gen2dut);
    this.gen2mon = gen2mon;
    this.gen2dut = gen2dut;
    
  endfunction

  task generator();
    txn = new();
      
    $display("txn.a -> %p[%b]",txn.a,txn.a);
    $display("txn.b -> %p[%b]",txn.b,txn.b);
    $display("txn.op -> %p",txn.op);
    gen2mon.put(txn);
    gen2dut.put(txn);
      
  endtask
endclass