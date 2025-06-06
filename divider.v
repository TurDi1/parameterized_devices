module divider #(
    parameter K = 16    // Divide factor
)
(
    rst_,    
    clk_in,
    clk_out
);
//==================================
//        PORTS DESCRIPTION
//==================================
input   rst_;
input   clk_in;
output  clk_out;

//==================================
//      WIRE'S, REG'S and etc       
//==================================
reg    [$clog2(K) - 1 : 0]    div_cnt;

//==================================
//           ASSIGNMENTS
//==================================
assign clk_out = div_cnt[$clog2(K) - 1];

//==================================
//              LOGIC
//==================================
always @(posedge clk_in or negedge rst_)
begin
    if (!rst_)
        div_cnt <= 0;
    else
        div_cnt <= div_cnt + 1;
end
endmodule
