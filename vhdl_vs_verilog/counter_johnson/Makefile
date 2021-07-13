all:
	iverilog -o johnson_sim tb.v johnson_ctr.v
	vvp johnson_sim
	gtkwave tb_johnson.vcd   