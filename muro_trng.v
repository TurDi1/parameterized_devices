module muro_trng #(
    parameter t = 4     // Number of ring osc
)
(
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
wire                   RO0_divided_wire;
wire    [t - 1 : 0]    RO_wire;

reg     [t - 1 : 1]    ff;
reg                    prn_reg;

//==================================
//           ASSIGNMENTS
//==================================
assign prn = prn_reg;

//==================================
//              LOGIC
//==================================
genvar i;
generate
    for (i = 0; i < t; i=i+1)
    begin
        ring_osc ring (
            .en         ( en ),
            .out        ( RO_wire[i] )
        );

        if ((i != 0) && (i != (t - 1)))
        begin
            always @(posedge RO0_divided_wire)
            begin
                ff[i] <= RO_wire[i];
            end
        end
    end

    always @(posedge RO0_divided_wire)
    begin
        prn_reg <= ^ff;
    end
endgenerate

//==================================
//          INSTATIATIONS
//==================================
divider #(
    .K(16)
) div (
    .rst_       ( rst_ ),
    .clk_in     ( RO_wire[0] ),
    .clk_out    ( RO0_divided_wire )
);
endmodule
