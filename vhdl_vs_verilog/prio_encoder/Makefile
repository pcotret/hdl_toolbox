all:
	iverilog -o prio_sim tb_4to1_mux.v pr_en.v
	vvp prio_sim
	gtkwave tb_prio.vcd   