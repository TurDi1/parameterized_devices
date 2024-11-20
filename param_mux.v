module param_mux
#(
   parameter N = 8
)
(
   a,
   s,
   f
);
// ===== Ports description =====
input    [N - 1 : 0] a;           // Data input bus
input    [$clog2(N) - 1 : 0]  s;  // Selector input bus
output                        f;  // Data output

// ===== Assignments =====
assign f = a[s];
//
endmodule 
