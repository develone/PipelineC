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
-- Submodules: 69
entity eth_8_rx_0CLK_5110df32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 mac_axis : in axis8_t_stream_t;
 frame_ready : in unsigned(0 downto 0);
 return_output : out eth_8_rx_t);
end eth_8_rx_0CLK_5110df32;
architecture arch of eth_8_rx_0CLK_5110df32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal state : unsigned(2 downto 0) := unsigned(eth8_state_t_to_slv(eth8_state_t'left));
signal header : eth_header_t := eth_header_t_NULL;
signal counter : unsigned(2 downto 0) := to_unsigned(0, 3);
signal REG_COMB_state : unsigned(2 downto 0);
signal REG_COMB_header : eth_header_t;
signal REG_COMB_counter : unsigned(2 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_EQ[eth_8_h_l51_c6_f1bd]
signal BIN_OP_EQ_eth_8_h_l51_c6_f1bd_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l51_c6_f1bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l51_c3_407e]
signal header_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l51_c3_407e_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l51_c3_407e_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l51_c3_407e_return_output : eth_header_t;

-- o_frame_data_payload_MUX[eth_8_h_l51_c3_407e]
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l51_c3_407e]
signal o_overflow_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l51_c3_407e]
signal o_frame_valid_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l51_c3_407e]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l51_c3_407e]
signal state_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l51_c3_407e]
signal counter_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(2 downto 0);

-- header_dst_mac_MUX[eth_8_h_l52_c5_4ece]
signal header_dst_mac_MUX_eth_8_h_l52_c5_4ece_cond : unsigned(0 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iftrue : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iffalse : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_4ece_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l52_c5_4ece]
signal state_MUX_eth_8_h_l52_c5_4ece_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l52_c5_4ece_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l52_c5_4ece_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l52_c5_4ece_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l52_c5_4ece]
signal counter_MUX_eth_8_h_l52_c5_4ece_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l52_c5_4ece_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l52_c5_4ece_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l52_c5_4ece_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l54_c10_80ea]
signal BIN_OP_EQ_eth_8_h_l54_c10_80ea_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l54_c10_80ea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l54_c10_80ea_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l54_c7_a8d9]
signal state_MUX_eth_8_h_l54_c7_a8d9_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l54_c7_a8d9_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l54_c7_a8d9_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l54_c7_a8d9_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l54_c7_a8d9]
signal counter_MUX_eth_8_h_l54_c7_a8d9_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l54_c7_a8d9_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l54_c7_a8d9_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l54_c7_a8d9_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l58_c9_41ef]
signal BIN_OP_PLUS_eth_8_h_l58_c9_41ef_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l58_c9_41ef_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l58_c9_41ef_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l61_c12_9566]
signal BIN_OP_EQ_eth_8_h_l61_c12_9566_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l61_c12_9566_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l61_c9_451f]
signal header_ethertype_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(15 downto 0);

-- header_src_mac_MUX[eth_8_h_l61_c9_451f]
signal header_src_mac_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(47 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l61_c9_451f]
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l61_c9_451f]
signal o_overflow_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l61_c9_451f]
signal o_frame_valid_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l61_c9_451f]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l61_c9_451f]
signal state_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l61_c9_451f]
signal counter_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(2 downto 0);

-- header_src_mac_MUX[eth_8_h_l62_c5_e538]
signal header_src_mac_MUX_eth_8_h_l62_c5_e538_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_e538_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_e538_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_e538_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l62_c5_e538]
signal state_MUX_eth_8_h_l62_c5_e538_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l62_c5_e538_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l62_c5_e538_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l62_c5_e538_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l62_c5_e538]
signal counter_MUX_eth_8_h_l62_c5_e538_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l62_c5_e538_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l62_c5_e538_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l62_c5_e538_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l64_c10_9275]
signal BIN_OP_EQ_eth_8_h_l64_c10_9275_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l64_c10_9275_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l64_c10_9275_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l64_c7_5d9a]
signal state_MUX_eth_8_h_l64_c7_5d9a_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l64_c7_5d9a_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l64_c7_5d9a_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l64_c7_5d9a_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l64_c7_5d9a]
signal counter_MUX_eth_8_h_l64_c7_5d9a_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l64_c7_5d9a_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l64_c7_5d9a_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l64_c7_5d9a_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l68_c9_b707]
signal BIN_OP_PLUS_eth_8_h_l68_c9_b707_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l68_c9_b707_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l68_c9_b707_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l71_c12_65f9]
signal BIN_OP_EQ_eth_8_h_l71_c12_65f9_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l71_c12_65f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l71_c9_d565]
signal header_ethertype_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(15 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l71_c9_d565]
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l71_c9_d565]
signal o_overflow_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l71_c9_d565]
signal o_frame_valid_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l71_c9_d565]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l71_c9_d565]
signal state_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l71_c9_d565]
signal counter_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(2 downto 0);

-- header_ethertype_MUX[eth_8_h_l72_c5_474a]
signal header_ethertype_MUX_eth_8_h_l72_c5_474a_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_474a_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_474a_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_474a_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l72_c5_474a]
signal state_MUX_eth_8_h_l72_c5_474a_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l72_c5_474a_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l72_c5_474a_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l72_c5_474a_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l72_c5_474a]
signal counter_MUX_eth_8_h_l72_c5_474a_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l72_c5_474a_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l72_c5_474a_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l72_c5_474a_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l74_c10_8715]
signal BIN_OP_EQ_eth_8_h_l74_c10_8715_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l74_c10_8715_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l74_c10_8715_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l74_c7_9dd4]
signal state_MUX_eth_8_h_l74_c7_9dd4_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l74_c7_9dd4_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l74_c7_9dd4_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l74_c7_9dd4_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l74_c7_9dd4]
signal counter_MUX_eth_8_h_l74_c7_9dd4_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l74_c7_9dd4_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l74_c7_9dd4_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l74_c7_9dd4_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l78_c9_1416]
signal BIN_OP_PLUS_eth_8_h_l78_c9_1416_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l78_c9_1416_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l78_c9_1416_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l83_c11_2206]
signal BIN_OP_EQ_eth_8_h_l83_c11_2206_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l83_c11_2206_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output : unsigned(0 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l83_c8_1c74]
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l83_c8_1c74]
signal o_overflow_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l83_c8_1c74]
signal o_frame_valid_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l83_c8_1c74]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l83_c8_1c74]
signal state_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l83_c8_1c74]
signal counter_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l86_c37_155b]
signal BIN_OP_EQ_eth_8_h_l86_c37_155b_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l86_c37_155b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l86_c37_155b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[eth_8_h_l89_c35_3af7]
signal UNARY_OP_NOT_eth_8_h_l89_c35_3af7_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_eth_8_h_l89_c35_3af7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l89_c18_2663]
signal BIN_OP_AND_eth_8_h_l89_c18_2663_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l89_c18_2663_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l89_c18_2663_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l90_c5_7065]
signal state_MUX_eth_8_h_l90_c5_7065_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l90_c5_7065_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l90_c5_7065_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l90_c5_7065_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l90_c5_7065]
signal counter_MUX_eth_8_h_l90_c5_7065_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l90_c5_7065_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l90_c5_7065_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l90_c5_7065_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l91_c7_fe89]
signal counter_MUX_eth_8_h_l91_c7_fe89_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l91_c7_fe89_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l91_c7_fe89_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l91_c7_fe89_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l92_c9_43f6]
signal BIN_OP_PLUS_eth_8_h_l92_c9_43f6_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l92_c9_43f6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l92_c9_43f6_return_output : unsigned(3 downto 0);

-- state_MUX[eth_8_h_l94_c7_99dd]
signal state_MUX_eth_8_h_l94_c7_99dd_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l94_c7_99dd_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l94_c7_99dd_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l94_c7_99dd_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l94_c7_99dd]
signal counter_MUX_eth_8_h_l94_c7_99dd_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l94_c7_99dd_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l94_c7_99dd_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l94_c7_99dd_return_output : unsigned(2 downto 0);

function uint40_uint8( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(39 downto 0);
  --variable y : unsigned(7 downto 0);
  variable return_output : unsigned(47 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
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

function uint8_uint8( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(7 downto 0);
  --variable y : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7( ref_toks_0 : axis8_t) return unsigned is
 
  variable base : eth_8_rx_t; 
  variable return_output : unsigned(0 downto 0);
begin
      base.frame.data.payload := ref_toks_0;

      return_output := base.frame.data.payload.tlast;
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

function CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622( ref_toks_0 : eth_header_t;
 ref_toks_1 : axis8_t;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return eth_8_rx_t is
 
  variable base : eth_8_rx_t; 
  variable return_output : eth_8_rx_t;
begin
      base.frame.data.header := ref_toks_0;
      base.frame.data.payload := ref_toks_1;
      base.overflow := ref_toks_2;
      base.frame.valid := ref_toks_3;
      base.frame.data.start_of_payload := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_eth_8_h_l51_c6_f1bd : 0 clocks latency
BIN_OP_EQ_eth_8_h_l51_c6_f1bd : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l51_c6_f1bd_left,
BIN_OP_EQ_eth_8_h_l51_c6_f1bd_right,
BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output);

-- header_MUX_eth_8_h_l51_c3_407e : 0 clocks latency
header_MUX_eth_8_h_l51_c3_407e : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l51_c3_407e_cond,
header_MUX_eth_8_h_l51_c3_407e_iftrue,
header_MUX_eth_8_h_l51_c3_407e_iffalse,
header_MUX_eth_8_h_l51_c3_407e_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l51_c3_407e : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l51_c3_407e : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_cond,
o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iftrue,
o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iffalse,
o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_return_output);

-- o_overflow_MUX_eth_8_h_l51_c3_407e : 0 clocks latency
o_overflow_MUX_eth_8_h_l51_c3_407e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l51_c3_407e_cond,
o_overflow_MUX_eth_8_h_l51_c3_407e_iftrue,
o_overflow_MUX_eth_8_h_l51_c3_407e_iffalse,
o_overflow_MUX_eth_8_h_l51_c3_407e_return_output);

-- o_frame_valid_MUX_eth_8_h_l51_c3_407e : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l51_c3_407e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l51_c3_407e_cond,
o_frame_valid_MUX_eth_8_h_l51_c3_407e_iftrue,
o_frame_valid_MUX_eth_8_h_l51_c3_407e_iffalse,
o_frame_valid_MUX_eth_8_h_l51_c3_407e_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_return_output);

