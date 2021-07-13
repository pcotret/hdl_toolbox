all:
	iverilog -o modn_sim tb.v modN_ctr.v
	vvp modn_sim
	gtkwave tb_modn.vcd   