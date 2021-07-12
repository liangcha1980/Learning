program automatic test;
    import uvm_pkg::*;
    // include the test files
    `include "test_collection.sv"
    initial begin
        run_test();
    end
endprogram

// simulation: 
// simv +UVM_TESTNAME=test_base
