module param_counter #(
   parameter MOD = 40000
)
(
   rst_,
   clk,
   en
   q
);
// ===== Ports description =====
input                           rst_;    // Active LOW reset input
input                           clk;     // Clock input
input                           en;      // Enable input
output   [$clog2(MOD) -1 : 0]   q;       // Counter bus output with value

// ===== Some parameters =====
localparam N = MOD/32768;

// ===== Wire's, reg's, etc =====
generate
   if (MOD <= 32768)
   begin
      reg   [$clog2(MOD) -1 : 0]   counter;
      wire                         enable;
      wire  [15 : 0]               q_out_wire;

      assign enable = en;
      assign q = counter;

      always @(posedge clk or negedge rst_)
      begin
         if (!rst_)
            counter <= 0;
         else if (enable)

         else if (counter == MOD)
            counter <= 0;
         else if (enable)
            counter <= counter + 1;
         else
            counter <= counter;
      end
   end
   else
   begin
      reg   [15 : 0]   counter_16_bit [N : 0];
      wire  [N : 0]    enable;
      wire  [15 : 0]   q_out_wire [N : 0];      
   end
endgenerate


//
// always @(posedge clk or negedge rst_)
// begin
//    if (!rst_)
//       lsb_counter <= 0;
//    else
//       lsb_counter <= lsb_counter + 1;
// end
// //
// always @(posedge clk or negedge rst_)
// begin
//    if (!rst_)
//       first_counter <= 0;
//    else if (lsb_counter == 8'hFF)
//       first_counter <= first_counter + 1;
//    else
//       first_counter <= first_counter;
// end
// //
// always @(posedge clk or negedge rst_)
// begin
//    if (!rst_)
//       second_counter <= 0;
//    else if (first_counter == 8'hFF)
//       second_counter <= second_counter + 1;
//    else
//       second_counter <= second_counter;
// end
// //
// always @(posedge clk or negedge rst_)
// begin
//    if (!rst_)
//       msb_counter <= 0;
//    else if (second_counter == 8'hFF)
//       msb_counter <= msb_counter + 1;
//    else
//       msb_counter <= msb_counter;
// end
// endmodule
