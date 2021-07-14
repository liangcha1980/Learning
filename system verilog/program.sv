program automatic test(router_io.TB rtr_io) // Pass interface in port list re
    //testbench code in initial block:
    initial begin // Only initial blocks allowed in programs
        run () ;
    end           // when all initial block finish, program will automatically implicitly invoke $finish;

    task run();
    endtask: run
endprogram: test