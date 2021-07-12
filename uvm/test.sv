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
// uvm_root singleton will construct and execute test defined by +UVM_TESTNAME
