module param_counter #(
   parameter MOD = 65536
)
(
   rst_,
   clk,
   en,
   q
);
// |============ PORTS DESCRIPTION ============|
input                           rst_;    // Active LOW reset input
input                           clk;     // Clock input
input                           en;      // Enable input
output   [$clog2(MOD) - 1 : 0]   q;      // Counter bus output with value

// |============ LOCAL PARAMETERS ============|
localparam N = (MOD + 32768 - 1) / 32768;   // Calc amount of sub counters of common counter 
//
initial begin
    $display("==============================");
    $display("N = %d", N);
    $display("Clog2 result = %d", $clog2(MOD));
    $display("==============================");
end
// |==========================================|

generate
    if (N == 1)
    begin
        // |====== WIRE'S, REG'S AND ETC ======|
        reg   [$clog2(MOD) - 1 : 0]  counter;
        wire                         enable;
        
        // |=========== ASSIGNMENTS ===========|
        assign enable = en;
        assign q      = counter;

        // |========== LOGIC SECTION ==========|
        always @(posedge clk or negedge rst_)
        begin
            if (!rst_)
                counter <= 0;
            else if (enable)
            begin
                if (counter == MOD)
                    counter <= 0;
                else
                    counter <= counter + 1;
            end
            else
                counter <= counter;
        end
    end
    else if (N > 0)
    begin
        // |====== WIRE'S, REG'S AND ETC ======|
        reg   [15 : 0]              counter_16_bit [N : 0];
        reg   [N : 0]               enable;
        
        reg   [$clog2(MOD) - 1 : 0] temp;
        // wire   [$clog2(MOD) - 1 : 0] temp;

        // |=========== ASSIGNMENTS ===========|
        assign q         = temp;

        // |========== LOGIC SECTION ==========|
        integer i;

        always @(*)
        begin
            enable[0] <= en;    
        end

        always @(*)
        begin
            // temp = 0;
            for (i = 0; i < N; i = i + 1)
            begin
                temp = {temp, counter_16_bit[i]};
            end
        end

        genvar k;

        for (k = 0; k < N; k = k + 1)
        begin
            always @(posedge clk or negedge rst_)
            begin
                if (!rst_)
                    counter_16_bit[k] <= 0;
                else if (enable[k])
                begin
                    if (counter_16_bit[k] == 16'h8000)
                    begin
                        counter_16_bit[k] <= 0;
                        enable[k]         <= 1;
                    end
                    else
                    begin
                        counter_16_bit[k] <= counter_16_bit[k] + 1;
                        enable[k]         <= 0;
                    end
                end
                else
                begin
                    counter_16_bit[k] <= counter_16_bit[k];
                    enable[k]         <= 0;
                end
            end            
        end     
    end
endgenerate
endmodule
