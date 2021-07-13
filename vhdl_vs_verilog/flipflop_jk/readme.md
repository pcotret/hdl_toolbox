# JK flip-flop

![jk](tb_jk.png)

```makefile
all:
	iverilog -o jk_sim jk_ff.v tb_jk.v
	vvp jk_sim
	gtkwave tb_jk.vcd   
```

