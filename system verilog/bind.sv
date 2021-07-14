bind router_test_top test t(router_test_top.top_io);
bind router_test_top router dut(
  .reset_n(router_test_top.top_io.reset_n),
  .clock(router_test_top.top_io.clock),
  ...
  .frameo_n(router_test_top.top_io.frameo_n)
  );
module router_test_top;
  parameter simulation_cycle=100;
  reg SystemClock;
  router_io top_io(SystemClock);
/*  
  test router_test(top_io);
  router dut(
    .reset_ja(top_io.reset_n),
    .clock(top_io.clock),
    ...
    .frameo_n(top_io.frameo_n)
    );
*/
endmodule:router_testtop