# T flip-flop

![img](t_sim.png)

```makefile
all:
	iverilog -o t_sim t_ff.v tb_t.v
	vvp t_sim
	gtkwave tb_t.vcd   
```

