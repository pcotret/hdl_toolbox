module tb;
  parameter N = 4;
  
  reg clk;
  reg rstn;
  wire [N-1:0] out;
  
  gray_ctr u0 (	.clk(clk),
               .rstn(rstn),
               .out(out));
  
  initial clk=0;
  always #10 clk = ~clk;
  
  initial begin
   $dumpfile("tb_gray.vcd");
   $dumpvars(0,tb);
    {clk, rstn} <= 0;
    
    $monitor ("T=%0t rstn=%0b out=0x%0h", $time, rstn, out);
    
    repeat(2) @ (posedge clk);
    rstn <= 1;
    repeat(20) @ (posedge clk);
    $finish;
  end
endmodule