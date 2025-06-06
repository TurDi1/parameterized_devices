module ero_trng (
    rst_,
    en,
    prn
);
//==================================
//        PORTS DESCRIPTION
//==================================
input   rst_;   // System reset input
input   en;     // Enable input for ring osc
output  prn;    // Pseudo random number output

//==================================
//      WIRE'S, REG'S and etc       
//==================================
wire    RO0_wire;
wire    RO0_divided_wire;
wire    RO1_wire;

reg     prn_reg;

//==================================
//              LOGIC
//==================================
always @(posedge RO0_divided_wire)
begin
    prn_reg <= RO1_wire;
end

//==================================
//          INSTATIATIONS
//==================================
divider #(
    .K(16)
) div (
    .rst_       ( rst_ ),
    .clk_in     ( RO0_wire ),
    .clk_out    ( RO0_divided_wire )
);

ring_osc RO1 (
    .en         ( en ),
    .out        ( RO1_wire )
);

ring_osc RO0 (
    .en         ( en ),
    .out        ( RO0_wire )
);
endmodule
