all:
	iverilog -o gray_sim tb.v gray_ctr.v
	vvp gray_sim
	gtkwave tb_gray.vcd   