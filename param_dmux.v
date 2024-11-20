module param_dmux #(
   parameter N = 8
)
(
   i,
   s,
   f
);
// ===== Port description =====
input                         i; // Data input
input    [$clog2(N) - 1 : 0]  s; // Selector input bus
output   [N - 1 : 0]          f; // Data output bus

// ===== Wire's, reg's, etc =====
reg   [N - 1 : 0]  f_reg;        // Internal register for logic 

// ===== Assignments =====
assign f = f_reg;

// ===== Combinational logic =====
always @ (*)
begin
   f_reg     <= 0;
   f_reg[s]  <= i;
end
endmodule 
