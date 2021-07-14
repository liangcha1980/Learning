initial begin: proc_user_args
  int user_seed;
    if ($value$plusargs("ntb_random_seed=%d",user_seed))
      $display("User seed is %d" , user_seed);
    else
      $display("Using default seed");
end: proc_user_args