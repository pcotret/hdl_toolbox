module tb_d;
	reg clk;
	reg d;
	reg rstn;
	reg [2:0] delay;
	
    d_ff  d_ff0 ( .d(d),
                .rstn (rstn),
                .clk (clk),
                .q (q));

   integer i=0;
    // Generate clock
    initial clk=0;
    always #10 clk = ~clk;
                   
    // Testcase
    initial begin
    	clk <= 0;
    	d <= 0;
    	rstn <= 0;
    	
    	#15 d <= 1;
    	#10 rstn <= 1;
    	for (i = 0; i < 5; i=i+1) begin
    		delay = $random;
    		#(delay) d <= i;
    	end
    end
endmodule