-- state_MUX_eth_8_h_l51_c3_407e : 0 clocks latency
state_MUX_eth_8_h_l51_c3_407e : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l51_c3_407e_cond,
state_MUX_eth_8_h_l51_c3_407e_iftrue,
state_MUX_eth_8_h_l51_c3_407e_iffalse,
state_MUX_eth_8_h_l51_c3_407e_return_output);

-- counter_MUX_eth_8_h_l51_c3_407e : 0 clocks latency
counter_MUX_eth_8_h_l51_c3_407e : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l51_c3_407e_cond,
counter_MUX_eth_8_h_l51_c3_407e_iftrue,
counter_MUX_eth_8_h_l51_c3_407e_iffalse,
counter_MUX_eth_8_h_l51_c3_407e_return_output);

-- header_dst_mac_MUX_eth_8_h_l52_c5_4ece : 0 clocks latency
header_dst_mac_MUX_eth_8_h_l52_c5_4ece : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_dst_mac_MUX_eth_8_h_l52_c5_4ece_cond,
header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iftrue,
header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iffalse,
header_dst_mac_MUX_eth_8_h_l52_c5_4ece_return_output);

-- state_MUX_eth_8_h_l52_c5_4ece : 0 clocks latency
state_MUX_eth_8_h_l52_c5_4ece : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l52_c5_4ece_cond,
state_MUX_eth_8_h_l52_c5_4ece_iftrue,
state_MUX_eth_8_h_l52_c5_4ece_iffalse,
state_MUX_eth_8_h_l52_c5_4ece_return_output);

-- counter_MUX_eth_8_h_l52_c5_4ece : 0 clocks latency
counter_MUX_eth_8_h_l52_c5_4ece : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l52_c5_4ece_cond,
counter_MUX_eth_8_h_l52_c5_4ece_iftrue,
counter_MUX_eth_8_h_l52_c5_4ece_iffalse,
counter_MUX_eth_8_h_l52_c5_4ece_return_output);

-- BIN_OP_EQ_eth_8_h_l54_c10_80ea : 0 clocks latency
BIN_OP_EQ_eth_8_h_l54_c10_80ea : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l54_c10_80ea_left,
BIN_OP_EQ_eth_8_h_l54_c10_80ea_right,
BIN_OP_EQ_eth_8_h_l54_c10_80ea_return_output);

-- state_MUX_eth_8_h_l54_c7_a8d9 : 0 clocks latency
state_MUX_eth_8_h_l54_c7_a8d9 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l54_c7_a8d9_cond,
state_MUX_eth_8_h_l54_c7_a8d9_iftrue,
state_MUX_eth_8_h_l54_c7_a8d9_iffalse,
state_MUX_eth_8_h_l54_c7_a8d9_return_output);

-- counter_MUX_eth_8_h_l54_c7_a8d9 : 0 clocks latency
counter_MUX_eth_8_h_l54_c7_a8d9 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l54_c7_a8d9_cond,
counter_MUX_eth_8_h_l54_c7_a8d9_iftrue,
counter_MUX_eth_8_h_l54_c7_a8d9_iffalse,
counter_MUX_eth_8_h_l54_c7_a8d9_return_output);

-- BIN_OP_PLUS_eth_8_h_l58_c9_41ef : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l58_c9_41ef : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l58_c9_41ef_left,
BIN_OP_PLUS_eth_8_h_l58_c9_41ef_right,
BIN_OP_PLUS_eth_8_h_l58_c9_41ef_return_output);

-- BIN_OP_EQ_eth_8_h_l61_c12_9566 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l61_c12_9566 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l61_c12_9566_left,
BIN_OP_EQ_eth_8_h_l61_c12_9566_right,
BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output);

-- header_ethertype_MUX_eth_8_h_l61_c9_451f : 0 clocks latency
header_ethertype_MUX_eth_8_h_l61_c9_451f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l61_c9_451f_cond,
header_ethertype_MUX_eth_8_h_l61_c9_451f_iftrue,
header_ethertype_MUX_eth_8_h_l61_c9_451f_iffalse,
header_ethertype_MUX_eth_8_h_l61_c9_451f_return_output);

-- header_src_mac_MUX_eth_8_h_l61_c9_451f : 0 clocks latency
header_src_mac_MUX_eth_8_h_l61_c9_451f : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l61_c9_451f_cond,
header_src_mac_MUX_eth_8_h_l61_c9_451f_iftrue,
header_src_mac_MUX_eth_8_h_l61_c9_451f_iffalse,
header_src_mac_MUX_eth_8_h_l61_c9_451f_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l61_c9_451f : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l61_c9_451f : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_cond,
o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iftrue,
o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iffalse,
o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_return_output);

-- o_overflow_MUX_eth_8_h_l61_c9_451f : 0 clocks latency
o_overflow_MUX_eth_8_h_l61_c9_451f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l61_c9_451f_cond,
o_overflow_MUX_eth_8_h_l61_c9_451f_iftrue,
o_overflow_MUX_eth_8_h_l61_c9_451f_iffalse,
o_overflow_MUX_eth_8_h_l61_c9_451f_return_output);

-- o_frame_valid_MUX_eth_8_h_l61_c9_451f : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l61_c9_451f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l61_c9_451f_cond,
o_frame_valid_MUX_eth_8_h_l61_c9_451f_iftrue,
o_frame_valid_MUX_eth_8_h_l61_c9_451f_iffalse,
o_frame_valid_MUX_eth_8_h_l61_c9_451f_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_return_output);

-- state_MUX_eth_8_h_l61_c9_451f : 0 clocks latency
state_MUX_eth_8_h_l61_c9_451f : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l61_c9_451f_cond,
state_MUX_eth_8_h_l61_c9_451f_iftrue,
state_MUX_eth_8_h_l61_c9_451f_iffalse,
state_MUX_eth_8_h_l61_c9_451f_return_output);

-- counter_MUX_eth_8_h_l61_c9_451f : 0 clocks latency
counter_MUX_eth_8_h_l61_c9_451f : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l61_c9_451f_cond,
counter_MUX_eth_8_h_l61_c9_451f_iftrue,
counter_MUX_eth_8_h_l61_c9_451f_iffalse,
counter_MUX_eth_8_h_l61_c9_451f_return_output);

-- header_src_mac_MUX_eth_8_h_l62_c5_e538 : 0 clocks latency
header_src_mac_MUX_eth_8_h_l62_c5_e538 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l62_c5_e538_cond,
header_src_mac_MUX_eth_8_h_l62_c5_e538_iftrue,
header_src_mac_MUX_eth_8_h_l62_c5_e538_iffalse,
header_src_mac_MUX_eth_8_h_l62_c5_e538_return_output);

-- state_MUX_eth_8_h_l62_c5_e538 : 0 clocks latency
state_MUX_eth_8_h_l62_c5_e538 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l62_c5_e538_cond,
state_MUX_eth_8_h_l62_c5_e538_iftrue,
state_MUX_eth_8_h_l62_c5_e538_iffalse,
state_MUX_eth_8_h_l62_c5_e538_return_output);

-- counter_MUX_eth_8_h_l62_c5_e538 : 0 clocks latency
counter_MUX_eth_8_h_l62_c5_e538 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l62_c5_e538_cond,
counter_MUX_eth_8_h_l62_c5_e538_iftrue,
counter_MUX_eth_8_h_l62_c5_e538_iffalse,
counter_MUX_eth_8_h_l62_c5_e538_return_output);

-- BIN_OP_EQ_eth_8_h_l64_c10_9275 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l64_c10_9275 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l64_c10_9275_left,
BIN_OP_EQ_eth_8_h_l64_c10_9275_right,
BIN_OP_EQ_eth_8_h_l64_c10_9275_return_output);

-- state_MUX_eth_8_h_l64_c7_5d9a : 0 clocks latency
state_MUX_eth_8_h_l64_c7_5d9a : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l64_c7_5d9a_cond,
state_MUX_eth_8_h_l64_c7_5d9a_iftrue,
state_MUX_eth_8_h_l64_c7_5d9a_iffalse,
state_MUX_eth_8_h_l64_c7_5d9a_return_output);

-- counter_MUX_eth_8_h_l64_c7_5d9a : 0 clocks latency
counter_MUX_eth_8_h_l64_c7_5d9a : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l64_c7_5d9a_cond,
counter_MUX_eth_8_h_l64_c7_5d9a_iftrue,
counter_MUX_eth_8_h_l64_c7_5d9a_iffalse,
counter_MUX_eth_8_h_l64_c7_5d9a_return_output);

