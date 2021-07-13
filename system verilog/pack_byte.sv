bit [15:0] l = 16'habed, m = 16'hcafe;
bit [31:0] lm_pack ;
lm_pack = {<< byte { l , m}};  // pack byte-size chunks
$display ("%h" , lm_pack);    // displays “fecacdab”
{ >> { l , m }} = lm_pack;    // unpack
$display ("l=%h m=%h", l, m) ;// displays l=feca m=cdab
