interface simple_bus(input bit clk) ;
  logic       req, gnt  ;
  logic [7:0] addr      ;
  wire  [7:0] data      ;
  logic [2:0] mode      ;
  logic       start, rdy;
endinterface

module cpu (simple_bus sb);
  ...
endmodule: cpu

program automatic test(simple_bus sb);
  ...
endprogram

module top;
  logic elk = 0;
  always #20 elk = \clk;
  
  sinxple_bus sb(clk) ;
  test tl(sb);
  cpu cl(sb) ;
endmodule