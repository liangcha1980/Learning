`ifndef TB_TOP__SV
`define TB_TOP__SV
module M1(ck, enin, din, enout, dout);
 input         ck,enin;
 input  [31:0] din    ;
 output        enout  ;
 output [31:0] dout   ;

 clocking sd @(posedge ck);
   input  #2ns enin,din    ;    // signal will be sampled 2ns before posedge ck
   output #3ns enout, dout;     // signal will be drivn 3ns after posedge ck
 endclocking:sd

 reg [7:0] sab ;
 always @(sd) begin
   sab = sd.din[7:0];           // use "cb.xxx" for synchronous signals
 end

 always @(sd) begin
   sd.dout <=  {24'b0, sab};
   end
endmodule:M1

module tb;
  bit   [31:0] din;
  logic [31:0] dout;
  bit          ck=1'b1;
  
  // clock signals
  initial begin 
    #1ns;
    forever #10ns ck = ~ck;
    end

  // dut instantiate
  M1 I_M1(.ck(ck), .enin(enin), .din(din), .enout(enout), .dout(dout));

  always #20ns din++;

  initial begin
    repeat (500) @(posedge ck);
    $finish;
    end
  
endmodule
`endif
