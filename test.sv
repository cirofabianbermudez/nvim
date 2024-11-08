module test1
  class abc;
    rand int a = 10;
    function void print_a();
      $display("abc: a = ", a);
    endfunction
  endclass

  class xyz extends abc;
    function void print_a();
      $display("xyz: a = ", a);
    endfunction
  endclass: abc

  initial begin
    abc o1 = new();
    xyz o2 = new();
    o1 = o2;
    o1.print_a();
  end

endmodule: test1
