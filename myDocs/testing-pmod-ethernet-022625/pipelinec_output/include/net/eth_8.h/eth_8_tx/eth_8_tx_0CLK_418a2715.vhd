-- Timing params:
--   Fixed?: False
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 87
entity eth_8_tx_0CLK_418a2715 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 frame : in eth8_frame_t_stream_t;
 mac_axis_ready : in unsigned(0 downto 0);
 return_output : out eth_8_tx_t);
end eth_8_tx_0CLK_418a2715;
architecture arch of eth_8_tx_0CLK_418a2715 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal state : unsigned(2 downto 0) := unsigned(eth8_state_t_to_slv(eth8_state_t'left));
signal header : eth_header_t := eth_header_t_NULL;
signal counter : unsigned(5 downto 0) := to_unsigned(0, 6);
signal REG_COMB_state : unsigned(2 downto 0);
signal REG_COMB_header : eth_header_t;
signal REG_COMB_counter : unsigned(5 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_LT[eth_8_h_l124_c32_2059]
signal BIN_OP_LT_eth_8_h_l124_c32_2059_left : unsigned(5 downto 0);
signal BIN_OP_LT_eth_8_h_l124_c32_2059_right : unsigned(5 downto 0);
signal BIN_OP_LT_eth_8_h_l124_c32_2059_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[eth_8_h_l128_c6_3297]
signal BIN_OP_EQ_eth_8_h_l128_c6_3297_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l128_c6_3297_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l128_c3_9063]
signal header_MUX_eth_8_h_l128_c3_9063_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l128_c3_9063_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l128_c3_9063_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l128_c3_9063_return_output : eth_header_t;

-- o_MUX[eth_8_h_l128_c3_9063]
signal o_MUX_eth_8_h_l128_c3_9063_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l128_c3_9063_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l128_c3_9063_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l128_c3_9063_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l128_c3_9063]
signal state_MUX_eth_8_h_l128_c3_9063_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l128_c3_9063_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l128_c3_9063_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l128_c3_9063_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l128_c3_9063]
signal counter_MUX_eth_8_h_l128_c3_9063_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l128_c3_9063_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l128_c3_9063_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l128_c3_9063_return_output : unsigned(5 downto 0);

-- header_MUX[eth_8_h_l130_c5_01d0]
signal header_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l130_c5_01d0_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l130_c5_01d0_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l130_c5_01d0_return_output : eth_header_t;

-- o_mac_axis_valid_MUX[eth_8_h_l130_c5_01d0]
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iftrue : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iffalse : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tdata_MUX[eth_8_h_l130_c5_01d0]
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iftrue : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iffalse : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_return_output : uint8_t_1;

-- state_MUX[eth_8_h_l130_c5_01d0]
signal state_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l130_c5_01d0_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l130_c5_01d0_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l130_c5_01d0_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l130_c5_01d0]
signal counter_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l130_c5_01d0_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l130_c5_01d0_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l130_c5_01d0_return_output : unsigned(5 downto 0);

-- BIN_OP_EQ[eth_8_h_l131_c10_413a]
signal BIN_OP_EQ_eth_8_h_l131_c10_413a_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l131_c10_413a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l131_c10_413a_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l131_c7_5aaa]
signal header_MUX_eth_8_h_l131_c7_5aaa_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l131_c7_5aaa_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l131_c7_5aaa_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l131_c7_5aaa_return_output : eth_header_t;

-- header_dst_mac_MUX[eth_8_h_l136_c7_6d1b]
signal header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_cond : unsigned(0 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iftrue : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iffalse : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l136_c7_6d1b]
signal state_MUX_eth_8_h_l136_c7_6d1b_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l136_c7_6d1b_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l136_c7_6d1b_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l136_c7_6d1b_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l136_c7_6d1b]
signal counter_MUX_eth_8_h_l136_c7_6d1b_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l136_c7_6d1b_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l136_c7_6d1b_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l136_c7_6d1b_return_output : unsigned(5 downto 0);

-- CONST_SL_8[eth_8_h_l137_c26_2750]
signal CONST_SL_8_eth_8_h_l137_c26_2750_x : unsigned(47 downto 0);
signal CONST_SL_8_eth_8_h_l137_c26_2750_return_output : unsigned(47 downto 0);

-- BIN_OP_EQ[eth_8_h_l138_c12_efe5]
signal BIN_OP_EQ_eth_8_h_l138_c12_efe5_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l138_c12_efe5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l138_c12_efe5_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l138_c9_374d]
signal state_MUX_eth_8_h_l138_c9_374d_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l138_c9_374d_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l138_c9_374d_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l138_c9_374d_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l138_c9_374d]
signal counter_MUX_eth_8_h_l138_c9_374d_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l138_c9_374d_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l138_c9_374d_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l138_c9_374d_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l142_c11_6d42]
signal BIN_OP_PLUS_eth_8_h_l142_c11_6d42_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l142_c11_6d42_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l142_c11_6d42_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l146_c12_2896]
signal BIN_OP_EQ_eth_8_h_l146_c12_2896_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l146_c12_2896_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l146_c9_5a3c]
signal header_ethertype_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_5a3c_return_output : unsigned(15 downto 0);

-- header_src_mac_MUX[eth_8_h_l146_c9_5a3c]
signal header_src_mac_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_5a3c_return_output : unsigned(47 downto 0);

-- o_MUX[eth_8_h_l146_c9_5a3c]
signal o_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l146_c9_5a3c_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l146_c9_5a3c_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l146_c9_5a3c_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l146_c9_5a3c]
signal state_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l146_c9_5a3c_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l146_c9_5a3c_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l146_c9_5a3c_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l146_c9_5a3c]
signal counter_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l146_c9_5a3c_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l146_c9_5a3c_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l146_c9_5a3c_return_output : unsigned(5 downto 0);

-- header_src_mac_MUX[eth_8_h_l149_c5_f7ae]
signal header_src_mac_MUX_eth_8_h_l149_c5_f7ae_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_f7ae_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l149_c5_f7ae]
signal state_MUX_eth_8_h_l149_c5_f7ae_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l149_c5_f7ae_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l149_c5_f7ae_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l149_c5_f7ae_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l149_c5_f7ae]
signal counter_MUX_eth_8_h_l149_c5_f7ae_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l149_c5_f7ae_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l149_c5_f7ae_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l149_c5_f7ae_return_output : unsigned(5 downto 0);

-- CONST_SL_8[eth_8_h_l150_c24_9160]
signal CONST_SL_8_eth_8_h_l150_c24_9160_x : unsigned(47 downto 0);
signal CONST_SL_8_eth_8_h_l150_c24_9160_return_output : unsigned(47 downto 0);

-- BIN_OP_EQ[eth_8_h_l151_c10_f38a]
signal BIN_OP_EQ_eth_8_h_l151_c10_f38a_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l151_c10_f38a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l151_c10_f38a_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l151_c7_9b4c]
signal state_MUX_eth_8_h_l151_c7_9b4c_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l151_c7_9b4c_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l151_c7_9b4c_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l151_c7_9b4c_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l151_c7_9b4c]
signal counter_MUX_eth_8_h_l151_c7_9b4c_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l151_c7_9b4c_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l151_c7_9b4c_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l151_c7_9b4c_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l155_c9_e29b]
signal BIN_OP_PLUS_eth_8_h_l155_c9_e29b_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l155_c9_e29b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l155_c9_e29b_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l158_c12_0b87]
signal BIN_OP_EQ_eth_8_h_l158_c12_0b87_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l158_c12_0b87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l158_c9_e948]
signal header_ethertype_MUX_eth_8_h_l158_c9_e948_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_e948_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_e948_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_e948_return_output : unsigned(15 downto 0);

-- o_MUX[eth_8_h_l158_c9_e948]
signal o_MUX_eth_8_h_l158_c9_e948_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l158_c9_e948_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l158_c9_e948_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l158_c9_e948_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l158_c9_e948]
signal state_MUX_eth_8_h_l158_c9_e948_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l158_c9_e948_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l158_c9_e948_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l158_c9_e948_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l158_c9_e948]
signal counter_MUX_eth_8_h_l158_c9_e948_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l158_c9_e948_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l158_c9_e948_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l158_c9_e948_return_output : unsigned(5 downto 0);

-- header_ethertype_MUX[eth_8_h_l161_c5_5fe4]
signal header_ethertype_MUX_eth_8_h_l161_c5_5fe4_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_5fe4_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l161_c5_5fe4]
signal state_MUX_eth_8_h_l161_c5_5fe4_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l161_c5_5fe4_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l161_c5_5fe4_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l161_c5_5fe4_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l161_c5_5fe4]
signal counter_MUX_eth_8_h_l161_c5_5fe4_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l161_c5_5fe4_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l161_c5_5fe4_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l161_c5_5fe4_return_output : unsigned(5 downto 0);

-- CONST_SL_8[eth_8_h_l162_c26_2158]
signal CONST_SL_8_eth_8_h_l162_c26_2158_x : unsigned(15 downto 0);
signal CONST_SL_8_eth_8_h_l162_c26_2158_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[eth_8_h_l163_c10_9dac]
signal BIN_OP_EQ_eth_8_h_l163_c10_9dac_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l163_c10_9dac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l163_c10_9dac_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l163_c7_e053]
signal state_MUX_eth_8_h_l163_c7_e053_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l163_c7_e053_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l163_c7_e053_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l163_c7_e053_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l163_c7_e053]
signal counter_MUX_eth_8_h_l163_c7_e053_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l163_c7_e053_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l163_c7_e053_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l163_c7_e053_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l167_c9_f596]
signal BIN_OP_PLUS_eth_8_h_l167_c9_f596_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l167_c9_f596_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l167_c9_f596_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l172_c11_a070]
signal BIN_OP_EQ_eth_8_h_l172_c11_a070_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l172_c11_a070_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l172_c11_a070_return_output : unsigned(0 downto 0);

-- o_MUX[eth_8_h_l172_c8_2225]
signal o_MUX_eth_8_h_l172_c8_2225_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l172_c8_2225_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l172_c8_2225_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l172_c8_2225_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l172_c8_2225]
signal state_MUX_eth_8_h_l172_c8_2225_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l172_c8_2225_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l172_c8_2225_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l172_c8_2225_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l172_c8_2225]
signal counter_MUX_eth_8_h_l172_c8_2225_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l172_c8_2225_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l172_c8_2225_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l172_c8_2225_return_output : unsigned(5 downto 0);

-- MUX[eth_8_h_l176_c29_7852]
signal MUX_eth_8_h_l176_c29_7852_cond : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_7852_iftrue : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_7852_iffalse : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_7852_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l179_c8_58bc]
signal BIN_OP_AND_eth_8_h_l179_c8_58bc_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l179_c8_58bc_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l179_c8_58bc_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l179_c5_6cd8]
signal state_MUX_eth_8_h_l179_c5_6cd8_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l179_c5_6cd8_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l179_c5_6cd8_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l179_c5_6cd8_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l179_c5_6cd8]
signal counter_MUX_eth_8_h_l179_c5_6cd8_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l179_c5_6cd8_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l179_c5_6cd8_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l179_c5_6cd8_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l180_c7_47d7]
signal state_MUX_eth_8_h_l180_c7_47d7_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l180_c7_47d7_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l180_c7_47d7_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l180_c7_47d7_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l180_c7_47d7]
signal counter_MUX_eth_8_h_l180_c7_47d7_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l180_c7_47d7_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l180_c7_47d7_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l180_c7_47d7_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l182_c9_cf99]
signal state_MUX_eth_8_h_l182_c9_cf99_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l182_c9_cf99_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l182_c9_cf99_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l182_c9_cf99_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l182_c9_cf99]
signal counter_MUX_eth_8_h_l182_c9_cf99_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l182_c9_cf99_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l182_c9_cf99_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l182_c9_cf99_return_output : unsigned(5 downto 0);

-- counter_MUX[eth_8_h_l189_c7_9feb]
signal counter_MUX_eth_8_h_l189_c7_9feb_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l189_c7_9feb_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l189_c7_9feb_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l189_c7_9feb_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l190_c9_715f]
signal BIN_OP_PLUS_eth_8_h_l190_c9_715f_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l190_c9_715f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l190_c9_715f_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l195_c11_ae46]
signal BIN_OP_EQ_eth_8_h_l195_c11_ae46_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l195_c11_ae46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tlast_MUX[eth_8_h_l195_c8_3005]
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iftrue : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iffalse : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_return_output : unsigned(0 downto 0);

-- o_mac_axis_valid_MUX[eth_8_h_l195_c8_3005]
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iftrue : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iffalse : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tdata_MUX[eth_8_h_l195_c8_3005]
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iftrue : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iffalse : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_return_output : uint8_t_1;

-- state_MUX[eth_8_h_l195_c8_3005]
signal state_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l195_c8_3005_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l195_c8_3005_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l195_c8_3005_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l195_c8_3005]
signal counter_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l195_c8_3005_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l195_c8_3005_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l195_c8_3005_return_output : unsigned(5 downto 0);

-- UNARY_OP_NOT[eth_8_h_l197_c30_85b7]
signal UNARY_OP_NOT_eth_8_h_l197_c30_85b7_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_eth_8_h_l197_c30_85b7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l199_c8_f83f]
signal BIN_OP_AND_eth_8_h_l199_c8_f83f_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l199_c8_f83f_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l199_c8_f83f_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l199_c5_09c8]
signal state_MUX_eth_8_h_l199_c5_09c8_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l199_c5_09c8_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l199_c5_09c8_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l199_c5_09c8_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l199_c5_09c8]
signal counter_MUX_eth_8_h_l199_c5_09c8_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l199_c5_09c8_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l199_c5_09c8_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l199_c5_09c8_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l200_c7_15d7]
signal BIN_OP_PLUS_eth_8_h_l200_c7_15d7_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l200_c7_15d7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l200_c7_15d7_return_output : unsigned(6 downto 0);

