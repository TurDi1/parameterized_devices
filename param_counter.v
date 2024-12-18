module param_counter (
   rst_,
   clk,
   q
);
// ===== Ports description =====
input             rst_;    // Active LOW reset input
input             clk;     // Clock input
output   [31:0]   q;       // Counter bus output with value

// ===== Wire's, reg's, etc =====
reg      [7:0]   lsb_counter, first_counter, second_counter, msb_counter;

// ===== Assignments =====
assign value = {msb_counter, second_counter, first_counter, lsb_counter};

//
always @(posedge clk or negedge rst_)
begin
   if (!rst_)
      lsb_counter <= 0;
   else
      lsb_counter <= lsb_counter + 1;
end
//
always @(posedge clk or negedge rst_)
begin
   if (!rst_)
      first_counter <= 0;
   else if (lsb_counter == 8'hFF)
      first_counter <= first_counter + 1;
   else
      first_counter <= first_counter;
end
//
always @(posedge clk or negedge rst_)
begin
   if (!rst_)
      second_counter <= 0;
   else if (first_counter == 8'hFF)
      second_counter <= second_counter + 1;
   else
      second_counter <= second_counter;
end
//
always @(posedge clk or negedge rst_)
begin
   if (!rst_)
      msb_counter <= 0;
   else if (second_counter == 8'hFF)
      msb_counter <= msb_counter + 1;
   else
      msb_counter <= msb_counter;
end
endmodule