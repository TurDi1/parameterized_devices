module param_dec #(
    parameter input_width = 2,  // Number of input bits of input bus
    parameter output_width = 4  // Number of output bits of output bus
)
(
    x,
    y
);
// |============ PORTS DESCRIPTION ============|
input   [input_width - 1 : 0]   x;
output  [output_width - 1 : 0]  y;

// |============ WIRE'S, REG'S AND ETC ============|
reg [output_width - 1 : 0]  y_reg;  // Reg for output bus of decoder

// |============ ASSIGNMENTS ============|
assign y = y_reg;

// |============ LOGIC SECTION ============|
always @(x)
begin
    y_reg <= {{output_width - 1{1'b0}}, 1'b1} << x;
end

endmodule