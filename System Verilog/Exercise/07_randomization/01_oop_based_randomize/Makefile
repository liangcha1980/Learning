seed ?= 1   # if seed is not defined, then seed = 1
clean:
	rm -rf 64 AN.DB csrc DVEfiles simv* ucli.key vcdplus.vpd *.log vector.output work.lib*
vcs:
	vcs +notimingchecks -sverilog -full64 -unit_timescale=1ps/1ps -j4 -lca -debug_pp -CFLAGS -DVCS +lint=TFIPC-L +vcs+lic+wait -l vcs.log +vcs+vcdpluson tb_top.sv
sim:
	simv -l simv.log +ntb_random_seed=$(seed)
run:
	make vcs 
	make sim