-- BIN_OP_PLUS_eth_8_h_l68_c9_b707 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l68_c9_b707 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l68_c9_b707_left,
BIN_OP_PLUS_eth_8_h_l68_c9_b707_right,
BIN_OP_PLUS_eth_8_h_l68_c9_b707_return_output);

-- BIN_OP_EQ_eth_8_h_l71_c12_65f9 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l71_c12_65f9 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l71_c12_65f9_left,
BIN_OP_EQ_eth_8_h_l71_c12_65f9_right,
BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output);

-- header_ethertype_MUX_eth_8_h_l71_c9_d565 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l71_c9_d565 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l71_c9_d565_cond,
header_ethertype_MUX_eth_8_h_l71_c9_d565_iftrue,
header_ethertype_MUX_eth_8_h_l71_c9_d565_iffalse,
header_ethertype_MUX_eth_8_h_l71_c9_d565_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l71_c9_d565 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l71_c9_d565 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_cond,
o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iftrue,
o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iffalse,
o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_return_output);

-- o_overflow_MUX_eth_8_h_l71_c9_d565 : 0 clocks latency
o_overflow_MUX_eth_8_h_l71_c9_d565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l71_c9_d565_cond,
o_overflow_MUX_eth_8_h_l71_c9_d565_iftrue,
o_overflow_MUX_eth_8_h_l71_c9_d565_iffalse,
o_overflow_MUX_eth_8_h_l71_c9_d565_return_output);

-- o_frame_valid_MUX_eth_8_h_l71_c9_d565 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l71_c9_d565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l71_c9_d565_cond,
o_frame_valid_MUX_eth_8_h_l71_c9_d565_iftrue,
o_frame_valid_MUX_eth_8_h_l71_c9_d565_iffalse,
o_frame_valid_MUX_eth_8_h_l71_c9_d565_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_return_output);

-- state_MUX_eth_8_h_l71_c9_d565 : 0 clocks latency
state_MUX_eth_8_h_l71_c9_d565 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l71_c9_d565_cond,
state_MUX_eth_8_h_l71_c9_d565_iftrue,
state_MUX_eth_8_h_l71_c9_d565_iffalse,
state_MUX_eth_8_h_l71_c9_d565_return_output);

-- counter_MUX_eth_8_h_l71_c9_d565 : 0 clocks latency
counter_MUX_eth_8_h_l71_c9_d565 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l71_c9_d565_cond,
counter_MUX_eth_8_h_l71_c9_d565_iftrue,
counter_MUX_eth_8_h_l71_c9_d565_iffalse,
counter_MUX_eth_8_h_l71_c9_d565_return_output);

-- header_ethertype_MUX_eth_8_h_l72_c5_474a : 0 clocks latency
header_ethertype_MUX_eth_8_h_l72_c5_474a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l72_c5_474a_cond,
header_ethertype_MUX_eth_8_h_l72_c5_474a_iftrue,
header_ethertype_MUX_eth_8_h_l72_c5_474a_iffalse,
header_ethertype_MUX_eth_8_h_l72_c5_474a_return_output);

-- state_MUX_eth_8_h_l72_c5_474a : 0 clocks latency
state_MUX_eth_8_h_l72_c5_474a : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l72_c5_474a_cond,
state_MUX_eth_8_h_l72_c5_474a_iftrue,
state_MUX_eth_8_h_l72_c5_474a_iffalse,
state_MUX_eth_8_h_l72_c5_474a_return_output);

-- counter_MUX_eth_8_h_l72_c5_474a : 0 clocks latency
counter_MUX_eth_8_h_l72_c5_474a : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l72_c5_474a_cond,
counter_MUX_eth_8_h_l72_c5_474a_iftrue,
counter_MUX_eth_8_h_l72_c5_474a_iffalse,
counter_MUX_eth_8_h_l72_c5_474a_return_output);

-- BIN_OP_EQ_eth_8_h_l74_c10_8715 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l74_c10_8715 : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l74_c10_8715_left,
BIN_OP_EQ_eth_8_h_l74_c10_8715_right,
BIN_OP_EQ_eth_8_h_l74_c10_8715_return_output);

-- state_MUX_eth_8_h_l74_c7_9dd4 : 0 clocks latency
state_MUX_eth_8_h_l74_c7_9dd4 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l74_c7_9dd4_cond,
state_MUX_eth_8_h_l74_c7_9dd4_iftrue,
state_MUX_eth_8_h_l74_c7_9dd4_iffalse,
state_MUX_eth_8_h_l74_c7_9dd4_return_output);

-- counter_MUX_eth_8_h_l74_c7_9dd4 : 0 clocks latency
counter_MUX_eth_8_h_l74_c7_9dd4 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l74_c7_9dd4_cond,
counter_MUX_eth_8_h_l74_c7_9dd4_iftrue,
counter_MUX_eth_8_h_l74_c7_9dd4_iffalse,
counter_MUX_eth_8_h_l74_c7_9dd4_return_output);

-- BIN_OP_PLUS_eth_8_h_l78_c9_1416 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l78_c9_1416 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l78_c9_1416_left,
BIN_OP_PLUS_eth_8_h_l78_c9_1416_right,
BIN_OP_PLUS_eth_8_h_l78_c9_1416_return_output);

-- BIN_OP_EQ_eth_8_h_l83_c11_2206 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l83_c11_2206 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l83_c11_2206_left,
BIN_OP_EQ_eth_8_h_l83_c11_2206_right,
BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_cond,
o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iftrue,
o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iffalse,
o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_return_output);

-- o_overflow_MUX_eth_8_h_l83_c8_1c74 : 0 clocks latency
o_overflow_MUX_eth_8_h_l83_c8_1c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l83_c8_1c74_cond,
o_overflow_MUX_eth_8_h_l83_c8_1c74_iftrue,
o_overflow_MUX_eth_8_h_l83_c8_1c74_iffalse,
o_overflow_MUX_eth_8_h_l83_c8_1c74_return_output);

-- o_frame_valid_MUX_eth_8_h_l83_c8_1c74 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l83_c8_1c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l83_c8_1c74_cond,
o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iftrue,
o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iffalse,
o_frame_valid_MUX_eth_8_h_l83_c8_1c74_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_return_output);

-- state_MUX_eth_8_h_l83_c8_1c74 : 0 clocks latency
state_MUX_eth_8_h_l83_c8_1c74 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l83_c8_1c74_cond,
state_MUX_eth_8_h_l83_c8_1c74_iftrue,
state_MUX_eth_8_h_l83_c8_1c74_iffalse,
state_MUX_eth_8_h_l83_c8_1c74_return_output);

-- counter_MUX_eth_8_h_l83_c8_1c74 : 0 clocks latency
counter_MUX_eth_8_h_l83_c8_1c74 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l83_c8_1c74_cond,
counter_MUX_eth_8_h_l83_c8_1c74_iftrue,
counter_MUX_eth_8_h_l83_c8_1c74_iffalse,
counter_MUX_eth_8_h_l83_c8_1c74_return_output);

-- BIN_OP_EQ_eth_8_h_l86_c37_155b : 0 clocks latency
BIN_OP_EQ_eth_8_h_l86_c37_155b : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l86_c37_155b_left,
BIN_OP_EQ_eth_8_h_l86_c37_155b_right,
BIN_OP_EQ_eth_8_h_l86_c37_155b_return_output);

-- UNARY_OP_NOT_eth_8_h_l89_c35_3af7 : 0 clocks latency
UNARY_OP_NOT_eth_8_h_l89_c35_3af7 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_eth_8_h_l89_c35_3af7_expr,
UNARY_OP_NOT_eth_8_h_l89_c35_3af7_return_output);

-- BIN_OP_AND_eth_8_h_l89_c18_2663 : 0 clocks latency
BIN_OP_AND_eth_8_h_l89_c18_2663 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l89_c18_2663_left,
BIN_OP_AND_eth_8_h_l89_c18_2663_right,
BIN_OP_AND_eth_8_h_l89_c18_2663_return_output);

-- state_MUX_eth_8_h_l90_c5_7065 : 0 clocks latency
state_MUX_eth_8_h_l90_c5_7065 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l90_c5_7065_cond,
state_MUX_eth_8_h_l90_c5_7065_iftrue,
state_MUX_eth_8_h_l90_c5_7065_iffalse,
state_MUX_eth_8_h_l90_c5_7065_return_output);

-- counter_MUX_eth_8_h_l90_c5_7065 : 0 clocks latency
counter_MUX_eth_8_h_l90_c5_7065 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l90_c5_7065_cond,
counter_MUX_eth_8_h_l90_c5_7065_iftrue,
counter_MUX_eth_8_h_l90_c5_7065_iffalse,
counter_MUX_eth_8_h_l90_c5_7065_return_output);

-- counter_MUX_eth_8_h_l91_c7_fe89 : 0 clocks latency
counter_MUX_eth_8_h_l91_c7_fe89 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l91_c7_fe89_cond,
counter_MUX_eth_8_h_l91_c7_fe89_iftrue,
counter_MUX_eth_8_h_l91_c7_fe89_iffalse,
counter_MUX_eth_8_h_l91_c7_fe89_return_output);

-- BIN_OP_PLUS_eth_8_h_l92_c9_43f6 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l92_c9_43f6 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l92_c9_43f6_left,
BIN_OP_PLUS_eth_8_h_l92_c9_43f6_right,
BIN_OP_PLUS_eth_8_h_l92_c9_43f6_return_output);