-- state_MUX[eth_8_h_l201_c7_c716]
signal state_MUX_eth_8_h_l201_c7_c716_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l201_c7_c716_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l201_c7_c716_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l201_c7_c716_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l201_c7_c716]
signal counter_MUX_eth_8_h_l201_c7_c716_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l201_c7_c716_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l201_c7_c716_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l201_c7_c716_return_output : unsigned(5 downto 0);

function uint48_47_40( x : unsigned) return unsigned is
--variable x : unsigned(47 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(47 downto 40)));
return return_output;
end function;

function CONST_REF_RD_eth_header_t_eth_header_t_e484( ref_toks_0 : eth_header_t;
 ref_toks_1 : unsigned) return eth_header_t is
 
  variable base : eth_header_t; 
  variable return_output : eth_header_t;
begin
      base := ref_toks_0;
      base.dst_mac := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3( ref_toks_0 : unsigned) return uint8_t_1 is
 
  variable base : eth_8_tx_t; 
  variable return_output : uint8_t_1;
begin
      base.mac_axis.data.tdata(0) := ref_toks_0;

      return_output := base.mac_axis.data.tdata;
      return return_output; 
end function;

function CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856( ref_toks_0 : eth_8_tx_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : uint8_t_1) return eth_8_tx_t is
 
  variable base : eth_8_tx_t; 
  variable return_output : eth_8_tx_t;
begin
      base := ref_toks_0;
      base.mac_axis.data.tkeep(0) := ref_toks_1;
      base.frame_ready := ref_toks_2;
      base.mac_axis.valid := ref_toks_3;
      base.mac_axis.data.tdata := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb( ref_toks_0 : eth_8_tx_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return eth_8_tx_t is
 
  variable base : eth_8_tx_t; 
  variable return_output : eth_8_tx_t;
begin
      base := ref_toks_0;
      base.mac_axis.data.tkeep(0) := ref_toks_1;
      base.frame_ready := ref_toks_2;
      base.mac_axis.valid := ref_toks_3;
      base.mac_axis.data.tdata(0) := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524( ref_toks_0 : axis8_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return eth_8_tx_t is
 
  variable base : eth_8_tx_t; 
  variable return_output : eth_8_tx_t;
begin
      base.mac_axis.data := ref_toks_0;
      base.mac_axis.data.tlast := ref_toks_1;
      base.mac_axis.valid := ref_toks_2;
      base.frame_ready := ref_toks_3;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : uint8_t_1) return eth_8_tx_t is
 
  variable base : eth_8_tx_t; 
  variable return_output : eth_8_tx_t;
begin
      base.mac_axis.data.tkeep(0) := ref_toks_0;
      base.frame_ready := ref_toks_1;
      base.mac_axis.data.tlast := ref_toks_2;
      base.mac_axis.valid := ref_toks_3;
      base.mac_axis.data.tdata := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eth_header_t_eth_header_t_325a( ref_toks_0 : eth_header_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return eth_header_t is
 
  variable base : eth_header_t; 
  variable return_output : eth_header_t;
begin
      base := ref_toks_0;
      base.ethertype := ref_toks_1;
      base.src_mac := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_LT_eth_8_h_l124_c32_2059 : 0 clocks latency
BIN_OP_LT_eth_8_h_l124_c32_2059 : entity work.BIN_OP_LT_uint6_t_uint6_t_0CLK_380ecc95 port map (
BIN_OP_LT_eth_8_h_l124_c32_2059_left,
BIN_OP_LT_eth_8_h_l124_c32_2059_right,
BIN_OP_LT_eth_8_h_l124_c32_2059_return_output);

-- BIN_OP_EQ_eth_8_h_l128_c6_3297 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l128_c6_3297 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l128_c6_3297_left,
BIN_OP_EQ_eth_8_h_l128_c6_3297_right,
BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output);

-- header_MUX_eth_8_h_l128_c3_9063 : 0 clocks latency
header_MUX_eth_8_h_l128_c3_9063 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l128_c3_9063_cond,
header_MUX_eth_8_h_l128_c3_9063_iftrue,
header_MUX_eth_8_h_l128_c3_9063_iffalse,
header_MUX_eth_8_h_l128_c3_9063_return_output);

-- o_MUX_eth_8_h_l128_c3_9063 : 0 clocks latency
o_MUX_eth_8_h_l128_c3_9063 : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l128_c3_9063_cond,
o_MUX_eth_8_h_l128_c3_9063_iftrue,
o_MUX_eth_8_h_l128_c3_9063_iffalse,
o_MUX_eth_8_h_l128_c3_9063_return_output);

-- state_MUX_eth_8_h_l128_c3_9063 : 0 clocks latency
state_MUX_eth_8_h_l128_c3_9063 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l128_c3_9063_cond,
state_MUX_eth_8_h_l128_c3_9063_iftrue,
state_MUX_eth_8_h_l128_c3_9063_iffalse,
state_MUX_eth_8_h_l128_c3_9063_return_output);

-- counter_MUX_eth_8_h_l128_c3_9063 : 0 clocks latency
counter_MUX_eth_8_h_l128_c3_9063 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l128_c3_9063_cond,
counter_MUX_eth_8_h_l128_c3_9063_iftrue,
counter_MUX_eth_8_h_l128_c3_9063_iffalse,
counter_MUX_eth_8_h_l128_c3_9063_return_output);

-- header_MUX_eth_8_h_l130_c5_01d0 : 0 clocks latency
header_MUX_eth_8_h_l130_c5_01d0 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l130_c5_01d0_cond,
header_MUX_eth_8_h_l130_c5_01d0_iftrue,
header_MUX_eth_8_h_l130_c5_01d0_iffalse,
header_MUX_eth_8_h_l130_c5_01d0_return_output);

-- o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0 : 0 clocks latency
o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_cond,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iftrue,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iffalse,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_return_output);

-- o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0 : 0 clocks latency
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0 : entity work.MUX_uint1_t_uint8_t_1_uint8_t_1_0CLK_de264c78 port map (
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_cond,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iftrue,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iffalse,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_return_output);

-- state_MUX_eth_8_h_l130_c5_01d0 : 0 clocks latency
state_MUX_eth_8_h_l130_c5_01d0 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l130_c5_01d0_cond,
state_MUX_eth_8_h_l130_c5_01d0_iftrue,
state_MUX_eth_8_h_l130_c5_01d0_iffalse,
state_MUX_eth_8_h_l130_c5_01d0_return_output);

-- counter_MUX_eth_8_h_l130_c5_01d0 : 0 clocks latency
counter_MUX_eth_8_h_l130_c5_01d0 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l130_c5_01d0_cond,
counter_MUX_eth_8_h_l130_c5_01d0_iftrue,
counter_MUX_eth_8_h_l130_c5_01d0_iffalse,
counter_MUX_eth_8_h_l130_c5_01d0_return_output);

-- BIN_OP_EQ_eth_8_h_l131_c10_413a : 0 clocks latency
BIN_OP_EQ_eth_8_h_l131_c10_413a : entity work.BIN_OP_EQ_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l131_c10_413a_left,
BIN_OP_EQ_eth_8_h_l131_c10_413a_right,
BIN_OP_EQ_eth_8_h_l131_c10_413a_return_output);

-- header_MUX_eth_8_h_l131_c7_5aaa : 0 clocks latency
header_MUX_eth_8_h_l131_c7_5aaa : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l131_c7_5aaa_cond,
header_MUX_eth_8_h_l131_c7_5aaa_iftrue,
header_MUX_eth_8_h_l131_c7_5aaa_iffalse,
header_MUX_eth_8_h_l131_c7_5aaa_return_output);

-- header_dst_mac_MUX_eth_8_h_l136_c7_6d1b : 0 clocks latency
header_dst_mac_MUX_eth_8_h_l136_c7_6d1b : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_cond,
header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iftrue,
header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iffalse,
header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_return_output);

-- state_MUX_eth_8_h_l136_c7_6d1b : 0 clocks latency
state_MUX_eth_8_h_l136_c7_6d1b : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l136_c7_6d1b_cond,
state_MUX_eth_8_h_l136_c7_6d1b_iftrue,
state_MUX_eth_8_h_l136_c7_6d1b_iffalse,
state_MUX_eth_8_h_l136_c7_6d1b_return_output);

-- counter_MUX_eth_8_h_l136_c7_6d1b : 0 clocks latency
counter_MUX_eth_8_h_l136_c7_6d1b : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l136_c7_6d1b_cond,
counter_MUX_eth_8_h_l136_c7_6d1b_iftrue,
counter_MUX_eth_8_h_l136_c7_6d1b_iffalse,
counter_MUX_eth_8_h_l136_c7_6d1b_return_output);

-- CONST_SL_8_eth_8_h_l137_c26_2750 : 0 clocks latency
CONST_SL_8_eth_8_h_l137_c26_2750 : entity work.CONST_SL_8_uint48_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l137_c26_2750_x,
CONST_SL_8_eth_8_h_l137_c26_2750_return_output);

-- BIN_OP_EQ_eth_8_h_l138_c12_efe5 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l138_c12_efe5 : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l138_c12_efe5_left,
BIN_OP_EQ_eth_8_h_l138_c12_efe5_right,
BIN_OP_EQ_eth_8_h_l138_c12_efe5_return_output);

-- state_MUX_eth_8_h_l138_c9_374d : 0 clocks latency
state_MUX_eth_8_h_l138_c9_374d : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l138_c9_374d_cond,
state_MUX_eth_8_h_l138_c9_374d_iftrue,
state_MUX_eth_8_h_l138_c9_374d_iffalse,
state_MUX_eth_8_h_l138_c9_374d_return_output);

-- counter_MUX_eth_8_h_l138_c9_374d : 0 clocks latency
counter_MUX_eth_8_h_l138_c9_374d : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l138_c9_374d_cond,
counter_MUX_eth_8_h_l138_c9_374d_iftrue,
counter_MUX_eth_8_h_l138_c9_374d_iffalse,
counter_MUX_eth_8_h_l138_c9_374d_return_output);

-- BIN_OP_PLUS_eth_8_h_l142_c11_6d42 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l142_c11_6d42 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l142_c11_6d42_left,
BIN_OP_PLUS_eth_8_h_l142_c11_6d42_right,
BIN_OP_PLUS_eth_8_h_l142_c11_6d42_return_output);

-- BIN_OP_EQ_eth_8_h_l146_c12_2896 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l146_c12_2896 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l146_c12_2896_left,
BIN_OP_EQ_eth_8_h_l146_c12_2896_right,
BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output);

-- header_ethertype_MUX_eth_8_h_l146_c9_5a3c : 0 clocks latency
header_ethertype_MUX_eth_8_h_l146_c9_5a3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l146_c9_5a3c_cond,
header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iftrue,
header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iffalse,
header_ethertype_MUX_eth_8_h_l146_c9_5a3c_return_output);

-- header_src_mac_MUX_eth_8_h_l146_c9_5a3c : 0 clocks latency
header_src_mac_MUX_eth_8_h_l146_c9_5a3c : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l146_c9_5a3c_cond,
header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iftrue,
header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iffalse,
header_src_mac_MUX_eth_8_h_l146_c9_5a3c_return_output);

-- o_MUX_eth_8_h_l146_c9_5a3c : 0 clocks latency
o_MUX_eth_8_h_l146_c9_5a3c : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l146_c9_5a3c_cond,
o_MUX_eth_8_h_l146_c9_5a3c_iftrue,
o_MUX_eth_8_h_l146_c9_5a3c_iffalse,
o_MUX_eth_8_h_l146_c9_5a3c_return_output);

-- state_MUX_eth_8_h_l146_c9_5a3c : 0 clocks latency
state_MUX_eth_8_h_l146_c9_5a3c : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l146_c9_5a3c_cond,
state_MUX_eth_8_h_l146_c9_5a3c_iftrue,
state_MUX_eth_8_h_l146_c9_5a3c_iffalse,
state_MUX_eth_8_h_l146_c9_5a3c_return_output);

-- counter_MUX_eth_8_h_l146_c9_5a3c : 0 clocks latency
counter_MUX_eth_8_h_l146_c9_5a3c : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l146_c9_5a3c_cond,
counter_MUX_eth_8_h_l146_c9_5a3c_iftrue,
counter_MUX_eth_8_h_l146_c9_5a3c_iffalse,
counter_MUX_eth_8_h_l146_c9_5a3c_return_output);

-- header_src_mac_MUX_eth_8_h_l149_c5_f7ae : 0 clocks latency
header_src_mac_MUX_eth_8_h_l149_c5_f7ae : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l149_c5_f7ae_cond,
header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iftrue,
header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iffalse,
header_src_mac_MUX_eth_8_h_l149_c5_f7ae_return_output);

-- state_MUX_eth_8_h_l149_c5_f7ae : 0 clocks latency
state_MUX_eth_8_h_l149_c5_f7ae : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l149_c5_f7ae_cond,
state_MUX_eth_8_h_l149_c5_f7ae_iftrue,
state_MUX_eth_8_h_l149_c5_f7ae_iffalse,
state_MUX_eth_8_h_l149_c5_f7ae_return_output);

