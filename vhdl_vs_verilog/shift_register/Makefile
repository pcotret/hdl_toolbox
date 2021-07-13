all:
	iverilog -o shift_sim tb_sr.v shift_reg.v
	vvp shift_sim
	gtkwave tb_shift.vcd   