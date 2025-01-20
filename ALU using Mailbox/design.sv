typedef enum bit [1:0] {ADD, SUB, INV, RED} opcode_u;

class DUT;
  bit [4:0] sum;
  

  function void add(bit [3:0] a, bit [3:0] b, opcode_u op);
    case(op)
      ADD: sum = a + b;                 
      SUB: sum = a - b;                      
      INV: sum = ~a;                         
      RED: sum = |b;                        
      default: sum = '0;                     
    endcase
  endfunction

endclass
