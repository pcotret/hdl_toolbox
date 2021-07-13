module tb_t;
  reg clk;
  reg rstn;
  reg t;
  
  t_ff u0 (	.clk(clk),
          	.rstn(rstn),
          	.t(t),
          .q(q));

  integer i=0;
  reg [4:0] dly;
  
  initial clk=0;
  always #5 clk = ~clk;
  
  initial begin  
   $dumpfile("tb_t.vcd");
   $dumpvars(0,tb_t);
    {rstn, clk, t} <= 0;
    
    $monitor ("T=%0t rstn=%0b t=%0d q=%0d", $time, rstn, t, q);
    repeat(2) @(posedge clk);
    rstn <= 1;
    
    for (i = 0; i < 20; i = i+1) begin
      dly = $random;
      #(dly) t <= $random;
    end
	#20 $finish;
  end
endmodule