interface router_io (input bit clock);
  // named bundle of asynchronous signals
  logic reset n,
  logic [25:0] din;
  logic [ 15:01 frame n;
  logic [15:0] valid n;
  logic [15:0] dou t;
  logic [15:01 busy n;
  logic [ 15:01 valldo n;
  logic [15:01 frameo n;
  
  // create synchronous behavior by placing into clocking block
  clocking cb @(posedge clock)
    default input #2ns output #1ns ; // output #1ns: drive skew before edge of clock
	                                 // input #2ns: sample skew after edge of clock
                                     // If not specified, default is "default input #1step output #0"									 
    output reset_n ;
    output din;
    output frame_n;
    output valid_n ;
    input dout;
    input busy_n;
    input valido_n ;
    input frameo_n;
  endclocking

  // define access and direction with modport
  modport IB(clocking cb, output reset_n); // clocking cb: synchronous signals
                                           // reset_n: asynchronous signal
endinterface

program automatic test (router_io.TB rtr_io);
  //testbenqh code in initial block
  initial begin
    reset ();
  end
  
  task reset();
    rtr_io.reset_n = 1'bO;
    rtr_io.cb.frame_n <= 16'hffff;  // synchronous drive must be rst_io.cb.xxx <=
    rtr_io.cb.valid_n <= ~('b0) ;
    //reset_n can be both synchronous and asynchronous
    ##2 rtr_io.cb.reset_n <= 1'bl;
    repeat(15) @(rtr_io.cb);
  endtask: reset
endprogram: test

module router ( reset_n,
                clock,
				frame_n,
				valid_n,
				din,
				dout,
				busy_n,
				valido_n,
				frameo_n);
	...
endmodule: router

module router_test_top ;
  parameter simulation_cycle = 10ns;
  bit SystemClock ;
  always #(simulation_cycle/2) SystemClock = ~SystemClock;
  router_io top_io (SystemClock);
  test router_test (top_io) ;
  router dut (.reset_n(top_io.reset_n) ,
              .clock(top_io.clock),
              .frame_n(top_io.frame_n) ,
              .valid_n(top_io.valid_n) ,
              .din(top_io.din) ,
              .dout(top_io.dout) ,
              .busy_n(top_io.busy_n) ,
              .valido_n(top_io.valido_n) ,
              .frameo_n(top_io.frameo_n)) ;
endmodule: router test top