module reset_synchronizer #(
    parameter num_ff = 2    // Number of flip-flops
)
(
    clk,
    areset,
    reset
);
//==================================
//        PORTS DESCRIPTION
//==================================
input   clk;    // System clock input
input   areset; // Active low asynchronous reset
output  reset;  // Synchronized reset

//==================================
//      WIRE'S, REG'S and etc       
//==================================
reg    [num_ff - 1 : 0]    ff;

//==================================
//           ASSIGNMENTS
//==================================
assign reset = ff[num_ff - 1];

//==================================
//              LOGIC
//==================================
always @(posedge clk)
begin
    ff  <= {ff[num_ff - 2], areset};
end
endmodule
