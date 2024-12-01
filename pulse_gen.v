// Pulse generator module
// ======================
module pulse_gen (
   clk,
   inp_trig,
   out_pulse
);
// ===== Ports description =====
input    clk;        // Clock input
input    inp_trig;   // Input trigger signal 
output   out_pulse;  // Output pulse signal 

// ===== Wire's, reg's, etc =====
reg   [1:0]    flip_flops; // Flip-Flop's using for creating generator

// ===== Assignments =====
assign out_pulse = flip_flops[0] & ~flip_flops[1];

// ===== Logic =====
always @ (posedge clk)
begin
   flip_flops <= {flip_flops[0], inp_trig};
end
endmodule 
