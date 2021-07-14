clocking cb @(posedge clk)
  default input #1ns output #1ns; // input  #1ns: setup
                                  // output #1ns: clock-to-q
  output reset_n;
  output din;
  output frame_n;
  output valid_n;
  input  dout;
  input  busy_n;
  input  valido_n;
  input  frameo_n;
  
endclocking:cb