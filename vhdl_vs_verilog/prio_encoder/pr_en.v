module pr_en ( input [7:0] a,
               input [7:0] b,
               input [7:0] c,
               input [7:0] d,
               input [1:0] sel,
               output reg [7:0] out);

   always @ (a or b or c or d or sel) begin
      if (sel == 2'b00)
         out <= a;
      else if (sel == 2'b01) 
         out <= b;
      else if (sel == 2'b10)
         out <= c;
      else 
         out <= d;
   end
endmodule