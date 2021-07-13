module ring_ctr  #(parameter WIDTH=4) 
  (  
	input clk,                
	input rstn,
  	output reg [WIDTH-1:0] out
  );    
 
  integer i=0;

  always @ (posedge clk) begin
      if (!rstn)
         out <= 1;
      else begin
        out[WIDTH-1] <= out[0];
        for (i = 0; i < WIDTH-1; i=i+1) begin
          out[i] <= out[i+1];
        end
      end
  end
endmodule
