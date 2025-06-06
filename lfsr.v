// Module based on XAPP052 document from Xilinx

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
always @*
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
        11  : taps_result = lfsr_reg[10] ~^ lfsr_reg[8];
        12  : taps_result = lfsr_reg[11] ~^ lfsr_reg[5] ~^ lfsr_reg[3] ~^ lfsr_reg[0];
        13  : taps_result = lfsr_reg[12] ~^ lfsr_reg[3] ~^ lfsr_reg[2] ~^ lfsr_reg[0];
        14  : taps_result = lfsr_reg[13] ~^ lfsr_reg[4] ~^ lfsr_reg[2] ~^ lfsr_reg[0];
        15  : taps_result = lfsr_reg[14] ~^ lfsr_reg[13];
        16  : taps_result = lfsr_reg[15] ~^ lfsr_reg[14] ~^ lfsr_reg[12] ~^ lfsr_reg[3];
        17  : taps_result = lfsr_reg[16] ~^ lfsr_reg[13];
        18  : taps_result = lfsr_reg[17] ~^ lfsr_reg[10];
        19  : taps_result = lfsr_reg[18] ~^ lfsr_reg[5] ~^ lfsr_reg[1] ~^ lfsr_reg[0];
        20  : taps_result = lfsr_reg[19] ~^ lfsr_reg[16];
        21  : taps_result = lfsr_reg[20] ~^ lfsr_reg[18];
        22  : taps_result = lfsr_reg[21] ~^ lfsr_reg[20];
        23  : taps_result = lfsr_reg[22] ~^ lfsr_reg[17];
        24  : taps_result = lfsr_reg[23] ~^ lfsr_reg[22] ~^ lfsr_reg[21] ~^ lfsr_reg[16];
        25  : taps_result = lfsr_reg[24] ~^ lfsr_reg[21];
        26  : taps_result = lfsr_reg[25] ~^ lfsr_reg[5] ~^ lfsr_reg[1] ~^ lfsr_reg[0];
        27  : taps_result = lfsr_reg[26] ~^ lfsr_reg[4] ~^ lfsr_reg[1] ~^ lfsr_reg[0];
        28  : taps_result = lfsr_reg[27] ~^ lfsr_reg[24];
        29  : taps_result = lfsr_reg[28] ~^ lfsr_reg[26];
        30  : taps_result = lfsr_reg[29] ~^ lfsr_reg[5] ~^ lfsr_reg[3] ~^ lfsr_reg[0];
        31  : taps_result = lfsr_reg[30] ~^ lfsr_reg[27];
        32  : taps_result = lfsr_reg[31] ~^ lfsr_reg[21] ~^ lfsr_reg[1] ~^ lfsr_reg[0];
        33  : taps_result = lfsr_reg[32] ~^ lfsr_reg[19];
        34  : taps_result = lfsr_reg[33] ~^ lfsr_reg[26] ~^ lfsr_reg[1] ~^ lfsr_reg[0];
        35  : taps_result = lfsr_reg[34] ~^ lfsr_reg[32];
        36  : taps_result = lfsr_reg[35] ~^ lfsr_reg[24];
        37  : taps_result = lfsr_reg[36] ~^ lfsr_reg[4] ~^ lfsr_reg[3] ~^ lfsr_reg[2] ~^ lfsr_reg[1] ~^ lfsr_reg[0];
        38  : taps_result = lfsr_reg[37] ~^ lfsr_reg[5] ~^ lfsr_reg[4] ~^ lfsr_reg[0];
        39  : taps_result = lfsr_reg[38] ~^ lfsr_reg[34];
        40  : taps_result = lfsr_reg[39] ~^ lfsr_reg[37] ~^ lfsr_reg[20] ~^ lfsr_reg[18];
        41  : taps_result = lfsr_reg[40] ~^ lfsr_reg[37];
        42  : taps_result = lfsr_reg[41] ~^ lfsr_reg[40] ~^ lfsr_reg[19] ~^ lfsr_reg[18];
        43  : taps_result = lfsr_reg[42] ~^ lfsr_reg[41] ~^ lfsr_reg[37] ~^ lfsr_reg[36];
        44  : taps_result = lfsr_reg[43] ~^ lfsr_reg[42] ~^ lfsr_reg[17] ~^ lfsr_reg[16];
        45  : taps_result = lfsr_reg[44] ~^ lfsr_reg[43] ~^ lfsr_reg[41] ~^ lfsr_reg[40];
        46  : taps_result = lfsr_reg[45] ~^ lfsr_reg[44] ~^ lfsr_reg[25] ~^ lfsr_reg[24];
        47  : taps_result = lfsr_reg[46] ~^ lfsr_reg[41];
        48  : taps_result = lfsr_reg[47] ~^ lfsr_reg[46] ~^ lfsr_reg[20] ~^ lfsr_reg[19];
        49  : taps_result = lfsr_reg[48] ~^ lfsr_reg[39];
        50  : taps_result = lfsr_reg[49] ~^ lfsr_reg[48] ~^ lfsr_reg[23] ~^ lfsr_reg[22];
        51  : taps_result = lfsr_reg[50] ~^ lfsr_reg[49] ~^ lfsr_reg[35] ~^ lfsr_reg[34];
        52  : taps_result = lfsr_reg[51] ~^ lfsr_reg[48];
        53  : taps_result = lfsr_reg[52] ~^ lfsr_reg[51] ~^ lfsr_reg[37] ~^ lfsr_reg[36];
        54  : taps_result = lfsr_reg[53] ~^ lfsr_reg[52] ~^ lfsr_reg[17] ~^ lfsr_reg[16];
        55  : taps_result = lfsr_reg[54] ~^ lfsr_reg[30];
        56  : taps_result = lfsr_reg[55] ~^ lfsr_reg[54] ~^ lfsr_reg[34] ~^ lfsr_reg[33];
        57  : taps_result = lfsr_reg[56] ~^ lfsr_reg[49];
        58  : taps_result = lfsr_reg[57] ~^ lfsr_reg[38];
        59  : taps_result = lfsr_reg[58] ~^ lfsr_reg[57] ~^ lfsr_reg[37] ~^ lfsr_reg[36];
        60  : taps_result = lfsr_reg[59] ~^ lfsr_reg[58];
        61  : taps_result = lfsr_reg[60] ~^ lfsr_reg[59] ~^ lfsr_reg[45] ~^ lfsr_reg[44];
        62  : taps_result = lfsr_reg[61] ~^ lfsr_reg[60] ~^ lfsr_reg[5] ~^ lfsr_reg[4];
        63  : taps_result = lfsr_reg[62] ~^ lfsr_reg[61];
        64  : taps_result = lfsr_reg[63] ~^ lfsr_reg[62] ~^ lfsr_reg[60] ~^ lfsr_reg[59];
        65  : taps_result = lfsr_reg[64] ~^ lfsr_reg[46];
        66  : taps_result = lfsr_reg[65] ~^ lfsr_reg[64] ~^ lfsr_reg[56] ~^ lfsr_reg[55];
        67  : taps_result = lfsr_reg[66] ~^ lfsr_reg[65] ~^ lfsr_reg[57] ~^ lfsr_reg[56];
        68  : taps_result = lfsr_reg[67] ~^ lfsr_reg[58];
        69  : taps_result = lfsr_reg[68] ~^ lfsr_reg[66] ~^ lfsr_reg[41] ~^ lfsr_reg[39];
        70  : taps_result = lfsr_reg[69] ~^ lfsr_reg[68] ~^ lfsr_reg[54] ~^ lfsr_reg[53];
        71  : taps_result = lfsr_reg[70] ~^ lfsr_reg[64];
        72  : taps_result = lfsr_reg[71] ~^ lfsr_reg[65] ~^ lfsr_reg[24] ~^ lfsr_reg[18];
        73  : taps_result = lfsr_reg[72] ~^ lfsr_reg[47];
        74  : taps_result = lfsr_reg[73] ~^ lfsr_reg[72] ~^ lfsr_reg[58] ~^ lfsr_reg[57];
        75  : taps_result = lfsr_reg[74] ~^ lfsr_reg[73] ~^ lfsr_reg[64] ~^ lfsr_reg[63];
        76  : taps_result = lfsr_reg[75] ~^ lfsr_reg[74] ~^ lfsr_reg[40] ~^ lfsr_reg[39];
        77  : taps_result = lfsr_reg[76] ~^ lfsr_reg[75] ~^ lfsr_reg[46] ~^ lfsr_reg[45];
        78  : taps_result = lfsr_reg[77] ~^ lfsr_reg[76] ~^ lfsr_reg[58] ~^ lfsr_reg[57];
        79  : taps_result = lfsr_reg[78] ~^ lfsr_reg[69];
        80  : taps_result = lfsr_reg[79] ~^ lfsr_reg[78] ~^ lfsr_reg[42] ~^ lfsr_reg[41];
        81  : taps_result = lfsr_reg[80] ~^ lfsr_reg[76];
        82  : taps_result = lfsr_reg[81] ~^ lfsr_reg[78] ~^ lfsr_reg[46] ~^ lfsr_reg[43];
        83  : taps_result = lfsr_reg[82] ~^ lfsr_reg[81] ~^ lfsr_reg[37] ~^ lfsr_reg[36];
        84  : taps_result = lfsr_reg[83] ~^ lfsr_reg[70];
        85  : taps_result = lfsr_reg[84] ~^ lfsr_reg[83] ~^ lfsr_reg[57] ~^ lfsr_reg[56];
        86  : taps_result = lfsr_reg[85] ~^ lfsr_reg[84] ~^ lfsr_reg[73] ~^ lfsr_reg[72];
        87  : taps_result = lfsr_reg[86] ~^ lfsr_reg[73];
        88  : taps_result = lfsr_reg[87] ~^ lfsr_reg[86] ~^ lfsr_reg[16] ~^ lfsr_reg[15];
        89  : taps_result = lfsr_reg[88] ~^ lfsr_reg[50];
        90  : taps_result = lfsr_reg[89] ~^ lfsr_reg[88] ~^ lfsr_reg[71] ~^ lfsr_reg[70];
        91  : taps_result = lfsr_reg[90] ~^ lfsr_reg[89] ~^ lfsr_reg[7] ~^ lfsr_reg[6];
        92  : taps_result = lfsr_reg[91] ~^ lfsr_reg[90] ~^ lfsr_reg[79] ~^ lfsr_reg[78];
        93  : taps_result = lfsr_reg[92] ~^ lfsr_reg[90];
        94  : taps_result = lfsr_reg[93] ~^ lfsr_reg[72];
        95  : taps_result = lfsr_reg[94] ~^ lfsr_reg[83];
        96  : taps_result = lfsr_reg[95] ~^ lfsr_reg[93] ~^ lfsr_reg[48] ~^ lfsr_reg[46];
        97  : taps_result = lfsr_reg[96] ~^ lfsr_reg[90];
        98  : taps_result = lfsr_reg[97] ~^ lfsr_reg[86];
        99  : taps_result = lfsr_reg[98] ~^ lfsr_reg[96] ~^ lfsr_reg[53] ~^ lfsr_reg[51];
        100 : taps_result = lfsr_reg[99] ~^ lfsr_reg[62];
        101 : taps_result = lfsr_reg[100] ~^ lfsr_reg[99] ~^ lfsr_reg[94] ~^ lfsr_reg[93];
        102 : taps_result = lfsr_reg[101] ~^ lfsr_reg[100] ~^ lfsr_reg[35] ~^ lfsr_reg[34];
        103 : taps_result = lfsr_reg[102] ~^ lfsr_reg[93];
        104 : taps_result = lfsr_reg[103] ~^ lfsr_reg[102] ~^ lfsr_reg[93] ~^ lfsr_reg[92];
        105 : taps_result = lfsr_reg[104] ~^ lfsr_reg[88];
        106 : taps_result = lfsr_reg[105] ~^ lfsr_reg[90];
        107 : taps_result = lfsr_reg[106] ~^ lfsr_reg[104] ~^ lfsr_reg[43] ~^ lfsr_reg[41];
        108 : taps_result = lfsr_reg[107] ~^ lfsr_reg[76];
        109 : taps_result = lfsr_reg[108] ~^ lfsr_reg[107] ~^ lfsr_reg[102] ~^ lfsr_reg[101];
        110 : taps_result = lfsr_reg[109] ~^ lfsr_reg[108] ~^ lfsr_reg[97] ~^ lfsr_reg[96];
        111 : taps_result = lfsr_reg[110] ~^ lfsr_reg[100];
        112 : taps_result = lfsr_reg[111] ~^ lfsr_reg[109] ~^ lfsr_reg[68] ~^ lfsr_reg[66];
        113 : taps_result = lfsr_reg[112] ~^ lfsr_reg[103];
        114 : taps_result = lfsr_reg[113] ~^ lfsr_reg[112] ~^ lfsr_reg[32] ~^ lfsr_reg[31];
        115 : taps_result = lfsr_reg[114] ~^ lfsr_reg[113] ~^ lfsr_reg[100] ~^ lfsr_reg[99];
        116 : taps_result = lfsr_reg[115] ~^ lfsr_reg[114] ~^ lfsr_reg[45] ~^ lfsr_reg[44];
        117 : taps_result = lfsr_reg[116] ~^ lfsr_reg[114] ~^ lfsr_reg[98] ~^ lfsr_reg[96];
        118 : taps_result = lfsr_reg[117] ~^ lfsr_reg[84];
        119 : taps_result = lfsr_reg[118] ~^ lfsr_reg[110];
        120 : taps_result = lfsr_reg[119] ~^ lfsr_reg[112] ~^ lfsr_reg[8] ~^ lfsr_reg[1];
        121 : taps_result = lfsr_reg[120] ~^ lfsr_reg[102];
        122 : taps_result = lfsr_reg[121] ~^ lfsr_reg[120] ~^ lfsr_reg[62] ~^ lfsr_reg[61];
        123 : taps_result = lfsr_reg[122] ~^ lfsr_reg[120];
        124 : taps_result = lfsr_reg[123] ~^ lfsr_reg[86];
        125 : taps_result = lfsr_reg[124] ~^ lfsr_reg[123] ~^ lfsr_reg[17] ~^ lfsr_reg[16];
        126 : taps_result = lfsr_reg[125] ~^ lfsr_reg[124] ~^ lfsr_reg[89] ~^ lfsr_reg[88];
        127 : taps_result = lfsr_reg[126] ~^ lfsr_reg[125];
        128 : taps_result = lfsr_reg[127] ~^ lfsr_reg[125] ~^ lfsr_reg[100] ~^ lfsr_reg[98];
        129 : taps_result = lfsr_reg[128] ~^ lfsr_reg[123];
        130 : taps_result = lfsr_reg[129] ~^ lfsr_reg[126];
        131 : taps_result = lfsr_reg[130] ~^ lfsr_reg[129] ~^ lfsr_reg[83] ~^ lfsr_reg[82];
        132 : taps_result = lfsr_reg[131] ~^ lfsr_reg[102];
        133 : taps_result = lfsr_reg[132] ~^ lfsr_reg[131] ~^ lfsr_reg[81] ~^ lfsr_reg[80];
        134 : taps_result = lfsr_reg[133] ~^ lfsr_reg[76];
        135 : taps_result = lfsr_reg[134] ~^ lfsr_reg[123];
        136 : taps_result = lfsr_reg[135] ~^ lfsr_reg[134] ~^ lfsr_reg[10] ~^ lfsr_reg[9];
        137 : taps_result = lfsr_reg[136] ~^ lfsr_reg[115];
        138 : taps_result = lfsr_reg[137] ~^ lfsr_reg[136] ~^ lfsr_reg[130] ~^ lfsr_reg[129];
        139 : taps_result = lfsr_reg[138] ~^ lfsr_reg[135] ~^ lfsr_reg[133] ~^ lfsr_reg[130];
        140 : taps_result = lfsr_reg[139] ~^ lfsr_reg[110];
        141 : taps_result = lfsr_reg[140] ~^ lfsr_reg[139] ~^ lfsr_reg[109] ~^ lfsr_reg[108];
        142 : taps_result = lfsr_reg[141] ~^ lfsr_reg[120];
        143 : taps_result = lfsr_reg[142] ~^ lfsr_reg[141] ~^ lfsr_reg[122] ~^ lfsr_reg[121];
        144 : taps_result = lfsr_reg[143] ~^ lfsr_reg[142] ~^ lfsr_reg[74] ~^ lfsr_reg[73];
        145 : taps_result = lfsr_reg[144] ~^ lfsr_reg[92];
        146 : taps_result = lfsr_reg[145] ~^ lfsr_reg[144] ~^ lfsr_reg[86] ~^ lfsr_reg[85];
        147 : taps_result = lfsr_reg[146] ~^ lfsr_reg[145] ~^ lfsr_reg[109] ~^ lfsr_reg[108];
        148 : taps_result = lfsr_reg[147] ~^ lfsr_reg[120];
        149 : taps_result = lfsr_reg[148] ~^ lfsr_reg[147] ~^ lfsr_reg[39] ~^ lfsr_reg[38];
        150 : taps_result = lfsr_reg[149] ~^ lfsr_reg[96];
        151 : taps_result = lfsr_reg[150] ~^ lfsr_reg[147];
        152 : taps_result = lfsr_reg[151] ~^ lfsr_reg[150] ~^ lfsr_reg[86] ~^ lfsr_reg[85];
        153 : taps_result = lfsr_reg[152] ~^ lfsr_reg[151];
        154 : taps_result = lfsr_reg[153] ~^ lfsr_reg[151] ~^ lfsr_reg[26] ~^ lfsr_reg[24];
        155 : taps_result = lfsr_reg[154] ~^ lfsr_reg[153] ~^ lfsr_reg[123] ~^ lfsr_reg[122];
        156 : taps_result = lfsr_reg[155] ~^ lfsr_reg[154] ~^ lfsr_reg[40] ~^ lfsr_reg[39];
        157 : taps_result = lfsr_reg[156] ~^ lfsr_reg[155] ~^ lfsr_reg[130] ~^ lfsr_reg[129];
        158 : taps_result = lfsr_reg[157] ~^ lfsr_reg[156] ~^ lfsr_reg[131] ~^ lfsr_reg[130];
        159 : taps_result = lfsr_reg[158] ~^ lfsr_reg[127];
        160 : taps_result = lfsr_reg[159] ~^ lfsr_reg[158] ~^ lfsr_reg[141] ~^ lfsr_reg[140];
        161 : taps_result = lfsr_reg[160] ~^ lfsr_reg[142];
        162 : taps_result = lfsr_reg[161] ~^ lfsr_reg[160] ~^ lfsr_reg[74] ~^ lfsr_reg[73];
        163 : taps_result = lfsr_reg[162] ~^ lfsr_reg[161] ~^ lfsr_reg[103] ~^ lfsr_reg[102];
        164 : taps_result = lfsr_reg[163] ~^ lfsr_reg[162] ~^ lfsr_reg[150] ~^ lfsr_reg[149];
        165 : taps_result = lfsr_reg[164] ~^ lfsr_reg[163] ~^ lfsr_reg[134] ~^ lfsr_reg[133];
        166 : taps_result = lfsr_reg[165] ~^ lfsr_reg[164] ~^ lfsr_reg[127] ~^ lfsr_reg[126];
        167 : taps_result = lfsr_reg[166] ~^ lfsr_reg[160];
        168 : taps_result = lfsr_reg[167] ~^ lfsr_reg[165] ~^ lfsr_reg[152] ~^ lfsr_reg[150];
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
