bit [ 15:0 ] l = 16'h abed, m = 16'hcafe;
bit [ 31:0] lm_pack ;
lm_pack = { « byte{ l , m}}; // pack byte-size chunks
$display ("%h" , lm_pack); 
{ » { l , m } } = lm_pack;  // displays “fecacdab”
// unpack$display ("l=%h m=%h", l, m) ;// displays l=feca m=cdab