-- state_MUX_eth_8_h_l94_c7_99dd : 0 clocks latency
state_MUX_eth_8_h_l94_c7_99dd : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l94_c7_99dd_cond,
state_MUX_eth_8_h_l94_c7_99dd_iftrue,
state_MUX_eth_8_h_l94_c7_99dd_iffalse,
state_MUX_eth_8_h_l94_c7_99dd_return_output);

-- counter_MUX_eth_8_h_l94_c7_99dd : 0 clocks latency
counter_MUX_eth_8_h_l94_c7_99dd : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l94_c7_99dd_cond,
counter_MUX_eth_8_h_l94_c7_99dd_iftrue,
counter_MUX_eth_8_h_l94_c7_99dd_iffalse,
counter_MUX_eth_8_h_l94_c7_99dd_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 mac_axis,
 frame_ready,
 -- Registers
 state,
 header,
 counter,
 -- All submodule outputs
 BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output,
 header_MUX_eth_8_h_l51_c3_407e_return_output,
 o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_return_output,
 o_overflow_MUX_eth_8_h_l51_c3_407e_return_output,
 o_frame_valid_MUX_eth_8_h_l51_c3_407e_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_return_output,
 state_MUX_eth_8_h_l51_c3_407e_return_output,
 counter_MUX_eth_8_h_l51_c3_407e_return_output,
 header_dst_mac_MUX_eth_8_h_l52_c5_4ece_return_output,
 state_MUX_eth_8_h_l52_c5_4ece_return_output,
 counter_MUX_eth_8_h_l52_c5_4ece_return_output,
 BIN_OP_EQ_eth_8_h_l54_c10_80ea_return_output,
 state_MUX_eth_8_h_l54_c7_a8d9_return_output,
 counter_MUX_eth_8_h_l54_c7_a8d9_return_output,
 BIN_OP_PLUS_eth_8_h_l58_c9_41ef_return_output,
 BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output,
 header_ethertype_MUX_eth_8_h_l61_c9_451f_return_output,
 header_src_mac_MUX_eth_8_h_l61_c9_451f_return_output,
 o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_return_output,
 o_overflow_MUX_eth_8_h_l61_c9_451f_return_output,
 o_frame_valid_MUX_eth_8_h_l61_c9_451f_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_return_output,
 state_MUX_eth_8_h_l61_c9_451f_return_output,
 counter_MUX_eth_8_h_l61_c9_451f_return_output,
 header_src_mac_MUX_eth_8_h_l62_c5_e538_return_output,
 state_MUX_eth_8_h_l62_c5_e538_return_output,
 counter_MUX_eth_8_h_l62_c5_e538_return_output,
 BIN_OP_EQ_eth_8_h_l64_c10_9275_return_output,
 state_MUX_eth_8_h_l64_c7_5d9a_return_output,
 counter_MUX_eth_8_h_l64_c7_5d9a_return_output,
 BIN_OP_PLUS_eth_8_h_l68_c9_b707_return_output,
 BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output,
 header_ethertype_MUX_eth_8_h_l71_c9_d565_return_output,
 o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_return_output,
 o_overflow_MUX_eth_8_h_l71_c9_d565_return_output,
 o_frame_valid_MUX_eth_8_h_l71_c9_d565_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_return_output,
 state_MUX_eth_8_h_l71_c9_d565_return_output,
 counter_MUX_eth_8_h_l71_c9_d565_return_output,
 header_ethertype_MUX_eth_8_h_l72_c5_474a_return_output,
 state_MUX_eth_8_h_l72_c5_474a_return_output,
 counter_MUX_eth_8_h_l72_c5_474a_return_output,
 BIN_OP_EQ_eth_8_h_l74_c10_8715_return_output,
 state_MUX_eth_8_h_l74_c7_9dd4_return_output,
 counter_MUX_eth_8_h_l74_c7_9dd4_return_output,
 BIN_OP_PLUS_eth_8_h_l78_c9_1416_return_output,
 BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output,
 o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_return_output,
 o_overflow_MUX_eth_8_h_l83_c8_1c74_return_output,
 o_frame_valid_MUX_eth_8_h_l83_c8_1c74_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_return_output,
 state_MUX_eth_8_h_l83_c8_1c74_return_output,
 counter_MUX_eth_8_h_l83_c8_1c74_return_output,
 BIN_OP_EQ_eth_8_h_l86_c37_155b_return_output,
 UNARY_OP_NOT_eth_8_h_l89_c35_3af7_return_output,
 BIN_OP_AND_eth_8_h_l89_c18_2663_return_output,
 state_MUX_eth_8_h_l90_c5_7065_return_output,
 counter_MUX_eth_8_h_l90_c5_7065_return_output,
 counter_MUX_eth_8_h_l91_c7_fe89_return_output,
 BIN_OP_PLUS_eth_8_h_l92_c9_43f6_return_output,
 state_MUX_eth_8_h_l94_c7_99dd_return_output,
 counter_MUX_eth_8_h_l94_c7_99dd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eth_8_rx_t;
 variable VAR_mac_axis : axis8_t_stream_t;
 variable VAR_frame_ready : unsigned(0 downto 0);
 variable VAR_o : eth_8_rx_t;
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l51_c3_407e_iftrue : eth_header_t;
 variable VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_407e_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_407e_iffalse : eth_header_t;
 variable VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l51_c3_407e_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_407e_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_4ece_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_407e_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_4ece_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_407e_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_407e_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_407e_cond : unsigned(0 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iftrue : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iffalse : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_return_output : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_4ece_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_a8d9_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_4ece_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_4ece_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_4ece_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_a8d9_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_4ece_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_4ece_cond : unsigned(0 downto 0);
 variable VAR_uint40_uint8_eth_8_h_l53_c24_8346_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_a8d9_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_a8d9_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_a8d9_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_a8d9_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l56_c9_527d : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_a8d9_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l58_c9_663f : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_a8d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_41ef_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_41ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_41ef_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_e538_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_451f_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_e538_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_451f_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_d565_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_451f_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_e538_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_5d9a_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_e538_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_e538_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_e538_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_5d9a_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_e538_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_e538_cond : unsigned(0 downto 0);
 variable VAR_uint40_uint8_eth_8_h_l63_c24_f997_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_5d9a_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_5d9a_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_5d9a_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_5d9a_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l66_c9_bf42 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_5d9a_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l68_c9_0b91 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_5d9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_b707_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_b707_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_b707_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_474a_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_d565_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_474a_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_d565_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_1c74_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_d565_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_474a_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_9dd4_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_474a_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_474a_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_474a_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_9dd4_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_474a_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_474a_cond : unsigned(0 downto 0);
 variable VAR_uint8_uint8_eth_8_h_l73_c26_1d20_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_9dd4_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_9dd4_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_9dd4_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_9dd4_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l76_c9_e93e : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_9dd4_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l78_c9_bd85 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_9dd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_1416_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_1416_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_1416_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_7065_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_1c74_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_7065_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_1c74_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_1c74_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_75ad_return_output : axis8_t;
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_2663_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l89_c35_3af7_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l89_c35_3af7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_2663_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_2663_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_7065_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_99dd_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_7065_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_7065_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_7065_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_99dd_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_7065_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_7065_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_fe89_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l92_c9_b90c : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_fe89_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_fe89_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_fe89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_43f6_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_43f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_43f6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_20f9_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_99dd_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_99dd_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_99dd_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_99dd_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l96_c9_fb49 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_99dd_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_99dd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622_eth_8_h_l100_c10_ed56_return_output : eth_8_rx_t;
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_9401_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_7735_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_e43b_return_output : axis8_t;
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_81cc_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l61_l72_l71_l73_DUPLICATE_6caf_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_state : unsigned(2 downto 0);
variable REG_VAR_header : eth_header_t;
variable REG_VAR_counter : unsigned(2 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_state := state;
  REG_VAR_header := header;
  REG_VAR_counter := counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_state_MUX_eth_8_h_l74_c7_9dd4_iftrue := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_right := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_right := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_counter_eth_8_h_l66_c9_bf42 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l64_c7_5d9a_iftrue := VAR_counter_eth_8_h_l66_c9_bf42;
     VAR_counter_eth_8_h_l76_c9_e93e := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l74_c7_9dd4_iftrue := VAR_counter_eth_8_h_l76_c9_e93e;
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_b707_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l96_c9_fb49 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l94_c7_99dd_iftrue := VAR_counter_eth_8_h_l96_c9_fb49;
     VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_iftrue := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_iffalse := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_iftrue := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_43f6_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l94_c7_99dd_iftrue := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l54_c7_a8d9_iftrue := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_right := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_41ef_right := to_unsigned(1, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_right := to_unsigned(5, 3);
     VAR_state_MUX_eth_8_h_l64_c7_5d9a_iftrue := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_right := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_1416_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l56_c9_527d := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l54_c7_a8d9_iftrue := VAR_counter_eth_8_h_l56_c9_527d;
     -- CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_e43b LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_e43b_return_output := eth_8_rx_t_NULL.frame.data.payload;

     -- Submodule level 1
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_e43b_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_e43b_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iffalse := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_e43b_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_e43b_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_mac_axis := mac_axis;
     VAR_frame_ready := frame_ready;

     -- Submodule level 0
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_41ef_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_b707_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_1416_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_43f6_left := counter;
     VAR_counter_MUX_eth_8_h_l52_c5_4ece_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l62_c5_e538_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l72_c5_474a_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l83_c8_1c74_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l90_c5_7065_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l91_c7_fe89_iffalse := counter;
     VAR_UNARY_OP_NOT_eth_8_h_l89_c35_3af7_expr := VAR_frame_ready;
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_left := state;
     VAR_state_MUX_eth_8_h_l52_c5_4ece_iffalse := state;
     VAR_state_MUX_eth_8_h_l54_c7_a8d9_iffalse := state;
     VAR_state_MUX_eth_8_h_l62_c5_e538_iffalse := state;
     VAR_state_MUX_eth_8_h_l64_c7_5d9a_iffalse := state;
     VAR_state_MUX_eth_8_h_l72_c5_474a_iffalse := state;
     VAR_state_MUX_eth_8_h_l74_c7_9dd4_iffalse := state;
     VAR_state_MUX_eth_8_h_l83_c8_1c74_iffalse := state;
     VAR_state_MUX_eth_8_h_l90_c5_7065_iffalse := state;
     VAR_state_MUX_eth_8_h_l94_c7_99dd_iffalse := state;
     -- BIN_OP_EQ[eth_8_h_l71_c12_65f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l71_c12_65f9_left <= VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_left;
     BIN_OP_EQ_eth_8_h_l71_c12_65f9_right <= VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output := BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output;

     -- BIN_OP_EQ[eth_8_h_l74_c10_8715] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l74_c10_8715_left <= VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_left;
     BIN_OP_EQ_eth_8_h_l74_c10_8715_right <= VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_return_output := BIN_OP_EQ_eth_8_h_l74_c10_8715_return_output;

     -- CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_7735 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_7735_return_output := VAR_mac_axis.data.tdata(0);

     -- BIN_OP_PLUS[eth_8_h_l68_c9_b707] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l68_c9_b707_left <= VAR_BIN_OP_PLUS_eth_8_h_l68_c9_b707_left;
     BIN_OP_PLUS_eth_8_h_l68_c9_b707_right <= VAR_BIN_OP_PLUS_eth_8_h_l68_c9_b707_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_b707_return_output := BIN_OP_PLUS_eth_8_h_l68_c9_b707_return_output;

     -- BIN_OP_EQ[eth_8_h_l86_c37_155b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l86_c37_155b_left <= VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_left;
     BIN_OP_EQ_eth_8_h_l86_c37_155b_right <= VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_return_output := BIN_OP_EQ_eth_8_h_l86_c37_155b_return_output;

     -- BIN_OP_PLUS[eth_8_h_l92_c9_43f6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l92_c9_43f6_left <= VAR_BIN_OP_PLUS_eth_8_h_l92_c9_43f6_left;
     BIN_OP_PLUS_eth_8_h_l92_c9_43f6_right <= VAR_BIN_OP_PLUS_eth_8_h_l92_c9_43f6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_43f6_return_output := BIN_OP_PLUS_eth_8_h_l92_c9_43f6_return_output;

     -- UNARY_OP_NOT[eth_8_h_l89_c35_3af7] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_eth_8_h_l89_c35_3af7_expr <= VAR_UNARY_OP_NOT_eth_8_h_l89_c35_3af7_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_eth_8_h_l89_c35_3af7_return_output := UNARY_OP_NOT_eth_8_h_l89_c35_3af7_return_output;

     -- BIN_OP_PLUS[eth_8_h_l58_c9_41ef] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l58_c9_41ef_left <= VAR_BIN_OP_PLUS_eth_8_h_l58_c9_41ef_left;
     BIN_OP_PLUS_eth_8_h_l58_c9_41ef_right <= VAR_BIN_OP_PLUS_eth_8_h_l58_c9_41ef_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_41ef_return_output := BIN_OP_PLUS_eth_8_h_l58_c9_41ef_return_output;

     -- CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l61_l72_l71_l73_DUPLICATE_6caf LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l61_l72_l71_l73_DUPLICATE_6caf_return_output := header.ethertype;

     -- CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d[eth_8_h_l85_c28_75ad] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_75ad_return_output := VAR_mac_axis.data;

     -- BIN_OP_EQ[eth_8_h_l51_c6_f1bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l51_c6_f1bd_left <= VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_left;
     BIN_OP_EQ_eth_8_h_l51_c6_f1bd_right <= VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output := BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output := VAR_mac_axis.valid;

     -- CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_81cc LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_81cc_return_output := header.src_mac;

     -- BIN_OP_EQ[eth_8_h_l64_c10_9275] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l64_c10_9275_left <= VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_left;
     BIN_OP_EQ_eth_8_h_l64_c10_9275_right <= VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_return_output := BIN_OP_EQ_eth_8_h_l64_c10_9275_return_output;

     -- BIN_OP_EQ[eth_8_h_l54_c10_80ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l54_c10_80ea_left <= VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_left;
     BIN_OP_EQ_eth_8_h_l54_c10_80ea_right <= VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_return_output := BIN_OP_EQ_eth_8_h_l54_c10_80ea_return_output;

     -- BIN_OP_EQ[eth_8_h_l61_c12_9566] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l61_c12_9566_left <= VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_left;
     BIN_OP_EQ_eth_8_h_l61_c12_9566_right <= VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output := BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output;

     -- BIN_OP_PLUS[eth_8_h_l78_c9_1416] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l78_c9_1416_left <= VAR_BIN_OP_PLUS_eth_8_h_l78_c9_1416_left;
     BIN_OP_PLUS_eth_8_h_l78_c9_1416_right <= VAR_BIN_OP_PLUS_eth_8_h_l78_c9_1416_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_1416_return_output := BIN_OP_PLUS_eth_8_h_l78_c9_1416_return_output;

     -- BIN_OP_EQ[eth_8_h_l83_c11_2206] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l83_c11_2206_left <= VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_left;
     BIN_OP_EQ_eth_8_h_l83_c11_2206_right <= VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output := BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output;

     -- CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_9401 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_9401_return_output := header.dst_mac;

     -- Submodule level 1
     VAR_counter_MUX_eth_8_h_l51_c3_407e_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_407e_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output;
     VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_407e_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_f1bd_return_output;
     VAR_counter_MUX_eth_8_h_l54_c7_a8d9_cond := VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_return_output;
     VAR_state_MUX_eth_8_h_l54_c7_a8d9_cond := VAR_BIN_OP_EQ_eth_8_h_l54_c10_80ea_return_output;
     VAR_counter_MUX_eth_8_h_l61_c9_451f_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output;
     VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_451f_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_9566_return_output;
     VAR_counter_MUX_eth_8_h_l64_c7_5d9a_cond := VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_return_output;
     VAR_state_MUX_eth_8_h_l64_c7_5d9a_cond := VAR_BIN_OP_EQ_eth_8_h_l64_c10_9275_return_output;
     VAR_counter_MUX_eth_8_h_l71_c9_d565_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output;
     VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_d565_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_65f9_return_output;
     VAR_counter_MUX_eth_8_h_l74_c7_9dd4_cond := VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_return_output;
     VAR_state_MUX_eth_8_h_l74_c7_9dd4_cond := VAR_BIN_OP_EQ_eth_8_h_l74_c10_8715_return_output;
     VAR_counter_MUX_eth_8_h_l83_c8_1c74_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output;
     VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output;
     VAR_state_MUX_eth_8_h_l83_c8_1c74_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_2206_return_output;
     VAR_counter_MUX_eth_8_h_l91_c7_fe89_cond := VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iftrue := VAR_BIN_OP_EQ_eth_8_h_l86_c37_155b_return_output;
     VAR_counter_eth_8_h_l58_c9_663f := resize(VAR_BIN_OP_PLUS_eth_8_h_l58_c9_41ef_return_output, 3);
     VAR_counter_eth_8_h_l68_c9_0b91 := resize(VAR_BIN_OP_PLUS_eth_8_h_l68_c9_b707_return_output, 3);
     VAR_counter_eth_8_h_l78_c9_bd85 := resize(VAR_BIN_OP_PLUS_eth_8_h_l78_c9_1416_return_output, 3);
     VAR_counter_eth_8_h_l92_c9_b90c := resize(VAR_BIN_OP_PLUS_eth_8_h_l92_c9_43f6_return_output, 3);
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iftrue := VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_75ad_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_iftrue := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l61_l72_l71_l73_DUPLICATE_6caf_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l61_l72_l71_l73_DUPLICATE_6caf_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l61_l72_l71_l73_DUPLICATE_6caf_return_output;
     VAR_BIN_OP_AND_eth_8_h_l89_c18_2663_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_counter_MUX_eth_8_h_l52_c5_4ece_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_counter_MUX_eth_8_h_l62_c5_e538_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_counter_MUX_eth_8_h_l72_c5_474a_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_counter_MUX_eth_8_h_l90_c5_7065_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_state_MUX_eth_8_h_l52_c5_4ece_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_state_MUX_eth_8_h_l62_c5_e538_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_state_MUX_eth_8_h_l72_c5_474a_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_state_MUX_eth_8_h_l90_c5_7065_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l52_l72_l87_DUPLICATE_4262_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_9401_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_81cc_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_81cc_return_output;
     VAR_BIN_OP_AND_eth_8_h_l89_c18_2663_right := VAR_UNARY_OP_NOT_eth_8_h_l89_c35_3af7_return_output;
     VAR_counter_MUX_eth_8_h_l54_c7_a8d9_iffalse := VAR_counter_eth_8_h_l58_c9_663f;
     VAR_counter_MUX_eth_8_h_l64_c7_5d9a_iffalse := VAR_counter_eth_8_h_l68_c9_0b91;
     VAR_counter_MUX_eth_8_h_l74_c7_9dd4_iffalse := VAR_counter_eth_8_h_l78_c9_bd85;
     VAR_counter_MUX_eth_8_h_l91_c7_fe89_iftrue := VAR_counter_eth_8_h_l92_c9_b90c;
     -- CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7[eth_8_h_l94_c10_20f9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_20f9_return_output := CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7(
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_75ad_return_output);

     -- counter_MUX[eth_8_h_l54_c7_a8d9] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l54_c7_a8d9_cond <= VAR_counter_MUX_eth_8_h_l54_c7_a8d9_cond;
     counter_MUX_eth_8_h_l54_c7_a8d9_iftrue <= VAR_counter_MUX_eth_8_h_l54_c7_a8d9_iftrue;
     counter_MUX_eth_8_h_l54_c7_a8d9_iffalse <= VAR_counter_MUX_eth_8_h_l54_c7_a8d9_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l54_c7_a8d9_return_output := counter_MUX_eth_8_h_l54_c7_a8d9_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l83_c8_1c74] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_cond;
     o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_return_output := o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_return_output;

     -- counter_MUX[eth_8_h_l91_c7_fe89] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l91_c7_fe89_cond <= VAR_counter_MUX_eth_8_h_l91_c7_fe89_cond;
     counter_MUX_eth_8_h_l91_c7_fe89_iftrue <= VAR_counter_MUX_eth_8_h_l91_c7_fe89_iftrue;
     counter_MUX_eth_8_h_l91_c7_fe89_iffalse <= VAR_counter_MUX_eth_8_h_l91_c7_fe89_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l91_c7_fe89_return_output := counter_MUX_eth_8_h_l91_c7_fe89_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l83_c8_1c74] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_return_output;

     -- counter_MUX[eth_8_h_l64_c7_5d9a] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l64_c7_5d9a_cond <= VAR_counter_MUX_eth_8_h_l64_c7_5d9a_cond;
     counter_MUX_eth_8_h_l64_c7_5d9a_iftrue <= VAR_counter_MUX_eth_8_h_l64_c7_5d9a_iftrue;
     counter_MUX_eth_8_h_l64_c7_5d9a_iffalse <= VAR_counter_MUX_eth_8_h_l64_c7_5d9a_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l64_c7_5d9a_return_output := counter_MUX_eth_8_h_l64_c7_5d9a_return_output;

     -- state_MUX[eth_8_h_l54_c7_a8d9] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l54_c7_a8d9_cond <= VAR_state_MUX_eth_8_h_l54_c7_a8d9_cond;
     state_MUX_eth_8_h_l54_c7_a8d9_iftrue <= VAR_state_MUX_eth_8_h_l54_c7_a8d9_iftrue;
     state_MUX_eth_8_h_l54_c7_a8d9_iffalse <= VAR_state_MUX_eth_8_h_l54_c7_a8d9_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l54_c7_a8d9_return_output := state_MUX_eth_8_h_l54_c7_a8d9_return_output;

     -- state_MUX[eth_8_h_l74_c7_9dd4] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l74_c7_9dd4_cond <= VAR_state_MUX_eth_8_h_l74_c7_9dd4_cond;
     state_MUX_eth_8_h_l74_c7_9dd4_iftrue <= VAR_state_MUX_eth_8_h_l74_c7_9dd4_iftrue;
     state_MUX_eth_8_h_l74_c7_9dd4_iffalse <= VAR_state_MUX_eth_8_h_l74_c7_9dd4_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l74_c7_9dd4_return_output := state_MUX_eth_8_h_l74_c7_9dd4_return_output;

     -- state_MUX[eth_8_h_l64_c7_5d9a] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l64_c7_5d9a_cond <= VAR_state_MUX_eth_8_h_l64_c7_5d9a_cond;
     state_MUX_eth_8_h_l64_c7_5d9a_iftrue <= VAR_state_MUX_eth_8_h_l64_c7_5d9a_iftrue;
     state_MUX_eth_8_h_l64_c7_5d9a_iffalse <= VAR_state_MUX_eth_8_h_l64_c7_5d9a_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l64_c7_5d9a_return_output := state_MUX_eth_8_h_l64_c7_5d9a_return_output;

     -- uint8_uint8[eth_8_h_l73_c26_1d20] LATENCY=0
     VAR_uint8_uint8_eth_8_h_l73_c26_1d20_return_output := uint8_uint8(
     resize(VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l61_l72_l71_l73_DUPLICATE_6caf_return_output, 8),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_7735_return_output);

     -- o_frame_valid_MUX[eth_8_h_l83_c8_1c74] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l83_c8_1c74_cond <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_cond;
     o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iftrue;
     o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_return_output := o_frame_valid_MUX_eth_8_h_l83_c8_1c74_return_output;

     -- uint40_uint8[eth_8_h_l53_c24_8346] LATENCY=0
     VAR_uint40_uint8_eth_8_h_l53_c24_8346_return_output := uint40_uint8(
     resize(VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_9401_return_output, 40),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_7735_return_output);

     -- BIN_OP_AND[eth_8_h_l89_c18_2663] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l89_c18_2663_left <= VAR_BIN_OP_AND_eth_8_h_l89_c18_2663_left;
     BIN_OP_AND_eth_8_h_l89_c18_2663_right <= VAR_BIN_OP_AND_eth_8_h_l89_c18_2663_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l89_c18_2663_return_output := BIN_OP_AND_eth_8_h_l89_c18_2663_return_output;

     -- uint40_uint8[eth_8_h_l63_c24_f997] LATENCY=0
     VAR_uint40_uint8_eth_8_h_l63_c24_f997_return_output := uint40_uint8(
     resize(VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_81cc_return_output, 40),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_7735_return_output);

     -- counter_MUX[eth_8_h_l74_c7_9dd4] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l74_c7_9dd4_cond <= VAR_counter_MUX_eth_8_h_l74_c7_9dd4_cond;
     counter_MUX_eth_8_h_l74_c7_9dd4_iftrue <= VAR_counter_MUX_eth_8_h_l74_c7_9dd4_iftrue;
     counter_MUX_eth_8_h_l74_c7_9dd4_iffalse <= VAR_counter_MUX_eth_8_h_l74_c7_9dd4_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l74_c7_9dd4_return_output := counter_MUX_eth_8_h_l74_c7_9dd4_return_output;

     -- Submodule level 2
     VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_iftrue := VAR_BIN_OP_AND_eth_8_h_l89_c18_2663_return_output;
     VAR_counter_MUX_eth_8_h_l94_c7_99dd_cond := VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_20f9_return_output;
     VAR_state_MUX_eth_8_h_l94_c7_99dd_cond := VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_20f9_return_output;
     VAR_counter_MUX_eth_8_h_l52_c5_4ece_iftrue := VAR_counter_MUX_eth_8_h_l54_c7_a8d9_return_output;
     VAR_counter_MUX_eth_8_h_l62_c5_e538_iftrue := VAR_counter_MUX_eth_8_h_l64_c7_5d9a_return_output;
     VAR_counter_MUX_eth_8_h_l72_c5_474a_iftrue := VAR_counter_MUX_eth_8_h_l74_c7_9dd4_return_output;
     VAR_counter_MUX_eth_8_h_l94_c7_99dd_iffalse := VAR_counter_MUX_eth_8_h_l91_c7_fe89_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1c74_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1c74_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1c74_return_output;
     VAR_state_MUX_eth_8_h_l52_c5_4ece_iftrue := VAR_state_MUX_eth_8_h_l54_c7_a8d9_return_output;
     VAR_state_MUX_eth_8_h_l62_c5_e538_iftrue := VAR_state_MUX_eth_8_h_l64_c7_5d9a_return_output;
     VAR_state_MUX_eth_8_h_l72_c5_474a_iftrue := VAR_state_MUX_eth_8_h_l74_c7_9dd4_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iftrue := VAR_uint40_uint8_eth_8_h_l53_c24_8346_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_iftrue := VAR_uint40_uint8_eth_8_h_l63_c24_f997_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_iftrue := VAR_uint8_uint8_eth_8_h_l73_c26_1d20_return_output;
     -- state_MUX[eth_8_h_l52_c5_4ece] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l52_c5_4ece_cond <= VAR_state_MUX_eth_8_h_l52_c5_4ece_cond;
     state_MUX_eth_8_h_l52_c5_4ece_iftrue <= VAR_state_MUX_eth_8_h_l52_c5_4ece_iftrue;
     state_MUX_eth_8_h_l52_c5_4ece_iffalse <= VAR_state_MUX_eth_8_h_l52_c5_4ece_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l52_c5_4ece_return_output := state_MUX_eth_8_h_l52_c5_4ece_return_output;

     -- header_src_mac_MUX[eth_8_h_l62_c5_e538] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l62_c5_e538_cond <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_cond;
     header_src_mac_MUX_eth_8_h_l62_c5_e538_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_iftrue;
     header_src_mac_MUX_eth_8_h_l62_c5_e538_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_return_output := header_src_mac_MUX_eth_8_h_l62_c5_e538_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l71_c9_d565] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_cond;
     o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_return_output := o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l71_c9_d565] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_return_output;

     -- o_overflow_MUX[eth_8_h_l83_c8_1c74] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l83_c8_1c74_cond <= VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_cond;
     o_overflow_MUX_eth_8_h_l83_c8_1c74_iftrue <= VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_iftrue;
     o_overflow_MUX_eth_8_h_l83_c8_1c74_iffalse <= VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_return_output := o_overflow_MUX_eth_8_h_l83_c8_1c74_return_output;

     -- counter_MUX[eth_8_h_l94_c7_99dd] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l94_c7_99dd_cond <= VAR_counter_MUX_eth_8_h_l94_c7_99dd_cond;
     counter_MUX_eth_8_h_l94_c7_99dd_iftrue <= VAR_counter_MUX_eth_8_h_l94_c7_99dd_iftrue;
     counter_MUX_eth_8_h_l94_c7_99dd_iffalse <= VAR_counter_MUX_eth_8_h_l94_c7_99dd_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l94_c7_99dd_return_output := counter_MUX_eth_8_h_l94_c7_99dd_return_output;

     -- counter_MUX[eth_8_h_l62_c5_e538] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l62_c5_e538_cond <= VAR_counter_MUX_eth_8_h_l62_c5_e538_cond;
     counter_MUX_eth_8_h_l62_c5_e538_iftrue <= VAR_counter_MUX_eth_8_h_l62_c5_e538_iftrue;
     counter_MUX_eth_8_h_l62_c5_e538_iffalse <= VAR_counter_MUX_eth_8_h_l62_c5_e538_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l62_c5_e538_return_output := counter_MUX_eth_8_h_l62_c5_e538_return_output;

     -- o_frame_valid_MUX[eth_8_h_l71_c9_d565] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l71_c9_d565_cond <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_cond;
     o_frame_valid_MUX_eth_8_h_l71_c9_d565_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_iftrue;
     o_frame_valid_MUX_eth_8_h_l71_c9_d565_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_return_output := o_frame_valid_MUX_eth_8_h_l71_c9_d565_return_output;

     -- header_dst_mac_MUX[eth_8_h_l52_c5_4ece] LATENCY=0
     -- Inputs
     header_dst_mac_MUX_eth_8_h_l52_c5_4ece_cond <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_cond;
     header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iftrue <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iftrue;
     header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iffalse <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_iffalse;
     -- Outputs
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_return_output := header_dst_mac_MUX_eth_8_h_l52_c5_4ece_return_output;

     -- state_MUX[eth_8_h_l62_c5_e538] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l62_c5_e538_cond <= VAR_state_MUX_eth_8_h_l62_c5_e538_cond;
     state_MUX_eth_8_h_l62_c5_e538_iftrue <= VAR_state_MUX_eth_8_h_l62_c5_e538_iftrue;
     state_MUX_eth_8_h_l62_c5_e538_iffalse <= VAR_state_MUX_eth_8_h_l62_c5_e538_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l62_c5_e538_return_output := state_MUX_eth_8_h_l62_c5_e538_return_output;

     -- counter_MUX[eth_8_h_l72_c5_474a] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l72_c5_474a_cond <= VAR_counter_MUX_eth_8_h_l72_c5_474a_cond;
     counter_MUX_eth_8_h_l72_c5_474a_iftrue <= VAR_counter_MUX_eth_8_h_l72_c5_474a_iftrue;
     counter_MUX_eth_8_h_l72_c5_474a_iffalse <= VAR_counter_MUX_eth_8_h_l72_c5_474a_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l72_c5_474a_return_output := counter_MUX_eth_8_h_l72_c5_474a_return_output;

     -- state_MUX[eth_8_h_l72_c5_474a] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l72_c5_474a_cond <= VAR_state_MUX_eth_8_h_l72_c5_474a_cond;
     state_MUX_eth_8_h_l72_c5_474a_iftrue <= VAR_state_MUX_eth_8_h_l72_c5_474a_iftrue;
     state_MUX_eth_8_h_l72_c5_474a_iffalse <= VAR_state_MUX_eth_8_h_l72_c5_474a_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l72_c5_474a_return_output := state_MUX_eth_8_h_l72_c5_474a_return_output;

     -- state_MUX[eth_8_h_l94_c7_99dd] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l94_c7_99dd_cond <= VAR_state_MUX_eth_8_h_l94_c7_99dd_cond;
     state_MUX_eth_8_h_l94_c7_99dd_iftrue <= VAR_state_MUX_eth_8_h_l94_c7_99dd_iftrue;
     state_MUX_eth_8_h_l94_c7_99dd_iffalse <= VAR_state_MUX_eth_8_h_l94_c7_99dd_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l94_c7_99dd_return_output := state_MUX_eth_8_h_l94_c7_99dd_return_output;

     -- counter_MUX[eth_8_h_l52_c5_4ece] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l52_c5_4ece_cond <= VAR_counter_MUX_eth_8_h_l52_c5_4ece_cond;
     counter_MUX_eth_8_h_l52_c5_4ece_iftrue <= VAR_counter_MUX_eth_8_h_l52_c5_4ece_iftrue;
     counter_MUX_eth_8_h_l52_c5_4ece_iffalse <= VAR_counter_MUX_eth_8_h_l52_c5_4ece_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l52_c5_4ece_return_output := counter_MUX_eth_8_h_l52_c5_4ece_return_output;

     -- header_ethertype_MUX[eth_8_h_l72_c5_474a] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l72_c5_474a_cond <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_cond;
     header_ethertype_MUX_eth_8_h_l72_c5_474a_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_iftrue;
     header_ethertype_MUX_eth_8_h_l72_c5_474a_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_return_output := header_ethertype_MUX_eth_8_h_l72_c5_474a_return_output;

     -- Submodule level 3
     VAR_counter_MUX_eth_8_h_l51_c3_407e_iftrue := VAR_counter_MUX_eth_8_h_l52_c5_4ece_return_output;
     VAR_counter_MUX_eth_8_h_l61_c9_451f_iftrue := VAR_counter_MUX_eth_8_h_l62_c5_e538_return_output;
     VAR_counter_MUX_eth_8_h_l71_c9_d565_iftrue := VAR_counter_MUX_eth_8_h_l72_c5_474a_return_output;
     VAR_counter_MUX_eth_8_h_l90_c5_7065_iftrue := VAR_counter_MUX_eth_8_h_l94_c7_99dd_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_iftrue := VAR_header_ethertype_MUX_eth_8_h_l72_c5_474a_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_iftrue := VAR_header_src_mac_MUX_eth_8_h_l62_c5_e538_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_d565_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_d565_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l71_c9_d565_return_output;
     VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_iffalse := VAR_o_overflow_MUX_eth_8_h_l83_c8_1c74_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_407e_iftrue := VAR_state_MUX_eth_8_h_l52_c5_4ece_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_451f_iftrue := VAR_state_MUX_eth_8_h_l62_c5_e538_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_d565_iftrue := VAR_state_MUX_eth_8_h_l72_c5_474a_return_output;
     VAR_state_MUX_eth_8_h_l90_c5_7065_iftrue := VAR_state_MUX_eth_8_h_l94_c7_99dd_return_output;
     -- header_ethertype_MUX[eth_8_h_l71_c9_d565] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l71_c9_d565_cond <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_cond;
     header_ethertype_MUX_eth_8_h_l71_c9_d565_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_iftrue;
     header_ethertype_MUX_eth_8_h_l71_c9_d565_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_return_output := header_ethertype_MUX_eth_8_h_l71_c9_d565_return_output;

     -- counter_MUX[eth_8_h_l90_c5_7065] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l90_c5_7065_cond <= VAR_counter_MUX_eth_8_h_l90_c5_7065_cond;
     counter_MUX_eth_8_h_l90_c5_7065_iftrue <= VAR_counter_MUX_eth_8_h_l90_c5_7065_iftrue;
     counter_MUX_eth_8_h_l90_c5_7065_iffalse <= VAR_counter_MUX_eth_8_h_l90_c5_7065_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l90_c5_7065_return_output := counter_MUX_eth_8_h_l90_c5_7065_return_output;

     -- o_frame_valid_MUX[eth_8_h_l61_c9_451f] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l61_c9_451f_cond <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_cond;
     o_frame_valid_MUX_eth_8_h_l61_c9_451f_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_iftrue;
     o_frame_valid_MUX_eth_8_h_l61_c9_451f_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_return_output := o_frame_valid_MUX_eth_8_h_l61_c9_451f_return_output;

     -- header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484[eth_8_h_l51_c3_407e] LATENCY=0
     VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_407e_return_output := CONST_REF_RD_eth_header_t_eth_header_t_e484(
     header,
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_4ece_return_output);

     -- o_frame_data_payload_MUX[eth_8_h_l61_c9_451f] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_cond;
     o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_return_output := o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_return_output;

     -- header_src_mac_MUX[eth_8_h_l61_c9_451f] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l61_c9_451f_cond <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_cond;
     header_src_mac_MUX_eth_8_h_l61_c9_451f_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_iftrue;
     header_src_mac_MUX_eth_8_h_l61_c9_451f_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_return_output := header_src_mac_MUX_eth_8_h_l61_c9_451f_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l61_c9_451f] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_return_output;

     -- o_overflow_MUX[eth_8_h_l71_c9_d565] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l71_c9_d565_cond <= VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_cond;
     o_overflow_MUX_eth_8_h_l71_c9_d565_iftrue <= VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_iftrue;
     o_overflow_MUX_eth_8_h_l71_c9_d565_iffalse <= VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_return_output := o_overflow_MUX_eth_8_h_l71_c9_d565_return_output;

     -- state_MUX[eth_8_h_l90_c5_7065] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l90_c5_7065_cond <= VAR_state_MUX_eth_8_h_l90_c5_7065_cond;
     state_MUX_eth_8_h_l90_c5_7065_iftrue <= VAR_state_MUX_eth_8_h_l90_c5_7065_iftrue;
     state_MUX_eth_8_h_l90_c5_7065_iffalse <= VAR_state_MUX_eth_8_h_l90_c5_7065_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l90_c5_7065_return_output := state_MUX_eth_8_h_l90_c5_7065_return_output;

     -- Submodule level 4
     VAR_counter_MUX_eth_8_h_l83_c8_1c74_iftrue := VAR_counter_MUX_eth_8_h_l90_c5_7065_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_407e_iftrue := VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_407e_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_iffalse := VAR_header_ethertype_MUX_eth_8_h_l71_c9_d565_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_451f_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_451f_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l61_c9_451f_return_output;
     VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_iffalse := VAR_o_overflow_MUX_eth_8_h_l71_c9_d565_return_output;
     VAR_state_MUX_eth_8_h_l83_c8_1c74_iftrue := VAR_state_MUX_eth_8_h_l90_c5_7065_return_output;
     -- o_overflow_MUX[eth_8_h_l61_c9_451f] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l61_c9_451f_cond <= VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_cond;
     o_overflow_MUX_eth_8_h_l61_c9_451f_iftrue <= VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_iftrue;
     o_overflow_MUX_eth_8_h_l61_c9_451f_iffalse <= VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_return_output := o_overflow_MUX_eth_8_h_l61_c9_451f_return_output;

     -- state_MUX[eth_8_h_l83_c8_1c74] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l83_c8_1c74_cond <= VAR_state_MUX_eth_8_h_l83_c8_1c74_cond;
     state_MUX_eth_8_h_l83_c8_1c74_iftrue <= VAR_state_MUX_eth_8_h_l83_c8_1c74_iftrue;
     state_MUX_eth_8_h_l83_c8_1c74_iffalse <= VAR_state_MUX_eth_8_h_l83_c8_1c74_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l83_c8_1c74_return_output := state_MUX_eth_8_h_l83_c8_1c74_return_output;

     -- o_frame_valid_MUX[eth_8_h_l51_c3_407e] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l51_c3_407e_cond <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_cond;
     o_frame_valid_MUX_eth_8_h_l51_c3_407e_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_iftrue;
     o_frame_valid_MUX_eth_8_h_l51_c3_407e_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_return_output := o_frame_valid_MUX_eth_8_h_l51_c3_407e_return_output;

     -- counter_MUX[eth_8_h_l83_c8_1c74] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l83_c8_1c74_cond <= VAR_counter_MUX_eth_8_h_l83_c8_1c74_cond;
     counter_MUX_eth_8_h_l83_c8_1c74_iftrue <= VAR_counter_MUX_eth_8_h_l83_c8_1c74_iftrue;
     counter_MUX_eth_8_h_l83_c8_1c74_iffalse <= VAR_counter_MUX_eth_8_h_l83_c8_1c74_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l83_c8_1c74_return_output := counter_MUX_eth_8_h_l83_c8_1c74_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l51_c3_407e] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_cond;
     o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_return_output := o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l51_c3_407e] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_return_output;

     -- header_ethertype_MUX[eth_8_h_l61_c9_451f] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l61_c9_451f_cond <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_cond;
     header_ethertype_MUX_eth_8_h_l61_c9_451f_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_iftrue;
     header_ethertype_MUX_eth_8_h_l61_c9_451f_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_return_output := header_ethertype_MUX_eth_8_h_l61_c9_451f_return_output;

     -- Submodule level 5
     VAR_counter_MUX_eth_8_h_l71_c9_d565_iffalse := VAR_counter_MUX_eth_8_h_l83_c8_1c74_return_output;
     VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_iffalse := VAR_o_overflow_MUX_eth_8_h_l61_c9_451f_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_d565_iffalse := VAR_state_MUX_eth_8_h_l83_c8_1c74_return_output;
     -- counter_MUX[eth_8_h_l71_c9_d565] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l71_c9_d565_cond <= VAR_counter_MUX_eth_8_h_l71_c9_d565_cond;
     counter_MUX_eth_8_h_l71_c9_d565_iftrue <= VAR_counter_MUX_eth_8_h_l71_c9_d565_iftrue;
     counter_MUX_eth_8_h_l71_c9_d565_iffalse <= VAR_counter_MUX_eth_8_h_l71_c9_d565_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l71_c9_d565_return_output := counter_MUX_eth_8_h_l71_c9_d565_return_output;

     -- o_overflow_MUX[eth_8_h_l51_c3_407e] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l51_c3_407e_cond <= VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_cond;
     o_overflow_MUX_eth_8_h_l51_c3_407e_iftrue <= VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_iftrue;
     o_overflow_MUX_eth_8_h_l51_c3_407e_iffalse <= VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_return_output := o_overflow_MUX_eth_8_h_l51_c3_407e_return_output;

     -- state_MUX[eth_8_h_l71_c9_d565] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l71_c9_d565_cond <= VAR_state_MUX_eth_8_h_l71_c9_d565_cond;
     state_MUX_eth_8_h_l71_c9_d565_iftrue <= VAR_state_MUX_eth_8_h_l71_c9_d565_iftrue;
     state_MUX_eth_8_h_l71_c9_d565_iffalse <= VAR_state_MUX_eth_8_h_l71_c9_d565_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l71_c9_d565_return_output := state_MUX_eth_8_h_l71_c9_d565_return_output;

     -- header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a[eth_8_h_l51_c3_407e] LATENCY=0
     VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l51_c3_407e_return_output := CONST_REF_RD_eth_header_t_eth_header_t_325a(
     header,
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_451f_return_output,
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_451f_return_output);

     -- Submodule level 6
     VAR_counter_MUX_eth_8_h_l61_c9_451f_iffalse := VAR_counter_MUX_eth_8_h_l71_c9_d565_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_407e_iffalse := VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l51_c3_407e_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_451f_iffalse := VAR_state_MUX_eth_8_h_l71_c9_d565_return_output;
     -- counter_MUX[eth_8_h_l61_c9_451f] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l61_c9_451f_cond <= VAR_counter_MUX_eth_8_h_l61_c9_451f_cond;
     counter_MUX_eth_8_h_l61_c9_451f_iftrue <= VAR_counter_MUX_eth_8_h_l61_c9_451f_iftrue;
     counter_MUX_eth_8_h_l61_c9_451f_iffalse <= VAR_counter_MUX_eth_8_h_l61_c9_451f_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l61_c9_451f_return_output := counter_MUX_eth_8_h_l61_c9_451f_return_output;

     -- header_MUX[eth_8_h_l51_c3_407e] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l51_c3_407e_cond <= VAR_header_MUX_eth_8_h_l51_c3_407e_cond;
     header_MUX_eth_8_h_l51_c3_407e_iftrue <= VAR_header_MUX_eth_8_h_l51_c3_407e_iftrue;
     header_MUX_eth_8_h_l51_c3_407e_iffalse <= VAR_header_MUX_eth_8_h_l51_c3_407e_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l51_c3_407e_return_output := header_MUX_eth_8_h_l51_c3_407e_return_output;

     -- CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622[eth_8_h_l100_c10_ed56] LATENCY=0
     VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622_eth_8_h_l100_c10_ed56_return_output := CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622(
     header,
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_407e_return_output,
     VAR_o_overflow_MUX_eth_8_h_l51_c3_407e_return_output,
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_407e_return_output,
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_407e_return_output);

     -- state_MUX[eth_8_h_l61_c9_451f] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l61_c9_451f_cond <= VAR_state_MUX_eth_8_h_l61_c9_451f_cond;
     state_MUX_eth_8_h_l61_c9_451f_iftrue <= VAR_state_MUX_eth_8_h_l61_c9_451f_iftrue;
     state_MUX_eth_8_h_l61_c9_451f_iffalse <= VAR_state_MUX_eth_8_h_l61_c9_451f_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l61_c9_451f_return_output := state_MUX_eth_8_h_l61_c9_451f_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622_eth_8_h_l100_c10_ed56_return_output;
     VAR_counter_MUX_eth_8_h_l51_c3_407e_iffalse := VAR_counter_MUX_eth_8_h_l61_c9_451f_return_output;
     REG_VAR_header := VAR_header_MUX_eth_8_h_l51_c3_407e_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_407e_iffalse := VAR_state_MUX_eth_8_h_l61_c9_451f_return_output;
     -- counter_MUX[eth_8_h_l51_c3_407e] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l51_c3_407e_cond <= VAR_counter_MUX_eth_8_h_l51_c3_407e_cond;
     counter_MUX_eth_8_h_l51_c3_407e_iftrue <= VAR_counter_MUX_eth_8_h_l51_c3_407e_iftrue;
     counter_MUX_eth_8_h_l51_c3_407e_iffalse <= VAR_counter_MUX_eth_8_h_l51_c3_407e_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l51_c3_407e_return_output := counter_MUX_eth_8_h_l51_c3_407e_return_output;

     -- state_MUX[eth_8_h_l51_c3_407e] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l51_c3_407e_cond <= VAR_state_MUX_eth_8_h_l51_c3_407e_cond;
     state_MUX_eth_8_h_l51_c3_407e_iftrue <= VAR_state_MUX_eth_8_h_l51_c3_407e_iftrue;
     state_MUX_eth_8_h_l51_c3_407e_iffalse <= VAR_state_MUX_eth_8_h_l51_c3_407e_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l51_c3_407e_return_output := state_MUX_eth_8_h_l51_c3_407e_return_output;

     -- Submodule level 8
     REG_VAR_counter := VAR_counter_MUX_eth_8_h_l51_c3_407e_return_output;
     REG_VAR_state := VAR_state_MUX_eth_8_h_l51_c3_407e_return_output;
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
