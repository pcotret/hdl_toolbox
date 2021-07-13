all:
	iverilog -g2005-sv -o ram_sim tb.v single_port_sync_ram.v
	vvp ram_sim
	gtkwave tb_ram.vcd   