-- counter_MUX_eth_8_h_l149_c5_f7ae : 0 clocks latency
counter_MUX_eth_8_h_l149_c5_f7ae : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l149_c5_f7ae_cond,
counter_MUX_eth_8_h_l149_c5_f7ae_iftrue,
counter_MUX_eth_8_h_l149_c5_f7ae_iffalse,
counter_MUX_eth_8_h_l149_c5_f7ae_return_output);

-- CONST_SL_8_eth_8_h_l150_c24_9160 : 0 clocks latency
CONST_SL_8_eth_8_h_l150_c24_9160 : entity work.CONST_SL_8_uint48_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l150_c24_9160_x,
CONST_SL_8_eth_8_h_l150_c24_9160_return_output);

-- BIN_OP_EQ_eth_8_h_l151_c10_f38a : 0 clocks latency
BIN_OP_EQ_eth_8_h_l151_c10_f38a : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l151_c10_f38a_left,
BIN_OP_EQ_eth_8_h_l151_c10_f38a_right,
BIN_OP_EQ_eth_8_h_l151_c10_f38a_return_output);

-- state_MUX_eth_8_h_l151_c7_9b4c : 0 clocks latency
state_MUX_eth_8_h_l151_c7_9b4c : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l151_c7_9b4c_cond,
state_MUX_eth_8_h_l151_c7_9b4c_iftrue,
state_MUX_eth_8_h_l151_c7_9b4c_iffalse,
state_MUX_eth_8_h_l151_c7_9b4c_return_output);

-- counter_MUX_eth_8_h_l151_c7_9b4c : 0 clocks latency
counter_MUX_eth_8_h_l151_c7_9b4c : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l151_c7_9b4c_cond,
counter_MUX_eth_8_h_l151_c7_9b4c_iftrue,
counter_MUX_eth_8_h_l151_c7_9b4c_iffalse,
counter_MUX_eth_8_h_l151_c7_9b4c_return_output);

-- BIN_OP_PLUS_eth_8_h_l155_c9_e29b : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l155_c9_e29b : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l155_c9_e29b_left,
BIN_OP_PLUS_eth_8_h_l155_c9_e29b_right,
BIN_OP_PLUS_eth_8_h_l155_c9_e29b_return_output);

-- BIN_OP_EQ_eth_8_h_l158_c12_0b87 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l158_c12_0b87 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l158_c12_0b87_left,
BIN_OP_EQ_eth_8_h_l158_c12_0b87_right,
BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output);

-- header_ethertype_MUX_eth_8_h_l158_c9_e948 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l158_c9_e948 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l158_c9_e948_cond,
header_ethertype_MUX_eth_8_h_l158_c9_e948_iftrue,
header_ethertype_MUX_eth_8_h_l158_c9_e948_iffalse,
header_ethertype_MUX_eth_8_h_l158_c9_e948_return_output);

-- o_MUX_eth_8_h_l158_c9_e948 : 0 clocks latency
o_MUX_eth_8_h_l158_c9_e948 : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l158_c9_e948_cond,
o_MUX_eth_8_h_l158_c9_e948_iftrue,
o_MUX_eth_8_h_l158_c9_e948_iffalse,
o_MUX_eth_8_h_l158_c9_e948_return_output);

-- state_MUX_eth_8_h_l158_c9_e948 : 0 clocks latency
state_MUX_eth_8_h_l158_c9_e948 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l158_c9_e948_cond,
state_MUX_eth_8_h_l158_c9_e948_iftrue,
state_MUX_eth_8_h_l158_c9_e948_iffalse,
state_MUX_eth_8_h_l158_c9_e948_return_output);

-- counter_MUX_eth_8_h_l158_c9_e948 : 0 clocks latency
counter_MUX_eth_8_h_l158_c9_e948 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l158_c9_e948_cond,
counter_MUX_eth_8_h_l158_c9_e948_iftrue,
counter_MUX_eth_8_h_l158_c9_e948_iffalse,
counter_MUX_eth_8_h_l158_c9_e948_return_output);

-- header_ethertype_MUX_eth_8_h_l161_c5_5fe4 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l161_c5_5fe4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l161_c5_5fe4_cond,
header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iftrue,
header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iffalse,
header_ethertype_MUX_eth_8_h_l161_c5_5fe4_return_output);

-- state_MUX_eth_8_h_l161_c5_5fe4 : 0 clocks latency
state_MUX_eth_8_h_l161_c5_5fe4 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l161_c5_5fe4_cond,
state_MUX_eth_8_h_l161_c5_5fe4_iftrue,
state_MUX_eth_8_h_l161_c5_5fe4_iffalse,
state_MUX_eth_8_h_l161_c5_5fe4_return_output);

-- counter_MUX_eth_8_h_l161_c5_5fe4 : 0 clocks latency
counter_MUX_eth_8_h_l161_c5_5fe4 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l161_c5_5fe4_cond,
counter_MUX_eth_8_h_l161_c5_5fe4_iftrue,
counter_MUX_eth_8_h_l161_c5_5fe4_iffalse,
counter_MUX_eth_8_h_l161_c5_5fe4_return_output);

-- CONST_SL_8_eth_8_h_l162_c26_2158 : 0 clocks latency
CONST_SL_8_eth_8_h_l162_c26_2158 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l162_c26_2158_x,
CONST_SL_8_eth_8_h_l162_c26_2158_return_output);

-- BIN_OP_EQ_eth_8_h_l163_c10_9dac : 0 clocks latency
BIN_OP_EQ_eth_8_h_l163_c10_9dac : entity work.BIN_OP_EQ_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l163_c10_9dac_left,
BIN_OP_EQ_eth_8_h_l163_c10_9dac_right,
BIN_OP_EQ_eth_8_h_l163_c10_9dac_return_output);

-- state_MUX_eth_8_h_l163_c7_e053 : 0 clocks latency
state_MUX_eth_8_h_l163_c7_e053 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l163_c7_e053_cond,
state_MUX_eth_8_h_l163_c7_e053_iftrue,
state_MUX_eth_8_h_l163_c7_e053_iffalse,
state_MUX_eth_8_h_l163_c7_e053_return_output);

-- counter_MUX_eth_8_h_l163_c7_e053 : 0 clocks latency
counter_MUX_eth_8_h_l163_c7_e053 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l163_c7_e053_cond,
counter_MUX_eth_8_h_l163_c7_e053_iftrue,
counter_MUX_eth_8_h_l163_c7_e053_iffalse,
counter_MUX_eth_8_h_l163_c7_e053_return_output);

-- BIN_OP_PLUS_eth_8_h_l167_c9_f596 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l167_c9_f596 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l167_c9_f596_left,
BIN_OP_PLUS_eth_8_h_l167_c9_f596_right,
BIN_OP_PLUS_eth_8_h_l167_c9_f596_return_output);

-- BIN_OP_EQ_eth_8_h_l172_c11_a070 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l172_c11_a070 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l172_c11_a070_left,
BIN_OP_EQ_eth_8_h_l172_c11_a070_right,
BIN_OP_EQ_eth_8_h_l172_c11_a070_return_output);

-- o_MUX_eth_8_h_l172_c8_2225 : 0 clocks latency
o_MUX_eth_8_h_l172_c8_2225 : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l172_c8_2225_cond,
o_MUX_eth_8_h_l172_c8_2225_iftrue,
o_MUX_eth_8_h_l172_c8_2225_iffalse,
o_MUX_eth_8_h_l172_c8_2225_return_output);

-- state_MUX_eth_8_h_l172_c8_2225 : 0 clocks latency
state_MUX_eth_8_h_l172_c8_2225 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l172_c8_2225_cond,
state_MUX_eth_8_h_l172_c8_2225_iftrue,
state_MUX_eth_8_h_l172_c8_2225_iffalse,
state_MUX_eth_8_h_l172_c8_2225_return_output);

-- counter_MUX_eth_8_h_l172_c8_2225 : 0 clocks latency
counter_MUX_eth_8_h_l172_c8_2225 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l172_c8_2225_cond,
counter_MUX_eth_8_h_l172_c8_2225_iftrue,
counter_MUX_eth_8_h_l172_c8_2225_iffalse,
counter_MUX_eth_8_h_l172_c8_2225_return_output);

-- MUX_eth_8_h_l176_c29_7852 : 0 clocks latency
MUX_eth_8_h_l176_c29_7852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_eth_8_h_l176_c29_7852_cond,
MUX_eth_8_h_l176_c29_7852_iftrue,
MUX_eth_8_h_l176_c29_7852_iffalse,
MUX_eth_8_h_l176_c29_7852_return_output);

-- BIN_OP_AND_eth_8_h_l179_c8_58bc : 0 clocks latency
BIN_OP_AND_eth_8_h_l179_c8_58bc : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l179_c8_58bc_left,
BIN_OP_AND_eth_8_h_l179_c8_58bc_right,
BIN_OP_AND_eth_8_h_l179_c8_58bc_return_output);

-- state_MUX_eth_8_h_l179_c5_6cd8 : 0 clocks latency
state_MUX_eth_8_h_l179_c5_6cd8 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l179_c5_6cd8_cond,
state_MUX_eth_8_h_l179_c5_6cd8_iftrue,
state_MUX_eth_8_h_l179_c5_6cd8_iffalse,
state_MUX_eth_8_h_l179_c5_6cd8_return_output);

-- counter_MUX_eth_8_h_l179_c5_6cd8 : 0 clocks latency
counter_MUX_eth_8_h_l179_c5_6cd8 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l179_c5_6cd8_cond,
counter_MUX_eth_8_h_l179_c5_6cd8_iftrue,
counter_MUX_eth_8_h_l179_c5_6cd8_iffalse,
counter_MUX_eth_8_h_l179_c5_6cd8_return_output);

-- state_MUX_eth_8_h_l180_c7_47d7 : 0 clocks latency
state_MUX_eth_8_h_l180_c7_47d7 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l180_c7_47d7_cond,
state_MUX_eth_8_h_l180_c7_47d7_iftrue,
state_MUX_eth_8_h_l180_c7_47d7_iffalse,
state_MUX_eth_8_h_l180_c7_47d7_return_output);

-- counter_MUX_eth_8_h_l180_c7_47d7 : 0 clocks latency
counter_MUX_eth_8_h_l180_c7_47d7 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l180_c7_47d7_cond,
counter_MUX_eth_8_h_l180_c7_47d7_iftrue,
counter_MUX_eth_8_h_l180_c7_47d7_iffalse,
counter_MUX_eth_8_h_l180_c7_47d7_return_output);

-- state_MUX_eth_8_h_l182_c9_cf99 : 0 clocks latency
state_MUX_eth_8_h_l182_c9_cf99 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l182_c9_cf99_cond,
state_MUX_eth_8_h_l182_c9_cf99_iftrue,
state_MUX_eth_8_h_l182_c9_cf99_iffalse,
state_MUX_eth_8_h_l182_c9_cf99_return_output);

-- counter_MUX_eth_8_h_l182_c9_cf99 : 0 clocks latency
counter_MUX_eth_8_h_l182_c9_cf99 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l182_c9_cf99_cond,
counter_MUX_eth_8_h_l182_c9_cf99_iftrue,
counter_MUX_eth_8_h_l182_c9_cf99_iffalse,
counter_MUX_eth_8_h_l182_c9_cf99_return_output);

-- counter_MUX_eth_8_h_l189_c7_9feb : 0 clocks latency
counter_MUX_eth_8_h_l189_c7_9feb : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l189_c7_9feb_cond,
counter_MUX_eth_8_h_l189_c7_9feb_iftrue,
counter_MUX_eth_8_h_l189_c7_9feb_iffalse,
counter_MUX_eth_8_h_l189_c7_9feb_return_output);

-- BIN_OP_PLUS_eth_8_h_l190_c9_715f : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l190_c9_715f : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l190_c9_715f_left,
BIN_OP_PLUS_eth_8_h_l190_c9_715f_right,
BIN_OP_PLUS_eth_8_h_l190_c9_715f_return_output);

-- BIN_OP_EQ_eth_8_h_l195_c11_ae46 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l195_c11_ae46 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l195_c11_ae46_left,
BIN_OP_EQ_eth_8_h_l195_c11_ae46_right,
BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output);

-- o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005 : 0 clocks latency
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_cond,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iftrue,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iffalse,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_return_output);

-- o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005 : 0 clocks latency
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_cond,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iftrue,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iffalse,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_return_output);

-- o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005 : 0 clocks latency
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005 : entity work.MUX_uint1_t_uint8_t_1_uint8_t_1_0CLK_de264c78 port map (
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_cond,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iftrue,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iffalse,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_return_output);

-- state_MUX_eth_8_h_l195_c8_3005 : 0 clocks latency
state_MUX_eth_8_h_l195_c8_3005 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l195_c8_3005_cond,
state_MUX_eth_8_h_l195_c8_3005_iftrue,
state_MUX_eth_8_h_l195_c8_3005_iffalse,
state_MUX_eth_8_h_l195_c8_3005_return_output);

-- counter_MUX_eth_8_h_l195_c8_3005 : 0 clocks latency
counter_MUX_eth_8_h_l195_c8_3005 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l195_c8_3005_cond,
counter_MUX_eth_8_h_l195_c8_3005_iftrue,
counter_MUX_eth_8_h_l195_c8_3005_iffalse,
counter_MUX_eth_8_h_l195_c8_3005_return_output);

-- UNARY_OP_NOT_eth_8_h_l197_c30_85b7 : 0 clocks latency
UNARY_OP_NOT_eth_8_h_l197_c30_85b7 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_eth_8_h_l197_c30_85b7_expr,
UNARY_OP_NOT_eth_8_h_l197_c30_85b7_return_output);

