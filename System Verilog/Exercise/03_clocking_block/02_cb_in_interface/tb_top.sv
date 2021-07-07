`ifndef TB_TOP__SV
`define TB_TOP__SV
interface dut_interface (input ck);
  logic        enin;
  logic [31:0] din;
  logic        enout;
  logic [31:0] dout;

  clocking cb@(posedge ck);
    default input #3ns output #2ns;
    output enin, din;
    input  enout, dout;
  endclocking: cb

  modport tb (clocking cb);

endinterface: dut_interface

program test(dut_interface.tb dut_if);

  int          din;
  logic [31:0] sampled_dout;

  initial begin
    din = 0;
    forever @(dut_if.cb) din++;
    end
  initial begin
    dut_if.cb.din <= '0;
    forever @(dut_if.cb) dut_if.cb.din <= din;
    end
  initial forever @(dut_if.cb) begin 
            sampled_dout <= dut_if.cb.dout; // sample
            end
    
endprogram

module M1(ck, enin, din, enout, dout);
 input         ck,enin;
 input  [31:0] din    ;
 output        enout  ;
 output [31:0] dout   ;
 reg    [31:0] dout   ;

 reg [7:0] sab ;
 always @(posedge ck) begin
   sab = din[7:0];           // use "cb.xxx" for synchronous signals
 end

 always @(sab) begin
   #19ns;
   dout =  {24'b0, sab};
   end
endmodule:M1

module tb;
  bit          ck=1'b1;
  dut_interface dut_if(ck);
  test t0(dut_if);
 
  // clock signals
  initial begin 
    #1ns;
    forever #10ns ck = ~ck;
    end

  // dut instantiate
  M1 I_M1(.ck(ck), .enin(dut_if.enin), .din(dut_if.din), .enout(dut_if.enout), .dout(dut_if.dout));


  initial begin
    repeat (500) @(posedge ck);
    $finish;
    end
  
endmodule
`endif
