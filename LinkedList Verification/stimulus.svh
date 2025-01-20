class rand_val;  
  local rand bit[0:4] val;
  function bit[0:4] random_generator();
    this.randomize();
    return val;
  endfunction
endclass

class rand_size;  
  local rand bit[0:4] val;
  constraint val_c {
    val > 2;
  }
  function bit[0:4] random_generator();
    this.randomize();
    return val;
  endfunction
endclass

class rand_op;
  rand opcode_u all_opcodes;
  constraint all_opcodes_c {
    all_opcodes inside {TRAVERSE, FIND, INSERT, DELETE, LEN, REVERSE};
  }
  function void random_op();   
    this.randomize();
  endfunction
endclass
  
class Stimulus;
  opcode_u all_opcodes[$] = {TRAVERSE, FIND, INSERT, DELETE, LEN, REVERSE};
  rand_val randval;
  rand_op rand_oop;
  rand_size rand_size;
  rand bit [0:7] queue_data[$], queue_arg[$];
  
  function void generate_inputs();
    randval = new();
    
    repeat(randval.random_generator()) begin
      queue_data.push_front(randval.random_generator()); 
    end

  endfunction
  
  function void generate_arg();
    rand_size = new();
    repeat(rand_size.random_generator()) begin
      queue_arg.push_front(randval.random_generator()); 
    end

  endfunction
  
  function opcode_u opcode();
    rand_oop = new();
    rand_oop.random_op();

    return rand_oop.all_opcodes;
  endfunction
  

endclass
