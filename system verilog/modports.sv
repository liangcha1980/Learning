interface router_io(input bit clock);
  logic reset_n;
  
  clocking cb 0 (posedge clock) ;
    default input #lns output #lns;
    output reset_n;
    output valid_n;
  endclocking
  
  modport DUT(input reset_n, input din, output dout, ...) ;
  modport TB(clocking cb, output reset_n);
endinterface: router_io

program automatic test(router_io.TB rtr_io) ;
  initial begin
    rtr_±o.reset_n <= I'hO;
    rtr_io.cb.valid_n <= ~('b0) ;
  end
endprogram: test

module router(
  bit clk;
  always #50ns clk = ~clk;
  
  ronter_xo.DUT dnt_io, input bit clk) ;
endmodule: router