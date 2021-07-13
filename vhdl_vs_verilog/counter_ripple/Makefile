all:
	iverilog -o ripple_sim tb_ripple.v dff.v
	vvp ripple_sim
	gtkwave tb_ripple.vcd   