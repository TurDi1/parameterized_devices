module #(
	parameter REG_WIDTH = 32,
	parameter AXIL_DATA_WIDTH = 32,
	parameter AXIL_ADDR_WIDTH = 32
)
(
	rst,
	clk,
	pwm,
	
	s_axi_aresetn,
	s_axi_awaddr,
	s_axi_awvalid,
    s_axi_awready,
    s_axi_awprot,
	s_axi_wdata,
	s_axi_wstrb,
	s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
	s_axi_bvalid,
	s_axi_bready,
	s_axi_araddr,
    s_axi_arvalid,
	s_axi_arready,
	s_axi_arprot,
	s_axi_rdata,
    s_axi_rresp,
	s_axi_rvalid,
	s_axi_rready
);
//==================================
//        PORTS DESCRIPTION
//==================================
input                               rst;
input                               clk;
output                              pwm;

input                               s_axi_aresetn;
input   [AXIL_ADDR_WIDTH - 1 : 0]   s_axi_awaddr;
input                               s_axi_awvalid;
output                              s_axi_awready;
input   [2:0]                       s_axi_awprot;
input   [AXIL_DATA_WIDTH - 1 : 0]   s_axi_wdata;
input   [(AXIL_DATA_WIDTH/8)-1:0]   s_axi_wstrb;
input                               s_axi_wvalid;
output                              s_axi_wready;
output  [1:0]                       s_axi_bresp;
output                              s_axi_bvalid;
input                               s_axi_bready;
input   [AXIL_ADDR_WIDTH - 1 : 0]   s_axi_araddr;
input                               s_axi_arvalid;
output                              s_axi_arready;
input   [2:0]                       s_axi_arprot;
output  [AXIL_DATA_WIDTH - 1 : 0]   s_axi_rdata;
output  [1:0]                       s_axi_rresp;
output                              s_axi_rvalid;
input                               s_axi_rready;

//==================================
//      WIRE'S, REG'S and etc       
//==================================
// PWM regs
reg     [REG_WIDTH - 1 : 0]         t_reg;
reg     [REG_WIDTH - 1 : 0]         d_reg;
reg     [REG_WIDTH - 1 : 0]         time_reg;
reg     [REG_WIDTH - 1 : 0]         counter;


//==================================
//           ASSIGNMENTS
//==================================


//==================================
//              
//==================================
endmodule