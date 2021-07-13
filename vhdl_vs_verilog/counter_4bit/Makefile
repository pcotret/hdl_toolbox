all:
	iverilog -o counter_sim tb_counter.v counter.v
	vvp counter_sim
	gtkwave tb_counter.vcd   