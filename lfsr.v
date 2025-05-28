module lfsr #(
    parameter N = 8 // Length of lfsr register
)
(
    rst,
    clk,
    num
);
//==================================
//        PORTS DESCRIPTION
//==================================
input                 rst;  // System reset input
input                 clk;  // System clock input
output  [N - 1 : 0]   num;  // Output bus with pseudorandom number

//==================================
//      WIRE'S, REG'S and etc       
//==================================
reg     [N - 1 : 0]   lfsr_reg;
reg                   taps_result;

//==================================
//           ASSIGNMENTS
//==================================
assign num = lfsr_reg;

//==================================
//              LOGIC
//==================================
always @(*)
begin
    case(N)
        3   : taps_result = lfsr_reg[2] ~^ lfsr_reg[1];
        4   : taps_result = lfsr_reg[3] ~^ lfsr_reg[2];
        5   : taps_result = lfsr_reg[4] ~^ lfsr_reg[2];
        6   : taps_result = lfsr_reg[5] ~^ lfsr_reg[4];
        7   : taps_result = lfsr_reg[6] ~^ lfsr_reg[5];
        8   : taps_result = lfsr_reg[7] ~^ lfsr_reg[5] ~^ lfsr_reg[4] ~^ lfsr_reg[3];
        9   : taps_result = lfsr_reg[8] ~^ lfsr_reg[4];
        10  : taps_result = lfsr_reg[9] ~^ lfsr_reg[6];
    endcase
end

always @(negedge rst or posedge clk)
begin
    if (!rst)
        lfsr_reg <= 'd1;
    else
        lfsr_reg <= {lfsr_reg[N - 2 : 0], taps_result};
end    
endmodule