-- BIN_OP_AND_eth_8_h_l199_c8_f83f : 0 clocks latency
BIN_OP_AND_eth_8_h_l199_c8_f83f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l199_c8_f83f_left,
BIN_OP_AND_eth_8_h_l199_c8_f83f_right,
BIN_OP_AND_eth_8_h_l199_c8_f83f_return_output);

-- state_MUX_eth_8_h_l199_c5_09c8 : 0 clocks latency
state_MUX_eth_8_h_l199_c5_09c8 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l199_c5_09c8_cond,
state_MUX_eth_8_h_l199_c5_09c8_iftrue,
state_MUX_eth_8_h_l199_c5_09c8_iffalse,
state_MUX_eth_8_h_l199_c5_09c8_return_output);

-- counter_MUX_eth_8_h_l199_c5_09c8 : 0 clocks latency
counter_MUX_eth_8_h_l199_c5_09c8 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l199_c5_09c8_cond,
counter_MUX_eth_8_h_l199_c5_09c8_iftrue,
counter_MUX_eth_8_h_l199_c5_09c8_iffalse,
counter_MUX_eth_8_h_l199_c5_09c8_return_output);

-- BIN_OP_PLUS_eth_8_h_l200_c7_15d7 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l200_c7_15d7 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l200_c7_15d7_left,
BIN_OP_PLUS_eth_8_h_l200_c7_15d7_right,
BIN_OP_PLUS_eth_8_h_l200_c7_15d7_return_output);

-- state_MUX_eth_8_h_l201_c7_c716 : 0 clocks latency
state_MUX_eth_8_h_l201_c7_c716 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l201_c7_c716_cond,
state_MUX_eth_8_h_l201_c7_c716_iftrue,
state_MUX_eth_8_h_l201_c7_c716_iffalse,
state_MUX_eth_8_h_l201_c7_c716_return_output);

