module tb_ripple;
   reg clk;
   reg rstn;
   wire [3:0] out;

   ripple r0   (  .clk (clk),
                  .rstn (rstn),
                  .out (out));

   initial clk=0;
   always #5 clk = ~clk;

   initial begin
   $dumpfile("tb_ripple.vcd");
   $dumpvars(0,tb_ripple);
      rstn <= 0;
      clk <= 0;

      repeat (4) @ (posedge clk);
      rstn <= 1;

      repeat (25) @ (posedge clk);
      $finish;
   end
endmodule