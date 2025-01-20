class Transaction;
  rand bit [3:0] a, b;
  rand opcode_u op;
  bit [4:0] result_dut, result;

  function new();
    this.randomize();
  endfunction
endclass