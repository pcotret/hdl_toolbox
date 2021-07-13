all:
	iverilog -o fulladd_sim tb_fulladd.v fulladd.v
	vvp fulladd_sim
	gtkwave tb_fulladd.vcd   