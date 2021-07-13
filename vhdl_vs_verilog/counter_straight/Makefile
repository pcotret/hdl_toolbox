all:
	iverilog -o ring_sim tb.v ring_ctr.v
	vvp ring_sim
	gtkwave tb_ring.vcd   