-- counter_MUX_eth_8_h_l201_c7_c716 : 0 clocks latency
counter_MUX_eth_8_h_l201_c7_c716 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l201_c7_c716_cond,
counter_MUX_eth_8_h_l201_c7_c716_iftrue,
counter_MUX_eth_8_h_l201_c7_c716_iffalse,
counter_MUX_eth_8_h_l201_c7_c716_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 frame,
 mac_axis_ready,
 -- Registers
 state,
 header,
 counter,
 -- All submodule outputs
 BIN_OP_LT_eth_8_h_l124_c32_2059_return_output,
 BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output,
 header_MUX_eth_8_h_l128_c3_9063_return_output,
 o_MUX_eth_8_h_l128_c3_9063_return_output,
 state_MUX_eth_8_h_l128_c3_9063_return_output,
 counter_MUX_eth_8_h_l128_c3_9063_return_output,
 header_MUX_eth_8_h_l130_c5_01d0_return_output,
 o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_return_output,
 o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_return_output,
 state_MUX_eth_8_h_l130_c5_01d0_return_output,
 counter_MUX_eth_8_h_l130_c5_01d0_return_output,
 BIN_OP_EQ_eth_8_h_l131_c10_413a_return_output,
 header_MUX_eth_8_h_l131_c7_5aaa_return_output,
 header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_return_output,
 state_MUX_eth_8_h_l136_c7_6d1b_return_output,
 counter_MUX_eth_8_h_l136_c7_6d1b_return_output,
 CONST_SL_8_eth_8_h_l137_c26_2750_return_output,
 BIN_OP_EQ_eth_8_h_l138_c12_efe5_return_output,
 state_MUX_eth_8_h_l138_c9_374d_return_output,
 counter_MUX_eth_8_h_l138_c9_374d_return_output,
 BIN_OP_PLUS_eth_8_h_l142_c11_6d42_return_output,
 BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output,
 header_ethertype_MUX_eth_8_h_l146_c9_5a3c_return_output,
 header_src_mac_MUX_eth_8_h_l146_c9_5a3c_return_output,
 o_MUX_eth_8_h_l146_c9_5a3c_return_output,
 state_MUX_eth_8_h_l146_c9_5a3c_return_output,
 counter_MUX_eth_8_h_l146_c9_5a3c_return_output,
 header_src_mac_MUX_eth_8_h_l149_c5_f7ae_return_output,
 state_MUX_eth_8_h_l149_c5_f7ae_return_output,
 counter_MUX_eth_8_h_l149_c5_f7ae_return_output,
 CONST_SL_8_eth_8_h_l150_c24_9160_return_output,
 BIN_OP_EQ_eth_8_h_l151_c10_f38a_return_output,
 state_MUX_eth_8_h_l151_c7_9b4c_return_output,
 counter_MUX_eth_8_h_l151_c7_9b4c_return_output,
 BIN_OP_PLUS_eth_8_h_l155_c9_e29b_return_output,
 BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output,
 header_ethertype_MUX_eth_8_h_l158_c9_e948_return_output,
 o_MUX_eth_8_h_l158_c9_e948_return_output,
 state_MUX_eth_8_h_l158_c9_e948_return_output,
 counter_MUX_eth_8_h_l158_c9_e948_return_output,
 header_ethertype_MUX_eth_8_h_l161_c5_5fe4_return_output,
 state_MUX_eth_8_h_l161_c5_5fe4_return_output,
 counter_MUX_eth_8_h_l161_c5_5fe4_return_output,
 CONST_SL_8_eth_8_h_l162_c26_2158_return_output,
 BIN_OP_EQ_eth_8_h_l163_c10_9dac_return_output,
 state_MUX_eth_8_h_l163_c7_e053_return_output,
 counter_MUX_eth_8_h_l163_c7_e053_return_output,
 BIN_OP_PLUS_eth_8_h_l167_c9_f596_return_output,
 BIN_OP_EQ_eth_8_h_l172_c11_a070_return_output,
 o_MUX_eth_8_h_l172_c8_2225_return_output,
 state_MUX_eth_8_h_l172_c8_2225_return_output,
 counter_MUX_eth_8_h_l172_c8_2225_return_output,
 MUX_eth_8_h_l176_c29_7852_return_output,
 BIN_OP_AND_eth_8_h_l179_c8_58bc_return_output,
 state_MUX_eth_8_h_l179_c5_6cd8_return_output,
 counter_MUX_eth_8_h_l179_c5_6cd8_return_output,
 state_MUX_eth_8_h_l180_c7_47d7_return_output,
 counter_MUX_eth_8_h_l180_c7_47d7_return_output,
 state_MUX_eth_8_h_l182_c9_cf99_return_output,
 counter_MUX_eth_8_h_l182_c9_cf99_return_output,
 counter_MUX_eth_8_h_l189_c7_9feb_return_output,
 BIN_OP_PLUS_eth_8_h_l190_c9_715f_return_output,
 BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output,
 o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_return_output,
 o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_return_output,
 o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_return_output,
 state_MUX_eth_8_h_l195_c8_3005_return_output,
 counter_MUX_eth_8_h_l195_c8_3005_return_output,
 UNARY_OP_NOT_eth_8_h_l197_c30_85b7_return_output,
 BIN_OP_AND_eth_8_h_l199_c8_f83f_return_output,
 state_MUX_eth_8_h_l199_c5_09c8_return_output,
 counter_MUX_eth_8_h_l199_c5_09c8_return_output,
 BIN_OP_PLUS_eth_8_h_l200_c7_15d7_return_output,
 state_MUX_eth_8_h_l201_c7_c716_return_output,
 counter_MUX_eth_8_h_l201_c7_c716_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eth_8_tx_t;
 variable VAR_frame : eth8_frame_t_stream_t;
 variable VAR_mac_axis_ready : unsigned(0 downto 0);
 variable VAR_o : eth_8_tx_t;
 variable VAR_undersized_payload : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l128_c3_9063_iftrue : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_01d0_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_9063_iffalse : eth_header_t;
 variable VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l128_c3_9063_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_9063_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_9063_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l128_c3_9063_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_9063_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_9063_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_5a3c_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_9063_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_9063_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_9063_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_01d0_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_9063_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_5a3c_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_9063_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_9063_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_9063_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_01d0_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_9063_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_5a3c_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_9063_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_9063_cond : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l130_c5_01d0_iftrue : eth_header_t;
 variable VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_01d0_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_01d0_iffalse : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iftrue : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_01d0_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iffalse : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_01d0_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_6d1b_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_01d0_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_01d0_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_6d1b_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_01d0_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_01d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_413a_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_413a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_413a_return_output : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l131_c7_5aaa_iftrue : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_5aaa_iffalse : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_5aaa_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_5aaa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_b911_return_output : eth_header_t;
 variable VAR_uint48_47_40_eth_8_h_l135_c34_ca36_return_output : unsigned(7 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iftrue : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iffalse : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_return_output : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_6d1b_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_374d_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_6d1b_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_6d1b_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_6d1b_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_374d_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_6d1b_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_6d1b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l137_c26_2750_return_output : unsigned(47 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l137_c26_2750_x : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_374d_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_374d_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_374d_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_374d_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l140_c11_d735 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_374d_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l142_c11_6117 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_374d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_6d42_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_6d42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_6d42_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l146_c9_5a3c_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_5a3c_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_5a3c_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_e948_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_5a3c_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_f7ae_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_5a3c_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_e948_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_5a3c_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_f7ae_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_5a3c_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_e948_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_5a3c_cond : unsigned(0 downto 0);
 variable VAR_uint48_47_40_eth_8_h_l148_c32_2981_return_output : unsigned(7 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_f7ae_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_9b4c_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_f7ae_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_f7ae_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_f7ae_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_9b4c_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_f7ae_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_f7ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l150_c24_9160_return_output : unsigned(47 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l150_c24_9160_x : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_9b4c_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_9b4c_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_9b4c_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_9b4c_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l153_c9_6d0c : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_9b4c_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l155_c9_e9aa : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_9b4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_e29b_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_e29b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_e29b_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l158_c9_e948_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_e948_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_e948_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_2225_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_e948_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_e948_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_5fe4_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_e948_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_2225_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_e948_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_e948_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_5fe4_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_e948_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_2225_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_e948_cond : unsigned(0 downto 0);
 variable VAR_uint16_15_8_eth_8_h_l160_c32_a79a_return_output : unsigned(7 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_5fe4_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_e053_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_5fe4_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_5fe4_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_5fe4_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_e053_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_5fe4_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_5fe4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l162_c26_2158_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l162_c26_2158_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_e053_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_e053_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_e053_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_e053_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l165_c9_96ab : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_e053_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l167_c9_17ef : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_e053_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_f596_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_f596_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_f596_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l172_c8_2225_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_2225_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_2225_iffalse : eth_8_tx_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4_eth_8_h_l172_c8_2225_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_2225_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_2225_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_6cd8_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_2225_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_3005_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_2225_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_2225_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_6cd8_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_2225_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_3005_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_2225_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_2b08_return_output : axis8_t;
 variable VAR_MUX_eth_8_h_l176_c29_7852_cond : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_7852_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_7852_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_7852_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_6cd8_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_47d7_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_6cd8_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_6cd8_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_6cd8_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_9feb_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_6cd8_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_6cd8_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_47d7_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_cf99_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_47d7_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_47d7_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_47d7_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_cf99_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_47d7_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_47d7_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_47d7_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_cf99_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_cf99_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_cf99_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_cf99_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_cf99_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l186_c11_4c0e : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_cf99_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_9feb_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l190_c9_3473 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_9feb_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_9feb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_715f_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_715f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_715f_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_3005_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iftrue : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_3005_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iffalse : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_3005_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_09c8_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_3005_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_3005_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_09c8_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_3005_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_3005_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_2f64 : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l197_c30_85b7_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l197_c30_85b7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_09c8_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_c716_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_09c8_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_09c8_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_09c8_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_c716_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_09c8_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_09c8_cond : unsigned(0 downto 0);
 variable VAR_counter_eth_8_h_l200_c7_f8d7 : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_15d7_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_15d7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_15d7_return_output : unsigned(6 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_c716_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_c716_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_c716_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_c716_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l203_c9_10f1 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_c716_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_c716_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l137_l136_DUPLICATE_a6e6_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_d474_return_output : uint8_t_1;
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l148_l149_l150_DUPLICATE_4615_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l162_l158_l161_l160_l146_DUPLICATE_c3fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_eb49_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_state : unsigned(2 downto 0);
variable REG_VAR_header : eth_header_t;
variable REG_VAR_counter : unsigned(5 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_state := state;
  REG_VAR_header := header;
  REG_VAR_counter := counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_state_MUX_eth_8_h_l182_c9_cf99_iftrue := unsigned(eth8_state_t_to_slv(PADDING));
     VAR_counter_eth_8_h_l165_c9_96ab := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l163_c7_e053_iftrue := VAR_counter_eth_8_h_l165_c9_96ab;
     VAR_state_MUX_eth_8_h_l151_c7_9b4c_iftrue := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_left := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l201_c7_c716_iftrue := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_right := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_right := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_413a_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_715f_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l138_c9_374d_iftrue := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_counter_eth_8_h_l140_c11_d735 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l138_c9_374d_iftrue := VAR_counter_eth_8_h_l140_c11_d735;
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_right := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_MUX_eth_8_h_l176_c29_7852_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l163_c7_e053_iftrue := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_counter_eth_8_h_l153_c9_6d0c := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l151_c7_9b4c_iftrue := VAR_counter_eth_8_h_l153_c9_6d0c;
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_f596_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l203_c9_10f1 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l201_c7_c716_iftrue := VAR_counter_eth_8_h_l203_c9_10f1;
     VAR_state_MUX_eth_8_h_l182_c9_cf99_iffalse := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_2f64 := resize(to_unsigned(0, 1), 8);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iffalse := to_unsigned(0, 1);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iffalse := to_unsigned(0, 1);
     VAR_counter_eth_8_h_l186_c11_4c0e := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l182_c9_cf99_iffalse := VAR_counter_eth_8_h_l186_c11_4c0e;
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_right := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_e29b_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_15d7_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_6d42_right := to_unsigned(1, 1);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_right := unsigned(eth8_state_t_to_slv(PADDING));
     -- o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d[eth_8_h_l195_c8_3005] LATENCY=0
     VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_3005_return_output := eth_8_tx_t_NULL.mac_axis.data.tlast;

     -- CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_d474 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_d474_return_output := eth_8_tx_t_NULL.mac_axis.data.tdata;

     -- o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3[eth_8_h_l195_c8_3005] LATENCY=0
     VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_3005_return_output := CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3(
     VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_2f64);

     -- Submodule level 1
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iftrue := VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_3005_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iffalse := VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_d474_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iffalse := VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_d474_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iffalse := VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_3005_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_frame := frame;
     VAR_mac_axis_ready := mac_axis_ready;

     -- Submodule level 0
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_413a_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_left := counter;
     VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_6d42_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_e29b_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_f596_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_15d7_left := counter;
     VAR_counter_MUX_eth_8_h_l130_c5_01d0_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l136_c7_6d1b_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l149_c5_f7ae_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l161_c5_5fe4_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l179_c5_6cd8_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l180_c7_47d7_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l182_c9_cf99_iftrue := counter;
     VAR_counter_MUX_eth_8_h_l195_c8_3005_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l199_c5_09c8_iffalse := counter;
     VAR_header_MUX_eth_8_h_l130_c5_01d0_iffalse := header;
     VAR_header_MUX_eth_8_h_l131_c7_5aaa_iffalse := header;
     VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_right := VAR_mac_axis_ready;
     VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_right := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l136_c7_6d1b_cond := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l149_c5_f7ae_cond := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l161_c5_5fe4_cond := VAR_mac_axis_ready;
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_cond := VAR_mac_axis_ready;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_cond := VAR_mac_axis_ready;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l136_c7_6d1b_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l149_c5_f7ae_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l161_c5_5fe4_cond := VAR_mac_axis_ready;
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_left := state;
     VAR_state_MUX_eth_8_h_l130_c5_01d0_iffalse := state;
     VAR_state_MUX_eth_8_h_l136_c7_6d1b_iffalse := state;
     VAR_state_MUX_eth_8_h_l138_c9_374d_iffalse := state;
     VAR_state_MUX_eth_8_h_l149_c5_f7ae_iffalse := state;
     VAR_state_MUX_eth_8_h_l151_c7_9b4c_iffalse := state;
     VAR_state_MUX_eth_8_h_l161_c5_5fe4_iffalse := state;
     VAR_state_MUX_eth_8_h_l163_c7_e053_iffalse := state;
     VAR_state_MUX_eth_8_h_l179_c5_6cd8_iffalse := state;
     VAR_state_MUX_eth_8_h_l180_c7_47d7_iffalse := state;
     VAR_state_MUX_eth_8_h_l195_c8_3005_iffalse := state;
     VAR_state_MUX_eth_8_h_l199_c5_09c8_iffalse := state;
     VAR_state_MUX_eth_8_h_l201_c7_c716_iffalse := state;
     -- BIN_OP_EQ[eth_8_h_l158_c12_0b87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l158_c12_0b87_left <= VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_left;
     BIN_OP_EQ_eth_8_h_l158_c12_0b87_right <= VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output := BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_eb49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_eb49_return_output := VAR_frame.data.payload.tlast;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f_return_output := VAR_frame.valid;

     -- BIN_OP_EQ[eth_8_h_l146_c12_2896] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l146_c12_2896_left <= VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_left;
     BIN_OP_EQ_eth_8_h_l146_c12_2896_right <= VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output := BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output;

     -- CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d[eth_8_h_l132_c18_b911] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_b911_return_output := VAR_frame.data.header;

     -- BIN_OP_EQ[eth_8_h_l163_c10_9dac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l163_c10_9dac_left <= VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_left;
     BIN_OP_EQ_eth_8_h_l163_c10_9dac_right <= VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_return_output := BIN_OP_EQ_eth_8_h_l163_c10_9dac_return_output;

     -- CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l148_l149_l150_DUPLICATE_4615 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l148_l149_l150_DUPLICATE_4615_return_output := header.src_mac;

     -- CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d[eth_8_h_l174_c23_2b08] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_2b08_return_output := VAR_frame.data.payload;

     -- BIN_OP_PLUS[eth_8_h_l155_c9_e29b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l155_c9_e29b_left <= VAR_BIN_OP_PLUS_eth_8_h_l155_c9_e29b_left;
     BIN_OP_PLUS_eth_8_h_l155_c9_e29b_right <= VAR_BIN_OP_PLUS_eth_8_h_l155_c9_e29b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_e29b_return_output := BIN_OP_PLUS_eth_8_h_l155_c9_e29b_return_output;

     -- BIN_OP_PLUS[eth_8_h_l200_c7_15d7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l200_c7_15d7_left <= VAR_BIN_OP_PLUS_eth_8_h_l200_c7_15d7_left;
     BIN_OP_PLUS_eth_8_h_l200_c7_15d7_right <= VAR_BIN_OP_PLUS_eth_8_h_l200_c7_15d7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_15d7_return_output := BIN_OP_PLUS_eth_8_h_l200_c7_15d7_return_output;

     -- BIN_OP_AND[eth_8_h_l199_c8_f83f] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l199_c8_f83f_left <= VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_left;
     BIN_OP_AND_eth_8_h_l199_c8_f83f_right <= VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_return_output := BIN_OP_AND_eth_8_h_l199_c8_f83f_return_output;

     -- BIN_OP_EQ[eth_8_h_l151_c10_f38a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l151_c10_f38a_left <= VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_left;
     BIN_OP_EQ_eth_8_h_l151_c10_f38a_right <= VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_return_output := BIN_OP_EQ_eth_8_h_l151_c10_f38a_return_output;

     -- BIN_OP_EQ[eth_8_h_l172_c11_a070] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l172_c11_a070_left <= VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_left;
     BIN_OP_EQ_eth_8_h_l172_c11_a070_right <= VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_return_output := BIN_OP_EQ_eth_8_h_l172_c11_a070_return_output;

     -- BIN_OP_EQ[eth_8_h_l138_c12_efe5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l138_c12_efe5_left <= VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_left;
     BIN_OP_EQ_eth_8_h_l138_c12_efe5_right <= VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_return_output := BIN_OP_EQ_eth_8_h_l138_c12_efe5_return_output;

     -- BIN_OP_LT[eth_8_h_l124_c32_2059] LATENCY=0
     -- Inputs
     BIN_OP_LT_eth_8_h_l124_c32_2059_left <= VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_left;
     BIN_OP_LT_eth_8_h_l124_c32_2059_right <= VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_right;
     -- Outputs
     VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_return_output := BIN_OP_LT_eth_8_h_l124_c32_2059_return_output;

     -- BIN_OP_EQ[eth_8_h_l195_c11_ae46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l195_c11_ae46_left <= VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_left;
     BIN_OP_EQ_eth_8_h_l195_c11_ae46_right <= VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output := BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output;

     -- BIN_OP_PLUS[eth_8_h_l142_c11_6d42] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l142_c11_6d42_left <= VAR_BIN_OP_PLUS_eth_8_h_l142_c11_6d42_left;
     BIN_OP_PLUS_eth_8_h_l142_c11_6d42_right <= VAR_BIN_OP_PLUS_eth_8_h_l142_c11_6d42_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_6d42_return_output := BIN_OP_PLUS_eth_8_h_l142_c11_6d42_return_output;

     -- CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l162_l158_l161_l160_l146_DUPLICATE_c3fa LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l162_l158_l161_l160_l146_DUPLICATE_c3fa_return_output := header.ethertype;

     -- BIN_OP_EQ[eth_8_h_l128_c6_3297] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l128_c6_3297_left <= VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_left;
     BIN_OP_EQ_eth_8_h_l128_c6_3297_right <= VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output := BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output;

     -- BIN_OP_PLUS[eth_8_h_l167_c9_f596] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l167_c9_f596_left <= VAR_BIN_OP_PLUS_eth_8_h_l167_c9_f596_left;
     BIN_OP_PLUS_eth_8_h_l167_c9_f596_right <= VAR_BIN_OP_PLUS_eth_8_h_l167_c9_f596_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_f596_return_output := BIN_OP_PLUS_eth_8_h_l167_c9_f596_return_output;

     -- BIN_OP_EQ[eth_8_h_l131_c10_413a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l131_c10_413a_left <= VAR_BIN_OP_EQ_eth_8_h_l131_c10_413a_left;
     BIN_OP_EQ_eth_8_h_l131_c10_413a_right <= VAR_BIN_OP_EQ_eth_8_h_l131_c10_413a_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_413a_return_output := BIN_OP_EQ_eth_8_h_l131_c10_413a_return_output;

     -- Submodule level 1
     VAR_counter_MUX_eth_8_h_l199_c5_09c8_cond := VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_return_output;
     VAR_state_MUX_eth_8_h_l199_c5_09c8_cond := VAR_BIN_OP_AND_eth_8_h_l199_c8_f83f_return_output;
     VAR_counter_MUX_eth_8_h_l128_c3_9063_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_9063_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_9063_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_9063_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_3297_return_output;
     VAR_header_MUX_eth_8_h_l131_c7_5aaa_cond := VAR_BIN_OP_EQ_eth_8_h_l131_c10_413a_return_output;
     VAR_counter_MUX_eth_8_h_l138_c9_374d_cond := VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_return_output;
     VAR_state_MUX_eth_8_h_l138_c9_374d_cond := VAR_BIN_OP_EQ_eth_8_h_l138_c12_efe5_return_output;
     VAR_counter_MUX_eth_8_h_l146_c9_5a3c_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_5a3c_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_5a3c_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_2896_return_output;
     VAR_counter_MUX_eth_8_h_l151_c7_9b4c_cond := VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_return_output;
     VAR_state_MUX_eth_8_h_l151_c7_9b4c_cond := VAR_BIN_OP_EQ_eth_8_h_l151_c10_f38a_return_output;
     VAR_counter_MUX_eth_8_h_l158_c9_e948_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_e948_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_e948_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_0b87_return_output;
     VAR_counter_MUX_eth_8_h_l163_c7_e053_cond := VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_return_output;
     VAR_state_MUX_eth_8_h_l163_c7_e053_cond := VAR_BIN_OP_EQ_eth_8_h_l163_c10_9dac_return_output;
     VAR_counter_MUX_eth_8_h_l172_c8_2225_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_2225_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_2225_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_a070_return_output;
     VAR_counter_MUX_eth_8_h_l195_c8_3005_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output;
     VAR_state_MUX_eth_8_h_l195_c8_3005_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_ae46_return_output;
     VAR_MUX_eth_8_h_l176_c29_7852_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_return_output;
     VAR_UNARY_OP_NOT_eth_8_h_l197_c30_85b7_expr := VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_return_output;
     VAR_counter_MUX_eth_8_h_l182_c9_cf99_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_9feb_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_return_output;
     VAR_state_MUX_eth_8_h_l182_c9_cf99_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_2059_return_output;
     VAR_counter_eth_8_h_l142_c11_6117 := resize(VAR_BIN_OP_PLUS_eth_8_h_l142_c11_6d42_return_output, 6);
     VAR_counter_eth_8_h_l155_c9_e9aa := resize(VAR_BIN_OP_PLUS_eth_8_h_l155_c9_e29b_return_output, 6);
     VAR_counter_eth_8_h_l167_c9_17ef := resize(VAR_BIN_OP_PLUS_eth_8_h_l167_c9_f596_return_output, 6);
     VAR_counter_eth_8_h_l200_c7_f8d7 := resize(VAR_BIN_OP_PLUS_eth_8_h_l200_c7_15d7_return_output, 6);
     VAR_header_MUX_eth_8_h_l131_c7_5aaa_iftrue := VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_b911_return_output;
     VAR_CONST_SL_8_eth_8_h_l162_c26_2158_x := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l162_l158_l161_l160_l146_DUPLICATE_c3fa_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iftrue := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l162_l158_l161_l160_l146_DUPLICATE_c3fa_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l162_l158_l161_l160_l146_DUPLICATE_c3fa_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l162_l158_l161_l160_l146_DUPLICATE_c3fa_return_output;
     VAR_MUX_eth_8_h_l176_c29_7852_iffalse := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_eb49_return_output;
     VAR_counter_MUX_eth_8_h_l180_c7_47d7_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_eb49_return_output;
     VAR_state_MUX_eth_8_h_l180_c7_47d7_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_eb49_return_output;
     VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_left := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f_return_output;
     VAR_counter_MUX_eth_8_h_l130_c5_01d0_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f_return_output;
     VAR_header_MUX_eth_8_h_l130_c5_01d0_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f_return_output;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f_return_output;
     VAR_state_MUX_eth_8_h_l130_c5_01d0_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f_return_output;
     VAR_CONST_SL_8_eth_8_h_l150_c24_9160_x := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l148_l149_l150_DUPLICATE_4615_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l148_l149_l150_DUPLICATE_4615_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l148_l149_l150_DUPLICATE_4615_return_output;
     VAR_counter_MUX_eth_8_h_l138_c9_374d_iffalse := VAR_counter_eth_8_h_l142_c11_6117;
     VAR_counter_MUX_eth_8_h_l151_c7_9b4c_iffalse := VAR_counter_eth_8_h_l155_c9_e9aa;
     VAR_counter_MUX_eth_8_h_l163_c7_e053_iffalse := VAR_counter_eth_8_h_l167_c9_17ef;
     VAR_counter_MUX_eth_8_h_l201_c7_c716_iffalse := VAR_counter_eth_8_h_l200_c7_f8d7;
     -- counter_MUX[eth_8_h_l138_c9_374d] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l138_c9_374d_cond <= VAR_counter_MUX_eth_8_h_l138_c9_374d_cond;
     counter_MUX_eth_8_h_l138_c9_374d_iftrue <= VAR_counter_MUX_eth_8_h_l138_c9_374d_iftrue;
     counter_MUX_eth_8_h_l138_c9_374d_iffalse <= VAR_counter_MUX_eth_8_h_l138_c9_374d_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l138_c9_374d_return_output := counter_MUX_eth_8_h_l138_c9_374d_return_output;

     -- counter_MUX[eth_8_h_l151_c7_9b4c] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l151_c7_9b4c_cond <= VAR_counter_MUX_eth_8_h_l151_c7_9b4c_cond;
     counter_MUX_eth_8_h_l151_c7_9b4c_iftrue <= VAR_counter_MUX_eth_8_h_l151_c7_9b4c_iftrue;
     counter_MUX_eth_8_h_l151_c7_9b4c_iffalse <= VAR_counter_MUX_eth_8_h_l151_c7_9b4c_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l151_c7_9b4c_return_output := counter_MUX_eth_8_h_l151_c7_9b4c_return_output;

     -- o_mac_axis_valid_MUX[eth_8_h_l195_c8_3005] LATENCY=0
     -- Inputs
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_cond <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_cond;
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iftrue <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iftrue;
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iffalse <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_iffalse;
     -- Outputs
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_return_output := o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_return_output;

     -- header_MUX[eth_8_h_l131_c7_5aaa] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l131_c7_5aaa_cond <= VAR_header_MUX_eth_8_h_l131_c7_5aaa_cond;
     header_MUX_eth_8_h_l131_c7_5aaa_iftrue <= VAR_header_MUX_eth_8_h_l131_c7_5aaa_iftrue;
     header_MUX_eth_8_h_l131_c7_5aaa_iffalse <= VAR_header_MUX_eth_8_h_l131_c7_5aaa_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l131_c7_5aaa_return_output := header_MUX_eth_8_h_l131_c7_5aaa_return_output;

     -- BIN_OP_AND[eth_8_h_l179_c8_58bc] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l179_c8_58bc_left <= VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_left;
     BIN_OP_AND_eth_8_h_l179_c8_58bc_right <= VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_return_output := BIN_OP_AND_eth_8_h_l179_c8_58bc_return_output;

     -- UNARY_OP_NOT[eth_8_h_l197_c30_85b7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_eth_8_h_l197_c30_85b7_expr <= VAR_UNARY_OP_NOT_eth_8_h_l197_c30_85b7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_eth_8_h_l197_c30_85b7_return_output := UNARY_OP_NOT_eth_8_h_l197_c30_85b7_return_output;

     -- uint48_47_40[eth_8_h_l148_c32_2981] LATENCY=0
     VAR_uint48_47_40_eth_8_h_l148_c32_2981_return_output := uint48_47_40(
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l148_l149_l150_DUPLICATE_4615_return_output);

     -- state_MUX[eth_8_h_l151_c7_9b4c] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l151_c7_9b4c_cond <= VAR_state_MUX_eth_8_h_l151_c7_9b4c_cond;
     state_MUX_eth_8_h_l151_c7_9b4c_iftrue <= VAR_state_MUX_eth_8_h_l151_c7_9b4c_iftrue;
     state_MUX_eth_8_h_l151_c7_9b4c_iffalse <= VAR_state_MUX_eth_8_h_l151_c7_9b4c_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l151_c7_9b4c_return_output := state_MUX_eth_8_h_l151_c7_9b4c_return_output;

     -- state_MUX[eth_8_h_l138_c9_374d] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l138_c9_374d_cond <= VAR_state_MUX_eth_8_h_l138_c9_374d_cond;
     state_MUX_eth_8_h_l138_c9_374d_iftrue <= VAR_state_MUX_eth_8_h_l138_c9_374d_iftrue;
     state_MUX_eth_8_h_l138_c9_374d_iffalse <= VAR_state_MUX_eth_8_h_l138_c9_374d_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l138_c9_374d_return_output := state_MUX_eth_8_h_l138_c9_374d_return_output;

     -- counter_MUX[eth_8_h_l163_c7_e053] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l163_c7_e053_cond <= VAR_counter_MUX_eth_8_h_l163_c7_e053_cond;
     counter_MUX_eth_8_h_l163_c7_e053_iftrue <= VAR_counter_MUX_eth_8_h_l163_c7_e053_iftrue;
     counter_MUX_eth_8_h_l163_c7_e053_iffalse <= VAR_counter_MUX_eth_8_h_l163_c7_e053_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l163_c7_e053_return_output := counter_MUX_eth_8_h_l163_c7_e053_return_output;

     -- o_mac_axis_data_tdata_MUX[eth_8_h_l195_c8_3005] LATENCY=0
     -- Inputs
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_cond <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_cond;
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iftrue <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iftrue;
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iffalse <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_return_output := o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_return_output;

     -- state_MUX[eth_8_h_l182_c9_cf99] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l182_c9_cf99_cond <= VAR_state_MUX_eth_8_h_l182_c9_cf99_cond;
     state_MUX_eth_8_h_l182_c9_cf99_iftrue <= VAR_state_MUX_eth_8_h_l182_c9_cf99_iftrue;
     state_MUX_eth_8_h_l182_c9_cf99_iffalse <= VAR_state_MUX_eth_8_h_l182_c9_cf99_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l182_c9_cf99_return_output := state_MUX_eth_8_h_l182_c9_cf99_return_output;

     -- o_mac_axis_valid_MUX[eth_8_h_l130_c5_01d0] LATENCY=0
     -- Inputs
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_cond <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_cond;
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iftrue <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iftrue;
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iffalse <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_iffalse;
     -- Outputs
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_return_output := o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_return_output;

     -- CONST_SL_8[eth_8_h_l150_c24_9160] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l150_c24_9160_x <= VAR_CONST_SL_8_eth_8_h_l150_c24_9160_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l150_c24_9160_return_output := CONST_SL_8_eth_8_h_l150_c24_9160_return_output;

     -- CONST_SL_8[eth_8_h_l162_c26_2158] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l162_c26_2158_x <= VAR_CONST_SL_8_eth_8_h_l162_c26_2158_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l162_c26_2158_return_output := CONST_SL_8_eth_8_h_l162_c26_2158_return_output;

     -- state_MUX[eth_8_h_l163_c7_e053] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l163_c7_e053_cond <= VAR_state_MUX_eth_8_h_l163_c7_e053_cond;
     state_MUX_eth_8_h_l163_c7_e053_iftrue <= VAR_state_MUX_eth_8_h_l163_c7_e053_iftrue;
     state_MUX_eth_8_h_l163_c7_e053_iffalse <= VAR_state_MUX_eth_8_h_l163_c7_e053_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l163_c7_e053_return_output := state_MUX_eth_8_h_l163_c7_e053_return_output;

     -- counter_MUX[eth_8_h_l182_c9_cf99] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l182_c9_cf99_cond <= VAR_counter_MUX_eth_8_h_l182_c9_cf99_cond;
     counter_MUX_eth_8_h_l182_c9_cf99_iftrue <= VAR_counter_MUX_eth_8_h_l182_c9_cf99_iftrue;
     counter_MUX_eth_8_h_l182_c9_cf99_iffalse <= VAR_counter_MUX_eth_8_h_l182_c9_cf99_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l182_c9_cf99_return_output := counter_MUX_eth_8_h_l182_c9_cf99_return_output;

     -- uint16_15_8[eth_8_h_l160_c32_a79a] LATENCY=0
     VAR_uint16_15_8_eth_8_h_l160_c32_a79a_return_output := uint16_15_8(
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l162_l158_l161_l160_l146_DUPLICATE_c3fa_return_output);

     -- MUX[eth_8_h_l176_c29_7852] LATENCY=0
     -- Inputs
     MUX_eth_8_h_l176_c29_7852_cond <= VAR_MUX_eth_8_h_l176_c29_7852_cond;
     MUX_eth_8_h_l176_c29_7852_iftrue <= VAR_MUX_eth_8_h_l176_c29_7852_iftrue;
     MUX_eth_8_h_l176_c29_7852_iffalse <= VAR_MUX_eth_8_h_l176_c29_7852_iffalse;
     -- Outputs
     VAR_MUX_eth_8_h_l176_c29_7852_return_output := MUX_eth_8_h_l176_c29_7852_return_output;

     -- Submodule level 2
     VAR_counter_MUX_eth_8_h_l179_c5_6cd8_cond := VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_return_output;
     VAR_state_MUX_eth_8_h_l179_c5_6cd8_cond := VAR_BIN_OP_AND_eth_8_h_l179_c8_58bc_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iftrue := VAR_CONST_SL_8_eth_8_h_l150_c24_9160_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iftrue := VAR_CONST_SL_8_eth_8_h_l162_c26_2158_return_output;
     VAR_counter_MUX_eth_8_h_l201_c7_c716_cond := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_85b7_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iftrue := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_85b7_return_output;
     VAR_state_MUX_eth_8_h_l201_c7_c716_cond := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_85b7_return_output;
     VAR_counter_MUX_eth_8_h_l136_c7_6d1b_iftrue := VAR_counter_MUX_eth_8_h_l138_c9_374d_return_output;
     VAR_counter_MUX_eth_8_h_l149_c5_f7ae_iftrue := VAR_counter_MUX_eth_8_h_l151_c7_9b4c_return_output;
     VAR_counter_MUX_eth_8_h_l161_c5_5fe4_iftrue := VAR_counter_MUX_eth_8_h_l163_c7_e053_return_output;
     VAR_counter_MUX_eth_8_h_l180_c7_47d7_iftrue := VAR_counter_MUX_eth_8_h_l182_c9_cf99_return_output;
     VAR_state_MUX_eth_8_h_l136_c7_6d1b_iftrue := VAR_state_MUX_eth_8_h_l138_c9_374d_return_output;
     VAR_state_MUX_eth_8_h_l149_c5_f7ae_iftrue := VAR_state_MUX_eth_8_h_l151_c7_9b4c_return_output;
     VAR_state_MUX_eth_8_h_l161_c5_5fe4_iftrue := VAR_state_MUX_eth_8_h_l163_c7_e053_return_output;
     VAR_state_MUX_eth_8_h_l180_c7_47d7_iftrue := VAR_state_MUX_eth_8_h_l182_c9_cf99_return_output;
     -- CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l137_l136_DUPLICATE_a6e6 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l137_l136_DUPLICATE_a6e6_return_output := VAR_header_MUX_eth_8_h_l131_c7_5aaa_return_output.dst_mac;

     -- state_MUX[eth_8_h_l149_c5_f7ae] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l149_c5_f7ae_cond <= VAR_state_MUX_eth_8_h_l149_c5_f7ae_cond;
     state_MUX_eth_8_h_l149_c5_f7ae_iftrue <= VAR_state_MUX_eth_8_h_l149_c5_f7ae_iftrue;
     state_MUX_eth_8_h_l149_c5_f7ae_iffalse <= VAR_state_MUX_eth_8_h_l149_c5_f7ae_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l149_c5_f7ae_return_output := state_MUX_eth_8_h_l149_c5_f7ae_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb[eth_8_h_l158_c9_e948] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_e948_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_uint16_15_8_eth_8_h_l160_c32_a79a_return_output);

     -- state_MUX[eth_8_h_l161_c5_5fe4] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l161_c5_5fe4_cond <= VAR_state_MUX_eth_8_h_l161_c5_5fe4_cond;
     state_MUX_eth_8_h_l161_c5_5fe4_iftrue <= VAR_state_MUX_eth_8_h_l161_c5_5fe4_iftrue;
     state_MUX_eth_8_h_l161_c5_5fe4_iffalse <= VAR_state_MUX_eth_8_h_l161_c5_5fe4_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l161_c5_5fe4_return_output := state_MUX_eth_8_h_l161_c5_5fe4_return_output;

     -- counter_MUX[eth_8_h_l149_c5_f7ae] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l149_c5_f7ae_cond <= VAR_counter_MUX_eth_8_h_l149_c5_f7ae_cond;
     counter_MUX_eth_8_h_l149_c5_f7ae_iftrue <= VAR_counter_MUX_eth_8_h_l149_c5_f7ae_iftrue;
     counter_MUX_eth_8_h_l149_c5_f7ae_iffalse <= VAR_counter_MUX_eth_8_h_l149_c5_f7ae_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l149_c5_f7ae_return_output := counter_MUX_eth_8_h_l149_c5_f7ae_return_output;

     -- counter_MUX[eth_8_h_l136_c7_6d1b] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l136_c7_6d1b_cond <= VAR_counter_MUX_eth_8_h_l136_c7_6d1b_cond;
     counter_MUX_eth_8_h_l136_c7_6d1b_iftrue <= VAR_counter_MUX_eth_8_h_l136_c7_6d1b_iftrue;
     counter_MUX_eth_8_h_l136_c7_6d1b_iffalse <= VAR_counter_MUX_eth_8_h_l136_c7_6d1b_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l136_c7_6d1b_return_output := counter_MUX_eth_8_h_l136_c7_6d1b_return_output;

     -- counter_MUX[eth_8_h_l201_c7_c716] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l201_c7_c716_cond <= VAR_counter_MUX_eth_8_h_l201_c7_c716_cond;
     counter_MUX_eth_8_h_l201_c7_c716_iftrue <= VAR_counter_MUX_eth_8_h_l201_c7_c716_iftrue;
     counter_MUX_eth_8_h_l201_c7_c716_iffalse <= VAR_counter_MUX_eth_8_h_l201_c7_c716_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l201_c7_c716_return_output := counter_MUX_eth_8_h_l201_c7_c716_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb[eth_8_h_l146_c9_5a3c] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_5a3c_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_uint48_47_40_eth_8_h_l148_c32_2981_return_output);

     -- counter_MUX[eth_8_h_l180_c7_47d7] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l180_c7_47d7_cond <= VAR_counter_MUX_eth_8_h_l180_c7_47d7_cond;
     counter_MUX_eth_8_h_l180_c7_47d7_iftrue <= VAR_counter_MUX_eth_8_h_l180_c7_47d7_iftrue;
     counter_MUX_eth_8_h_l180_c7_47d7_iffalse <= VAR_counter_MUX_eth_8_h_l180_c7_47d7_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l180_c7_47d7_return_output := counter_MUX_eth_8_h_l180_c7_47d7_return_output;

     -- counter_MUX[eth_8_h_l161_c5_5fe4] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l161_c5_5fe4_cond <= VAR_counter_MUX_eth_8_h_l161_c5_5fe4_cond;
     counter_MUX_eth_8_h_l161_c5_5fe4_iftrue <= VAR_counter_MUX_eth_8_h_l161_c5_5fe4_iftrue;
     counter_MUX_eth_8_h_l161_c5_5fe4_iffalse <= VAR_counter_MUX_eth_8_h_l161_c5_5fe4_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l161_c5_5fe4_return_output := counter_MUX_eth_8_h_l161_c5_5fe4_return_output;

     -- o_mac_axis_data_tlast_MUX[eth_8_h_l195_c8_3005] LATENCY=0
     -- Inputs
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_cond <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_cond;
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iftrue <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iftrue;
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iffalse <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_return_output := o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_return_output;

     -- header_src_mac_MUX[eth_8_h_l149_c5_f7ae] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l149_c5_f7ae_cond <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_cond;
     header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iftrue;
     header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_return_output := header_src_mac_MUX_eth_8_h_l149_c5_f7ae_return_output;

     -- state_MUX[eth_8_h_l180_c7_47d7] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l180_c7_47d7_cond <= VAR_state_MUX_eth_8_h_l180_c7_47d7_cond;
     state_MUX_eth_8_h_l180_c7_47d7_iftrue <= VAR_state_MUX_eth_8_h_l180_c7_47d7_iftrue;
     state_MUX_eth_8_h_l180_c7_47d7_iffalse <= VAR_state_MUX_eth_8_h_l180_c7_47d7_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l180_c7_47d7_return_output := state_MUX_eth_8_h_l180_c7_47d7_return_output;

     -- state_MUX[eth_8_h_l201_c7_c716] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l201_c7_c716_cond <= VAR_state_MUX_eth_8_h_l201_c7_c716_cond;
     state_MUX_eth_8_h_l201_c7_c716_iftrue <= VAR_state_MUX_eth_8_h_l201_c7_c716_iftrue;
     state_MUX_eth_8_h_l201_c7_c716_iffalse <= VAR_state_MUX_eth_8_h_l201_c7_c716_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l201_c7_c716_return_output := state_MUX_eth_8_h_l201_c7_c716_return_output;

     -- header_ethertype_MUX[eth_8_h_l161_c5_5fe4] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l161_c5_5fe4_cond <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_cond;
     header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iftrue;
     header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_return_output := header_ethertype_MUX_eth_8_h_l161_c5_5fe4_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524[eth_8_h_l172_c8_2225] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_2225_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524(
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_2b08_return_output,
     VAR_MUX_eth_8_h_l176_c29_7852_return_output,
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_688f_return_output,
     VAR_mac_axis_ready);

     -- state_MUX[eth_8_h_l136_c7_6d1b] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l136_c7_6d1b_cond <= VAR_state_MUX_eth_8_h_l136_c7_6d1b_cond;
     state_MUX_eth_8_h_l136_c7_6d1b_iftrue <= VAR_state_MUX_eth_8_h_l136_c7_6d1b_iftrue;
     state_MUX_eth_8_h_l136_c7_6d1b_iffalse <= VAR_state_MUX_eth_8_h_l136_c7_6d1b_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l136_c7_6d1b_return_output := state_MUX_eth_8_h_l136_c7_6d1b_return_output;

     -- Submodule level 3
     VAR_CONST_SL_8_eth_8_h_l137_c26_2750_x := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l137_l136_DUPLICATE_a6e6_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l137_l136_DUPLICATE_a6e6_return_output;
     VAR_counter_MUX_eth_8_h_l130_c5_01d0_iftrue := VAR_counter_MUX_eth_8_h_l136_c7_6d1b_return_output;
     VAR_counter_MUX_eth_8_h_l146_c9_5a3c_iftrue := VAR_counter_MUX_eth_8_h_l149_c5_f7ae_return_output;
     VAR_counter_MUX_eth_8_h_l158_c9_e948_iftrue := VAR_counter_MUX_eth_8_h_l161_c5_5fe4_return_output;
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_715f_left := VAR_counter_MUX_eth_8_h_l180_c7_47d7_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_9feb_iffalse := VAR_counter_MUX_eth_8_h_l180_c7_47d7_return_output;
     VAR_counter_MUX_eth_8_h_l199_c5_09c8_iftrue := VAR_counter_MUX_eth_8_h_l201_c7_c716_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_iftrue := VAR_header_ethertype_MUX_eth_8_h_l161_c5_5fe4_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iftrue := VAR_header_src_mac_MUX_eth_8_h_l149_c5_f7ae_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_5a3c_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_5a3c_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_e948_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_e948_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_2225_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_2225_return_output;
     VAR_state_MUX_eth_8_h_l130_c5_01d0_iftrue := VAR_state_MUX_eth_8_h_l136_c7_6d1b_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_5a3c_iftrue := VAR_state_MUX_eth_8_h_l149_c5_f7ae_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_e948_iftrue := VAR_state_MUX_eth_8_h_l161_c5_5fe4_return_output;
     VAR_state_MUX_eth_8_h_l179_c5_6cd8_iftrue := VAR_state_MUX_eth_8_h_l180_c7_47d7_return_output;
     VAR_state_MUX_eth_8_h_l199_c5_09c8_iftrue := VAR_state_MUX_eth_8_h_l201_c7_c716_return_output;
     -- state_MUX[eth_8_h_l179_c5_6cd8] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l179_c5_6cd8_cond <= VAR_state_MUX_eth_8_h_l179_c5_6cd8_cond;
     state_MUX_eth_8_h_l179_c5_6cd8_iftrue <= VAR_state_MUX_eth_8_h_l179_c5_6cd8_iftrue;
     state_MUX_eth_8_h_l179_c5_6cd8_iffalse <= VAR_state_MUX_eth_8_h_l179_c5_6cd8_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l179_c5_6cd8_return_output := state_MUX_eth_8_h_l179_c5_6cd8_return_output;

     -- state_MUX[eth_8_h_l199_c5_09c8] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l199_c5_09c8_cond <= VAR_state_MUX_eth_8_h_l199_c5_09c8_cond;
     state_MUX_eth_8_h_l199_c5_09c8_iftrue <= VAR_state_MUX_eth_8_h_l199_c5_09c8_iftrue;
     state_MUX_eth_8_h_l199_c5_09c8_iffalse <= VAR_state_MUX_eth_8_h_l199_c5_09c8_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l199_c5_09c8_return_output := state_MUX_eth_8_h_l199_c5_09c8_return_output;

     -- BIN_OP_PLUS[eth_8_h_l190_c9_715f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l190_c9_715f_left <= VAR_BIN_OP_PLUS_eth_8_h_l190_c9_715f_left;
     BIN_OP_PLUS_eth_8_h_l190_c9_715f_right <= VAR_BIN_OP_PLUS_eth_8_h_l190_c9_715f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_715f_return_output := BIN_OP_PLUS_eth_8_h_l190_c9_715f_return_output;

     -- counter_MUX[eth_8_h_l130_c5_01d0] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l130_c5_01d0_cond <= VAR_counter_MUX_eth_8_h_l130_c5_01d0_cond;
     counter_MUX_eth_8_h_l130_c5_01d0_iftrue <= VAR_counter_MUX_eth_8_h_l130_c5_01d0_iftrue;
     counter_MUX_eth_8_h_l130_c5_01d0_iffalse <= VAR_counter_MUX_eth_8_h_l130_c5_01d0_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l130_c5_01d0_return_output := counter_MUX_eth_8_h_l130_c5_01d0_return_output;

     -- o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4[eth_8_h_l172_c8_2225] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4_eth_8_h_l172_c8_2225_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4(
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3005_return_output,
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3005_return_output,
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3005_return_output);

     -- header_ethertype_MUX[eth_8_h_l158_c9_e948] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l158_c9_e948_cond <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_cond;
     header_ethertype_MUX_eth_8_h_l158_c9_e948_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_iftrue;
     header_ethertype_MUX_eth_8_h_l158_c9_e948_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_return_output := header_ethertype_MUX_eth_8_h_l158_c9_e948_return_output;

     -- header_src_mac_MUX[eth_8_h_l146_c9_5a3c] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l146_c9_5a3c_cond <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_cond;
     header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iftrue;
     header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_return_output := header_src_mac_MUX_eth_8_h_l146_c9_5a3c_return_output;

     -- counter_MUX[eth_8_h_l199_c5_09c8] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l199_c5_09c8_cond <= VAR_counter_MUX_eth_8_h_l199_c5_09c8_cond;
     counter_MUX_eth_8_h_l199_c5_09c8_iftrue <= VAR_counter_MUX_eth_8_h_l199_c5_09c8_iftrue;
     counter_MUX_eth_8_h_l199_c5_09c8_iffalse <= VAR_counter_MUX_eth_8_h_l199_c5_09c8_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l199_c5_09c8_return_output := counter_MUX_eth_8_h_l199_c5_09c8_return_output;

     -- CONST_SL_8[eth_8_h_l137_c26_2750] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l137_c26_2750_x <= VAR_CONST_SL_8_eth_8_h_l137_c26_2750_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l137_c26_2750_return_output := CONST_SL_8_eth_8_h_l137_c26_2750_return_output;

     -- uint48_47_40[eth_8_h_l135_c34_ca36] LATENCY=0
     VAR_uint48_47_40_eth_8_h_l135_c34_ca36_return_output := uint48_47_40(
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l137_l136_DUPLICATE_a6e6_return_output);

     -- state_MUX[eth_8_h_l130_c5_01d0] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l130_c5_01d0_cond <= VAR_state_MUX_eth_8_h_l130_c5_01d0_cond;
     state_MUX_eth_8_h_l130_c5_01d0_iftrue <= VAR_state_MUX_eth_8_h_l130_c5_01d0_iftrue;
     state_MUX_eth_8_h_l130_c5_01d0_iffalse <= VAR_state_MUX_eth_8_h_l130_c5_01d0_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l130_c5_01d0_return_output := state_MUX_eth_8_h_l130_c5_01d0_return_output;

     -- Submodule level 4
     VAR_counter_eth_8_h_l190_c9_3473 := resize(VAR_BIN_OP_PLUS_eth_8_h_l190_c9_715f_return_output, 6);
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iftrue := VAR_CONST_SL_8_eth_8_h_l137_c26_2750_return_output;
     VAR_counter_MUX_eth_8_h_l128_c3_9063_iftrue := VAR_counter_MUX_eth_8_h_l130_c5_01d0_return_output;
     VAR_counter_MUX_eth_8_h_l195_c8_3005_iftrue := VAR_counter_MUX_eth_8_h_l199_c5_09c8_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iffalse := VAR_header_ethertype_MUX_eth_8_h_l158_c9_e948_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_2225_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4_eth_8_h_l172_c8_2225_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_9063_iftrue := VAR_state_MUX_eth_8_h_l130_c5_01d0_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_2225_iftrue := VAR_state_MUX_eth_8_h_l179_c5_6cd8_return_output;
     VAR_state_MUX_eth_8_h_l195_c8_3005_iftrue := VAR_state_MUX_eth_8_h_l199_c5_09c8_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_9feb_iftrue := VAR_counter_eth_8_h_l190_c9_3473;
     -- state_MUX[eth_8_h_l195_c8_3005] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l195_c8_3005_cond <= VAR_state_MUX_eth_8_h_l195_c8_3005_cond;
     state_MUX_eth_8_h_l195_c8_3005_iftrue <= VAR_state_MUX_eth_8_h_l195_c8_3005_iftrue;
     state_MUX_eth_8_h_l195_c8_3005_iffalse <= VAR_state_MUX_eth_8_h_l195_c8_3005_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l195_c8_3005_return_output := state_MUX_eth_8_h_l195_c8_3005_return_output;

     -- o_MUX[eth_8_h_l172_c8_2225] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l172_c8_2225_cond <= VAR_o_MUX_eth_8_h_l172_c8_2225_cond;
     o_MUX_eth_8_h_l172_c8_2225_iftrue <= VAR_o_MUX_eth_8_h_l172_c8_2225_iftrue;
     o_MUX_eth_8_h_l172_c8_2225_iffalse <= VAR_o_MUX_eth_8_h_l172_c8_2225_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l172_c8_2225_return_output := o_MUX_eth_8_h_l172_c8_2225_return_output;

     -- counter_MUX[eth_8_h_l195_c8_3005] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l195_c8_3005_cond <= VAR_counter_MUX_eth_8_h_l195_c8_3005_cond;
     counter_MUX_eth_8_h_l195_c8_3005_iftrue <= VAR_counter_MUX_eth_8_h_l195_c8_3005_iftrue;
     counter_MUX_eth_8_h_l195_c8_3005_iffalse <= VAR_counter_MUX_eth_8_h_l195_c8_3005_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l195_c8_3005_return_output := counter_MUX_eth_8_h_l195_c8_3005_return_output;

     -- o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3[eth_8_h_l130_c5_01d0] LATENCY=0
     VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_01d0_return_output := CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3(
     VAR_uint48_47_40_eth_8_h_l135_c34_ca36_return_output);

     -- header_ethertype_MUX[eth_8_h_l146_c9_5a3c] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l146_c9_5a3c_cond <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_cond;
     header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iftrue;
     header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_return_output := header_ethertype_MUX_eth_8_h_l146_c9_5a3c_return_output;

     -- header_dst_mac_MUX[eth_8_h_l136_c7_6d1b] LATENCY=0
     -- Inputs
     header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_cond <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_cond;
     header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iftrue <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iftrue;
     header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iffalse <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_iffalse;
     -- Outputs
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_return_output := header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_return_output;

     -- counter_MUX[eth_8_h_l189_c7_9feb] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l189_c7_9feb_cond <= VAR_counter_MUX_eth_8_h_l189_c7_9feb_cond;
     counter_MUX_eth_8_h_l189_c7_9feb_iftrue <= VAR_counter_MUX_eth_8_h_l189_c7_9feb_iftrue;
     counter_MUX_eth_8_h_l189_c7_9feb_iffalse <= VAR_counter_MUX_eth_8_h_l189_c7_9feb_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l189_c7_9feb_return_output := counter_MUX_eth_8_h_l189_c7_9feb_return_output;

     -- Submodule level 5
     VAR_counter_MUX_eth_8_h_l179_c5_6cd8_iftrue := VAR_counter_MUX_eth_8_h_l189_c7_9feb_return_output;
     VAR_counter_MUX_eth_8_h_l172_c8_2225_iffalse := VAR_counter_MUX_eth_8_h_l195_c8_3005_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_e948_iffalse := VAR_o_MUX_eth_8_h_l172_c8_2225_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iftrue := VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_01d0_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_2225_iffalse := VAR_state_MUX_eth_8_h_l195_c8_3005_return_output;
     -- o_MUX[eth_8_h_l158_c9_e948] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l158_c9_e948_cond <= VAR_o_MUX_eth_8_h_l158_c9_e948_cond;
     o_MUX_eth_8_h_l158_c9_e948_iftrue <= VAR_o_MUX_eth_8_h_l158_c9_e948_iftrue;
     o_MUX_eth_8_h_l158_c9_e948_iffalse <= VAR_o_MUX_eth_8_h_l158_c9_e948_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l158_c9_e948_return_output := o_MUX_eth_8_h_l158_c9_e948_return_output;

     -- counter_MUX[eth_8_h_l179_c5_6cd8] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l179_c5_6cd8_cond <= VAR_counter_MUX_eth_8_h_l179_c5_6cd8_cond;
     counter_MUX_eth_8_h_l179_c5_6cd8_iftrue <= VAR_counter_MUX_eth_8_h_l179_c5_6cd8_iftrue;
     counter_MUX_eth_8_h_l179_c5_6cd8_iffalse <= VAR_counter_MUX_eth_8_h_l179_c5_6cd8_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l179_c5_6cd8_return_output := counter_MUX_eth_8_h_l179_c5_6cd8_return_output;

     -- header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a[eth_8_h_l128_c3_9063] LATENCY=0
     VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l128_c3_9063_return_output := CONST_REF_RD_eth_header_t_eth_header_t_325a(
     header,
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_5a3c_return_output,
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_5a3c_return_output);

     -- o_mac_axis_data_tdata_MUX[eth_8_h_l130_c5_01d0] LATENCY=0
     -- Inputs
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_cond <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_cond;
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iftrue <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iftrue;
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iffalse <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_return_output := o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_return_output;

     -- header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484[eth_8_h_l130_c5_01d0] LATENCY=0
     VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_01d0_return_output := CONST_REF_RD_eth_header_t_eth_header_t_e484(
     VAR_header_MUX_eth_8_h_l131_c7_5aaa_return_output,
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_6d1b_return_output);

     -- state_MUX[eth_8_h_l172_c8_2225] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l172_c8_2225_cond <= VAR_state_MUX_eth_8_h_l172_c8_2225_cond;
     state_MUX_eth_8_h_l172_c8_2225_iftrue <= VAR_state_MUX_eth_8_h_l172_c8_2225_iftrue;
     state_MUX_eth_8_h_l172_c8_2225_iffalse <= VAR_state_MUX_eth_8_h_l172_c8_2225_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l172_c8_2225_return_output := state_MUX_eth_8_h_l172_c8_2225_return_output;

     -- Submodule level 6
     VAR_counter_MUX_eth_8_h_l172_c8_2225_iftrue := VAR_counter_MUX_eth_8_h_l179_c5_6cd8_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_9063_iffalse := VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l128_c3_9063_return_output;
     VAR_header_MUX_eth_8_h_l130_c5_01d0_iftrue := VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_01d0_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_5a3c_iffalse := VAR_o_MUX_eth_8_h_l158_c9_e948_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_e948_iffalse := VAR_state_MUX_eth_8_h_l172_c8_2225_return_output;
     -- counter_MUX[eth_8_h_l172_c8_2225] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l172_c8_2225_cond <= VAR_counter_MUX_eth_8_h_l172_c8_2225_cond;
     counter_MUX_eth_8_h_l172_c8_2225_iftrue <= VAR_counter_MUX_eth_8_h_l172_c8_2225_iftrue;
     counter_MUX_eth_8_h_l172_c8_2225_iffalse <= VAR_counter_MUX_eth_8_h_l172_c8_2225_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l172_c8_2225_return_output := counter_MUX_eth_8_h_l172_c8_2225_return_output;

     -- state_MUX[eth_8_h_l158_c9_e948] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l158_c9_e948_cond <= VAR_state_MUX_eth_8_h_l158_c9_e948_cond;
     state_MUX_eth_8_h_l158_c9_e948_iftrue <= VAR_state_MUX_eth_8_h_l158_c9_e948_iftrue;
     state_MUX_eth_8_h_l158_c9_e948_iffalse <= VAR_state_MUX_eth_8_h_l158_c9_e948_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l158_c9_e948_return_output := state_MUX_eth_8_h_l158_c9_e948_return_output;

     -- header_MUX[eth_8_h_l130_c5_01d0] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l130_c5_01d0_cond <= VAR_header_MUX_eth_8_h_l130_c5_01d0_cond;
     header_MUX_eth_8_h_l130_c5_01d0_iftrue <= VAR_header_MUX_eth_8_h_l130_c5_01d0_iftrue;
     header_MUX_eth_8_h_l130_c5_01d0_iffalse <= VAR_header_MUX_eth_8_h_l130_c5_01d0_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l130_c5_01d0_return_output := header_MUX_eth_8_h_l130_c5_01d0_return_output;

     -- o_MUX[eth_8_h_l146_c9_5a3c] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l146_c9_5a3c_cond <= VAR_o_MUX_eth_8_h_l146_c9_5a3c_cond;
     o_MUX_eth_8_h_l146_c9_5a3c_iftrue <= VAR_o_MUX_eth_8_h_l146_c9_5a3c_iftrue;
     o_MUX_eth_8_h_l146_c9_5a3c_iffalse <= VAR_o_MUX_eth_8_h_l146_c9_5a3c_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l146_c9_5a3c_return_output := o_MUX_eth_8_h_l146_c9_5a3c_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856[eth_8_h_l128_c3_9063] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_9063_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_01d0_return_output,
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_01d0_return_output);

     -- Submodule level 7
     VAR_counter_MUX_eth_8_h_l158_c9_e948_iffalse := VAR_counter_MUX_eth_8_h_l172_c8_2225_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_9063_iftrue := VAR_header_MUX_eth_8_h_l130_c5_01d0_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_9063_iffalse := VAR_o_MUX_eth_8_h_l146_c9_5a3c_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_9063_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_9063_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_5a3c_iffalse := VAR_state_MUX_eth_8_h_l158_c9_e948_return_output;
     -- counter_MUX[eth_8_h_l158_c9_e948] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l158_c9_e948_cond <= VAR_counter_MUX_eth_8_h_l158_c9_e948_cond;
     counter_MUX_eth_8_h_l158_c9_e948_iftrue <= VAR_counter_MUX_eth_8_h_l158_c9_e948_iftrue;
     counter_MUX_eth_8_h_l158_c9_e948_iffalse <= VAR_counter_MUX_eth_8_h_l158_c9_e948_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l158_c9_e948_return_output := counter_MUX_eth_8_h_l158_c9_e948_return_output;

     -- o_MUX[eth_8_h_l128_c3_9063] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l128_c3_9063_cond <= VAR_o_MUX_eth_8_h_l128_c3_9063_cond;
     o_MUX_eth_8_h_l128_c3_9063_iftrue <= VAR_o_MUX_eth_8_h_l128_c3_9063_iftrue;
     o_MUX_eth_8_h_l128_c3_9063_iffalse <= VAR_o_MUX_eth_8_h_l128_c3_9063_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l128_c3_9063_return_output := o_MUX_eth_8_h_l128_c3_9063_return_output;

     -- state_MUX[eth_8_h_l146_c9_5a3c] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l146_c9_5a3c_cond <= VAR_state_MUX_eth_8_h_l146_c9_5a3c_cond;
     state_MUX_eth_8_h_l146_c9_5a3c_iftrue <= VAR_state_MUX_eth_8_h_l146_c9_5a3c_iftrue;
     state_MUX_eth_8_h_l146_c9_5a3c_iffalse <= VAR_state_MUX_eth_8_h_l146_c9_5a3c_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l146_c9_5a3c_return_output := state_MUX_eth_8_h_l146_c9_5a3c_return_output;

     -- header_MUX[eth_8_h_l128_c3_9063] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l128_c3_9063_cond <= VAR_header_MUX_eth_8_h_l128_c3_9063_cond;
     header_MUX_eth_8_h_l128_c3_9063_iftrue <= VAR_header_MUX_eth_8_h_l128_c3_9063_iftrue;
     header_MUX_eth_8_h_l128_c3_9063_iffalse <= VAR_header_MUX_eth_8_h_l128_c3_9063_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l128_c3_9063_return_output := header_MUX_eth_8_h_l128_c3_9063_return_output;

     -- Submodule level 8
     VAR_counter_MUX_eth_8_h_l146_c9_5a3c_iffalse := VAR_counter_MUX_eth_8_h_l158_c9_e948_return_output;
     REG_VAR_header := VAR_header_MUX_eth_8_h_l128_c3_9063_return_output;
     VAR_return_output := VAR_o_MUX_eth_8_h_l128_c3_9063_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_9063_iffalse := VAR_state_MUX_eth_8_h_l146_c9_5a3c_return_output;
     -- state_MUX[eth_8_h_l128_c3_9063] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l128_c3_9063_cond <= VAR_state_MUX_eth_8_h_l128_c3_9063_cond;
     state_MUX_eth_8_h_l128_c3_9063_iftrue <= VAR_state_MUX_eth_8_h_l128_c3_9063_iftrue;
     state_MUX_eth_8_h_l128_c3_9063_iffalse <= VAR_state_MUX_eth_8_h_l128_c3_9063_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l128_c3_9063_return_output := state_MUX_eth_8_h_l128_c3_9063_return_output;

     -- counter_MUX[eth_8_h_l146_c9_5a3c] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l146_c9_5a3c_cond <= VAR_counter_MUX_eth_8_h_l146_c9_5a3c_cond;
     counter_MUX_eth_8_h_l146_c9_5a3c_iftrue <= VAR_counter_MUX_eth_8_h_l146_c9_5a3c_iftrue;
     counter_MUX_eth_8_h_l146_c9_5a3c_iffalse <= VAR_counter_MUX_eth_8_h_l146_c9_5a3c_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l146_c9_5a3c_return_output := counter_MUX_eth_8_h_l146_c9_5a3c_return_output;

     -- Submodule level 9
     VAR_counter_MUX_eth_8_h_l128_c3_9063_iffalse := VAR_counter_MUX_eth_8_h_l146_c9_5a3c_return_output;
     REG_VAR_state := VAR_state_MUX_eth_8_h_l128_c3_9063_return_output;
     -- counter_MUX[eth_8_h_l128_c3_9063] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l128_c3_9063_cond <= VAR_counter_MUX_eth_8_h_l128_c3_9063_cond;
     counter_MUX_eth_8_h_l128_c3_9063_iftrue <= VAR_counter_MUX_eth_8_h_l128_c3_9063_iftrue;
     counter_MUX_eth_8_h_l128_c3_9063_iffalse <= VAR_counter_MUX_eth_8_h_l128_c3_9063_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l128_c3_9063_return_output := counter_MUX_eth_8_h_l128_c3_9063_return_output;

     -- Submodule level 10
     REG_VAR_counter := VAR_counter_MUX_eth_8_h_l128_c3_9063_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_state <= REG_VAR_state;
REG_COMB_header <= REG_VAR_header;
REG_COMB_counter <= REG_VAR_counter;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     state <= REG_COMB_state;
     header <= REG_COMB_header;
     counter <= REG_COMB_counter;
 end if;
 end if;
end process;

end arch;
