class Packet;
  //Declare random properties in class
  randc bit [1:0] sa, da;
  rand bit [1:0] payload [] ;
  function Packet copy() ;
  endfunction: copy
endclass : Packet

program automatic test;
  int run_for_n_pkts = 10;
  Packet pkt = new();    // Construct an object to be randomized
  string str;
  initial begin
    $display("seed = %0d", $get_initial_random_seed);
    for (int i=0; i<run_for_n_pkts; i++) begin
      if (pkt.randomize() with {payload.size <10;})    // randomize content of object
      $display("============%0d===============", i);
      $display("pkt.sa = 0x%0h", pkt.sa);
      $display("pkt.da = 0x%0h", pkt.da);
      $swriteh(str, "%0p", pkt.payload);
      $display("pkt.payload size=%0d, payload = 0x%s", pkt.payload.size(), str);
    end
  end
endprogram: test
