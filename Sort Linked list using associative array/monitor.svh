
class psudo_dut;
  static list_q list;
  static list_int list_,list_1,list1;
    
    function list_int run(opcode_u op, list_q list = {});
      case(op)
        NEW: return new_(list); 
        TRAVERSE: return traverse();
        FIND: return find(list[0]); 
        INSERT: return insert(list[0],list[1]);
        DELETE: return delete(list[0]); 
        LEN: return len();
        REVERSE: return reverse(); 
        default: return {};
      endcase
    endfunction
    
    function list_int new_(list_q x);
      list_={};
      $display("CHECKING [NEW] METHOD");
      foreach(x[i]) begin
        list_[i]=int'(x[i]);
      end
      return list_;
    endfunction
    
    function list_int traverse();
      $display("CHECKING [TRAVERSE] METHOD");
      return list_;
    endfunction
    
    function list_int find(bit[0:7] var1);
      list_1=list_.find_index(x) with (x==int'(var1));
      //$display(monitor::list_);
      $display("CHECKING [FIND] METHOD");
      $display("Finding all index of [%0p] in list [%0p]",var1,list_);
      if (list_1.size()==0) begin
        return {-1};
      end
      else begin
        return list_1;
      end
    endfunction
    
    function list_int insert(bit[0:7] var1,bit[0:7] var2);
      list_1=list_.find_index(x) with (x==int'(var1));
      $display("CHECKING [INSERT] METHOD");
      $display("Insert [%p] after [%p] in list %p",var2,var1,list_);
      if (list_1.size()!=0) begin
        list_.insert(list_1[0]+1,var2);
        return list_;
      end
      else return list_;
    endfunction
    
    function list_int delete(bit[0:7] var1);
      list_1=list_.find_index(x) with (x==int'(var1));
      $display("CHECKING [DELETE] METHOD");
      $display("Delete [%0p] from the list [%p]",var1,list_);
      if (list_1.size()!=0) begin
        list_.delete(list_1[0]);
        return list_;
      end
      else return list_;
    endfunction
    
    function list_int len();
      $display("CHECKING [LEN] METHOD");
      return {list_.size()};
    endfunction
    
    function list_int reverse();
      $display("CHECKING [REVERSE] METHOD");
      list_.reverse();
      return list_;
    endfunction
    
endclass

class monitor;
  psudo_dut psudo_dut;
  list_int list_n,list1;
  function void check(list_q list_m,list_q list_d, opcode_u op);
      psudo_dut = new();
      list_n = psudo_dut.run(op, list_m);
      list1={};
      foreach(list_d[i]) begin
        list1[i]=int'(list_d[i]);
      end  
    if (list_n == list1) begin
        $display("Pass: [PSUDO_DUT] %p == [DUT] %p", list_n, list1);
      end else begin
        $display("Fail: [PSUDO_DUT] %p != [DUT] %p", list_n, list1);
      end
  endfunction
    
  
  
endclass