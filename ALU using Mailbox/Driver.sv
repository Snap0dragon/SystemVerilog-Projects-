class Driver;
  mailbox #(Transaction) gen2dut, dut2mon;
  DUT dut;
  Transaction txn;

  function new(mailbox #(Transaction) gen2dut, mailbox #(Transaction) dut2mon);
    this.gen2dut = gen2dut;
    this.dut2mon = dut2mon;
  endfunction

  task driver();
    dut = new();

    gen2dut.get(txn);         
    dut.add(txn.a, txn.b, txn.op); 
    txn.result_dut = dut.sum;
    $display("Dut result -> %p[%b]",txn.result_dut,txn.result_dut);
    dut2mon.put(txn);         
  endtask
endclass