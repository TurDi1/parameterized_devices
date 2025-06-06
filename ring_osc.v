module ring_osc #(
    parameter N = 3 // Length of ring oscillator
)
(
    en,
    out
);
//==================================
//        PORTS DESCRIPTION
//==================================
input       en;  // Enable input of ring oscillator
output      out; // Output of ring oscillator

//==================================
//      WIRE'S, REG'S and etc       
//==================================
wire    [N - 1 : 0]    not_wire;

//==================================
//           ASSIGNMENTS
//==================================
assign out = not_wire[N - 1];

//==================================
//              LOGIC
//==================================
genvar i;

generate
    for (i = 0; i < N; i = i +1)
    begin
        if (i == 0)
            not(not_wire[i], ~(en & not_wire[N - 1]));
        else
            not(not_wire[i], not_wire[i-1]);
    end
endgenerate
endmodule
