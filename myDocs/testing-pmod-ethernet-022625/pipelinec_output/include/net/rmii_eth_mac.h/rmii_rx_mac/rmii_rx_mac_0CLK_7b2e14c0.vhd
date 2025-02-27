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
-- Submodules: 71
entity rmii_rx_mac_0CLK_7b2e14c0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 data_in : in unsigned(1 downto 0);
 data_in_valid : in unsigned(0 downto 0);
 return_output : out rmii_rx_mac_t);
end rmii_rx_mac_0CLK_7b2e14c0;
architecture arch of rmii_rx_mac_0CLK_7b2e14c0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal data_in_regs : uint2_t_20 := (others => to_unsigned(0, 2));
signal data_in_valid_regs : uint1_t_20 := (others => to_unsigned(0, 1));
signal data_out_reg : unsigned(7 downto 0) := to_unsigned(0, 8);
signal state : unsigned(1 downto 0) := unsigned(rmii_rx_mac_state_t_to_slv(rmii_rx_mac_state_t'left));
signal bit_counter : unsigned(2 downto 0) := to_unsigned(0, 3);
signal byte_counter : unsigned(1 downto 0) := to_unsigned(0, 2);
signal fcs_reg : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_data_in_regs : uint2_t_20;
signal REG_COMB_data_in_valid_regs : uint1_t_20;
signal REG_COMB_data_out_reg : unsigned(7 downto 0);
signal REG_COMB_state : unsigned(1 downto 0);
signal REG_COMB_bit_counter : unsigned(2 downto 0);
signal REG_COMB_byte_counter : unsigned(1 downto 0);
signal REG_COMB_fcs_reg : unsigned(31 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_EQ[rmii_eth_mac_h_l43_c22_3cba]
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l44_c53_f5f5]
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l44_c28_f2ef]
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l45_c48_d1c6]
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l45_c23_ab81]
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l48_c6_8709]
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l48_c3_466c]
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l48_c3_466c]
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(1 downto 0);

-- valid_MUX[rmii_eth_mac_h_l48_c3_466c]
signal valid_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(0 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l48_c3_466c]
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(7 downto 0);

-- err_MUX[rmii_eth_mac_h_l48_c3_466c]
signal err_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l48_c3_466c]
signal last_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l48_c3_466c]
signal state_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(1 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l48_c3_466c]
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(31 downto 0);

-- err_MUX[rmii_eth_mac_h_l54_c5_0347]
signal err_MUX_rmii_eth_mac_h_l54_c5_0347_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_0347_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l54_c5_0347]
signal state_MUX_rmii_eth_mac_h_l54_c5_0347_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_0347_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l59_c11_0ad8]
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l59_c8_d27c]
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l59_c8_d27c]
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(1 downto 0);

-- valid_MUX[rmii_eth_mac_h_l59_c8_d27c]
signal valid_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(0 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l59_c8_d27c]
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(7 downto 0);

-- err_MUX[rmii_eth_mac_h_l59_c8_d27c]
signal err_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l59_c8_d27c]
signal last_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l59_c8_d27c]
signal state_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(1 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l59_c8_d27c]
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(31 downto 0);

-- err_MUX[rmii_eth_mac_h_l60_c5_7ab9]
signal err_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l60_c5_7ab9]
signal state_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output : unsigned(1 downto 0);

-- err_MUX[rmii_eth_mac_h_l63_c10_55e0]
signal err_MUX_rmii_eth_mac_h_l63_c10_55e0_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l63_c10_55e0]
signal state_MUX_rmii_eth_mac_h_l63_c10_55e0_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l71_c11_cc88]
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l71_c8_4f1f]
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l71_c8_4f1f]
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(1 downto 0);

-- valid_MUX[rmii_eth_mac_h_l71_c8_4f1f]
signal valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(0 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l71_c8_4f1f]
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(7 downto 0);

-- last_MUX[rmii_eth_mac_h_l71_c8_4f1f]
signal last_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l71_c8_4f1f]
signal state_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(1 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l71_c8_4f1f]
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l72_c5_cf82]
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(2 downto 0);

-- valid_MUX[rmii_eth_mac_h_l72_c5_cf82]
signal valid_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(0 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l72_c5_cf82]
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(7 downto 0);

-- last_MUX[rmii_eth_mac_h_l72_c5_cf82]
signal last_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l72_c5_cf82]
signal state_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(1 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l75_c7_0678]
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_return_output : unsigned(2 downto 0);

-- last_MUX[rmii_eth_mac_h_l75_c7_0678]
signal last_MUX_rmii_eth_mac_h_l75_c7_0678_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_0678_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l75_c7_0678]
signal state_MUX_rmii_eth_mac_h_l75_c7_0678_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_0678_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[rmii_eth_mac_h_l82_c13_6fe8]
signal UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l82_c9_f48c]
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output : unsigned(2 downto 0);

-- last_MUX[rmii_eth_mac_h_l82_c9_f48c]
signal last_MUX_rmii_eth_mac_h_l82_c9_f48c_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l82_c9_f48c]
signal state_MUX_rmii_eth_mac_h_l82_c9_f48c_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l89_c9_6cb5]
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l93_c11_8307]
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l93_c8_33ec]
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l93_c8_33ec]
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l93_c8_33ec]
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(7 downto 0);

-- state_MUX[rmii_eth_mac_h_l93_c8_33ec]
signal state_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(1 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l93_c8_33ec]
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(31 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l96_c44_0b0c]
signal CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_x : unsigned(31 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l98_c5_e9cd]
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l98_c5_e9cd]
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output : unsigned(1 downto 0);

-- state_MUX[rmii_eth_mac_h_l98_c5_e9cd]
signal state_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l99_c10_d611]
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l99_c7_bb7a]
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output : unsigned(1 downto 0);

-- state_MUX[rmii_eth_mac_h_l99_c7_bb7a]
signal state_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l103_c9_9b2b]
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l108_c7_a1a2]
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_return_output : unsigned(3 downto 0);

function uint8_7_2( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(5 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 2)));
return return_output;
end function;

function uint2_uint6( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(1 downto 0);
  --variable y : unsigned(5 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function uint2_uint30( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(1 downto 0);
  --variable y : unsigned(29 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return rmii_rx_mac_t is
 
  variable base : rmii_rx_mac_t; 
  variable return_output : rmii_rx_mac_t;
begin
      base.rx_mac_axis_out.data.tdata(0) := ref_toks_0;
      base.rx_mac_axis_out.data.tlast := ref_toks_1;
      base.rx_mac_axis_out.data.tkeep(0) := ref_toks_2;
      base.rx_mac_axis_out.valid := ref_toks_3;
      base.rx_mac_error := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_uint2_t_20_uint2_t_20_a609( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned;
 ref_toks_14 : unsigned;
 ref_toks_15 : unsigned;
 ref_toks_16 : unsigned;
 ref_toks_17 : unsigned;
 ref_toks_18 : unsigned;
 ref_toks_19 : unsigned) return uint2_t_20 is
 
  variable base : uint2_t_20; 
  variable return_output : uint2_t_20;
begin
      base(19) := ref_toks_0;
      base(18) := ref_toks_1;
      base(17) := ref_toks_2;
      base(16) := ref_toks_3;
      base(15) := ref_toks_4;
      base(14) := ref_toks_5;
      base(13) := ref_toks_6;
      base(12) := ref_toks_7;
      base(11) := ref_toks_8;
      base(10) := ref_toks_9;
      base(9) := ref_toks_10;
      base(8) := ref_toks_11;
      base(7) := ref_toks_12;
      base(6) := ref_toks_13;
      base(5) := ref_toks_14;
      base(4) := ref_toks_15;
      base(3) := ref_toks_16;
      base(2) := ref_toks_17;
      base(1) := ref_toks_18;
      base(0) := ref_toks_19;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_uint1_t_20_uint1_t_20_a609( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned;
 ref_toks_14 : unsigned;
 ref_toks_15 : unsigned;
 ref_toks_16 : unsigned;
 ref_toks_17 : unsigned;
 ref_toks_18 : unsigned;
 ref_toks_19 : unsigned) return uint1_t_20 is
 
  variable base : uint1_t_20; 
  variable return_output : uint1_t_20;
begin
      base(19) := ref_toks_0;
      base(18) := ref_toks_1;
      base(17) := ref_toks_2;
      base(16) := ref_toks_3;
      base(15) := ref_toks_4;
      base(14) := ref_toks_5;
      base(13) := ref_toks_6;
      base(12) := ref_toks_7;
      base(11) := ref_toks_8;
      base(10) := ref_toks_9;
      base(9) := ref_toks_10;
      base(8) := ref_toks_11;
      base(7) := ref_toks_12;
      base(6) := ref_toks_13;
      base(5) := ref_toks_14;
      base(4) := ref_toks_15;
      base(3) := ref_toks_16;
      base(2) := ref_toks_17;
      base(1) := ref_toks_18;
      base(0) := ref_toks_19;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_left,
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_right,
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_left,
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_right,
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_left,
BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_right,
BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_left,
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_right,
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_left,
BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_right,
BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_left,
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_right,
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output);

-- valid_MUX_rmii_eth_mac_h_l48_c3_466c : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l48_c3_466c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l48_c3_466c_cond,
valid_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue,
valid_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse,
valid_MUX_rmii_eth_mac_h_l48_c3_466c_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output);

-- err_MUX_rmii_eth_mac_h_l48_c3_466c : 0 clocks latency
err_MUX_rmii_eth_mac_h_l48_c3_466c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l48_c3_466c_cond,
err_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue,
err_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse,
err_MUX_rmii_eth_mac_h_l48_c3_466c_return_output);

-- last_MUX_rmii_eth_mac_h_l48_c3_466c : 0 clocks latency
last_MUX_rmii_eth_mac_h_l48_c3_466c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l48_c3_466c_cond,
last_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue,
last_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse,
last_MUX_rmii_eth_mac_h_l48_c3_466c_return_output);

-- state_MUX_rmii_eth_mac_h_l48_c3_466c : 0 clocks latency
state_MUX_rmii_eth_mac_h_l48_c3_466c : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l48_c3_466c_cond,
state_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue,
state_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse,
state_MUX_rmii_eth_mac_h_l48_c3_466c_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output);

-- err_MUX_rmii_eth_mac_h_l54_c5_0347 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l54_c5_0347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l54_c5_0347_cond,
err_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue,
err_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse,
err_MUX_rmii_eth_mac_h_l54_c5_0347_return_output);

-- state_MUX_rmii_eth_mac_h_l54_c5_0347 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l54_c5_0347 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l54_c5_0347_cond,
state_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue,
state_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse,
state_MUX_rmii_eth_mac_h_l54_c5_0347_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_left,
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_right,
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output);

-- valid_MUX_rmii_eth_mac_h_l59_c8_d27c : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l59_c8_d27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l59_c8_d27c_cond,
valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue,
valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse,
valid_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output);

-- err_MUX_rmii_eth_mac_h_l59_c8_d27c : 0 clocks latency
err_MUX_rmii_eth_mac_h_l59_c8_d27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l59_c8_d27c_cond,
err_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue,
err_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse,
err_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output);

-- last_MUX_rmii_eth_mac_h_l59_c8_d27c : 0 clocks latency
last_MUX_rmii_eth_mac_h_l59_c8_d27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l59_c8_d27c_cond,
last_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue,
last_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse,
last_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output);

-- state_MUX_rmii_eth_mac_h_l59_c8_d27c : 0 clocks latency
state_MUX_rmii_eth_mac_h_l59_c8_d27c : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l59_c8_d27c_cond,
state_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue,
state_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse,
state_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output);

-- err_MUX_rmii_eth_mac_h_l60_c5_7ab9 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l60_c5_7ab9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond,
err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue,
err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse,
err_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output);

-- state_MUX_rmii_eth_mac_h_l60_c5_7ab9 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l60_c5_7ab9 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond,
state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue,
state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse,
state_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output);

-- err_MUX_rmii_eth_mac_h_l63_c10_55e0 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l63_c10_55e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l63_c10_55e0_cond,
err_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue,
err_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse,
err_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output);

-- state_MUX_rmii_eth_mac_h_l63_c10_55e0 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l63_c10_55e0 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l63_c10_55e0_cond,
state_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue,
state_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse,
state_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_left,
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_right,
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output);

-- valid_MUX_rmii_eth_mac_h_l71_c8_4f1f : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l71_c8_4f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond,
valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue,
valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse,
valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output);

-- last_MUX_rmii_eth_mac_h_l71_c8_4f1f : 0 clocks latency
last_MUX_rmii_eth_mac_h_l71_c8_4f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond,
last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue,
last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse,
last_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output);

-- state_MUX_rmii_eth_mac_h_l71_c8_4f1f : 0 clocks latency
state_MUX_rmii_eth_mac_h_l71_c8_4f1f : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond,
state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue,
state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse,
state_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_cond,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output);

-- valid_MUX_rmii_eth_mac_h_l72_c5_cf82 : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l72_c5_cf82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l72_c5_cf82_cond,
valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue,
valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse,
valid_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_cond,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output);

-- last_MUX_rmii_eth_mac_h_l72_c5_cf82 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l72_c5_cf82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l72_c5_cf82_cond,
last_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue,
last_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse,
last_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output);

-- state_MUX_rmii_eth_mac_h_l72_c5_cf82 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l72_c5_cf82 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l72_c5_cf82_cond,
state_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue,
state_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse,
state_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_cond,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_return_output);

-- last_MUX_rmii_eth_mac_h_l75_c7_0678 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l75_c7_0678 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l75_c7_0678_cond,
last_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue,
last_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse,
last_MUX_rmii_eth_mac_h_l75_c7_0678_return_output);

-- state_MUX_rmii_eth_mac_h_l75_c7_0678 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l75_c7_0678 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l75_c7_0678_cond,
state_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue,
state_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse,
state_MUX_rmii_eth_mac_h_l75_c7_0678_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_expr,
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_cond,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output);

-- last_MUX_rmii_eth_mac_h_l82_c9_f48c : 0 clocks latency
last_MUX_rmii_eth_mac_h_l82_c9_f48c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l82_c9_f48c_cond,
last_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue,
last_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse,
last_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output);

-- state_MUX_rmii_eth_mac_h_l82_c9_f48c : 0 clocks latency
state_MUX_rmii_eth_mac_h_l82_c9_f48c : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l82_c9_f48c_cond,
state_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue,
state_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse,
state_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5 : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5 : entity work.BIN_OP_PLUS_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_left,
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_right,
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_left,
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_right,
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output);

-- state_MUX_rmii_eth_mac_h_l93_c8_33ec : 0 clocks latency
state_MUX_rmii_eth_mac_h_l93_c8_33ec : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l93_c8_33ec_cond,
state_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue,
state_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse,
state_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c : entity work.CONST_SR_2_uint32_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_x,
CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output);

-- state_MUX_rmii_eth_mac_h_l98_c5_e9cd : 0 clocks latency
state_MUX_rmii_eth_mac_h_l98_c5_e9cd : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond,
state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue,
state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse,
state_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_left,
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_right,
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output);

-- state_MUX_rmii_eth_mac_h_l99_c7_bb7a : 0 clocks latency
state_MUX_rmii_eth_mac_h_l99_c7_bb7a : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond,
state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue,
state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse,
state_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_left,
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_right,
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2 : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2 : entity work.BIN_OP_PLUS_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_left,
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_right,
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 data_in,
 data_in_valid,
 -- Registers
 data_in_regs,
 data_in_valid_regs,
 data_out_reg,
 state,
 bit_counter,
 byte_counter,
 fcs_reg,
 -- All submodule outputs
 BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
 valid_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
 err_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
 last_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
 state_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
 err_MUX_rmii_eth_mac_h_l54_c5_0347_return_output,
 state_MUX_rmii_eth_mac_h_l54_c5_0347_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output,
 valid_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output,
 err_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output,
 last_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output,
 state_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output,
 err_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output,
 state_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output,
 err_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output,
 state_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output,
 valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output,
 last_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output,
 state_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output,
 valid_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output,
 last_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output,
 state_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_return_output,
 last_MUX_rmii_eth_mac_h_l75_c7_0678_return_output,
 state_MUX_rmii_eth_mac_h_l75_c7_0678_return_output,
 UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output,
 last_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output,
 state_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output,
 state_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output,
 CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output,
 state_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output,
 state_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : rmii_rx_mac_t;
 variable VAR_data_in : unsigned(1 downto 0);
 variable VAR_data_in_valid : unsigned(0 downto 0);
 variable VAR_last : unsigned(0 downto 0);
 variable VAR_valid : unsigned(0 downto 0);
 variable VAR_err : unsigned(0 downto 0);
 variable VAR_data_in_delayed : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_d173_return_output : unsigned(1 downto 0);
 variable VAR_data_in_valid_delayed : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_21ae_return_output : unsigned(0 downto 0);
 variable VAR_o : rmii_rx_mac_t;
 variable VAR_bit_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output : unsigned(0 downto 0);
 variable VAR_preamble_bits : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output : unsigned(0 downto 0);
 variable VAR_sfd_bits : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l52_c5_9be5 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_rmii_eth_mac_h_l51_c5_fbd1 : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_rmii_eth_mac_h_l53_c5_0ba2 : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_47bc_return_output : unsigned(5 downto 0);
 variable VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_55cd_return_output : unsigned(7 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l89_c9_9bd3 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l76_c9_0dc3 : unsigned(2 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l84_c11_05e6 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_rmii_eth_mac_h_l97_c5_1188 : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_x : unsigned(31 downto 0);
 variable VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_0c70_return_output : unsigned(31 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l105_c7_a276 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l108_c7_227c : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_return_output : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_rmii_eth_mac_h_l101_c9_7482 : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_rmii_eth_mac_h_l103_c9_5f98 : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_return_output : unsigned(3 downto 0);
 variable VAR_ARRAY_SHIFT_UP_i : unsigned(31 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_1741_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_8d41_return_output : rmii_rx_mac_t;
 variable VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_4a4e_return_output : uint2_t_20;
 variable VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_4a4e_return_output : uint1_t_20;
 -- State registers comb logic variables
variable REG_VAR_data_in_regs : uint2_t_20;
variable REG_VAR_data_in_valid_regs : uint1_t_20;
variable REG_VAR_data_out_reg : unsigned(7 downto 0);
variable REG_VAR_state : unsigned(1 downto 0);
variable REG_VAR_bit_counter : unsigned(2 downto 0);
variable REG_VAR_byte_counter : unsigned(1 downto 0);
variable REG_VAR_fcs_reg : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_data_in_regs := data_in_regs;
  REG_VAR_data_in_valid_regs := data_in_valid_regs;
  REG_VAR_data_out_reg := data_out_reg;
  REG_VAR_state := state;
  REG_VAR_bit_counter := bit_counter;
  REG_VAR_byte_counter := byte_counter;
  REG_VAR_fcs_reg := fcs_reg;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue := to_unsigned(1, 1);
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(FCS));
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse := to_unsigned(0, 1);
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_data_out_reg_rmii_eth_mac_h_l51_c5_fbd1 := resize(to_unsigned(0, 1), 8);
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue := VAR_data_out_reg_rmii_eth_mac_h_l51_c5_fbd1;
     VAR_bit_counter_rmii_eth_mac_h_l105_c7_a276 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue := VAR_bit_counter_rmii_eth_mac_h_l105_c7_a276;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue := to_unsigned(0, 1);
     VAR_bit_counter_rmii_eth_mac_h_l84_c11_05e6 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue := VAR_bit_counter_rmii_eth_mac_h_l84_c11_05e6;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_right := to_unsigned(1, 2);
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_right := to_unsigned(2, 2);
     VAR_bit_counter_rmii_eth_mac_h_l76_c9_0dc3 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse := VAR_bit_counter_rmii_eth_mac_h_l76_c9_0dc3;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_right := unsigned(rmii_rx_mac_state_t_to_slv(FCS));
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_right := to_unsigned(3, 2);
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue := to_unsigned(0, 1);
     VAR_data_out_reg_rmii_eth_mac_h_l97_c5_1188 := resize(to_unsigned(0, 1), 8);
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue := VAR_data_out_reg_rmii_eth_mac_h_l97_c5_1188;
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_right := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_right := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_right := to_unsigned(6, 3);
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue := to_unsigned(0, 1);
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse := to_unsigned(0, 1);
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse := to_unsigned(0, 1);
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(DATA));
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_right := to_unsigned(2, 2);
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_bit_counter_rmii_eth_mac_h_l52_c5_9be5 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue := VAR_bit_counter_rmii_eth_mac_h_l52_c5_9be5;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_right := to_unsigned(3, 2);
     VAR_fcs_reg_rmii_eth_mac_h_l53_c5_0ba2 := resize(to_unsigned(0, 1), 32);
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue := VAR_fcs_reg_rmii_eth_mac_h_l53_c5_0ba2;
     VAR_byte_counter_rmii_eth_mac_h_l101_c9_7482 := resize(to_unsigned(0, 1), 2);
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue := VAR_byte_counter_rmii_eth_mac_h_l101_c9_7482;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_right := unsigned(rmii_rx_mac_state_t_to_slv(DATA));

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_data_in := data_in;
     VAR_data_in_valid := data_in_valid;

     -- Submodule level 0
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_left := bit_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_left := bit_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_left := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_left := byte_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_left := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse := byte_counter;
     VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_expr := VAR_data_in_valid;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue := data_out_reg;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse := data_out_reg;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse := data_out_reg;
     VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_x := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse := fcs_reg;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_left := state;
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse := state;
     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(15);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(5);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(0);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(15);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(1);

     -- BIN_OP_EQ[rmii_eth_mac_h_l43_c22_3cba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_left;
     BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output := BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(8);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(6);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(3);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(0);

     -- BIN_OP_EQ[rmii_eth_mac_h_l59_c11_0ad8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_left;
     BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output := BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output;

     -- BIN_OP_PLUS[rmii_eth_mac_h_l89_c9_6cb5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(17);

     -- CONST_REF_RD_uint1_t_uint1_t_20_19_d41d[rmii_eth_mac_h_l35_c35_21ae] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_21ae_return_output := data_in_valid_regs(19);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(3);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(1);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l108_c7_a1a2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(13);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(4);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(8);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(2);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(10);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(4);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(6);

     -- CONST_SR_2[rmii_eth_mac_h_l96_c44_0b0c] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_return_output := CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(7);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(2);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(14);

     -- BIN_OP_EQ[rmii_eth_mac_h_l71_c11_cc88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_left;
     BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output := BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output;

     -- CONST_REF_RD_uint2_t_uint2_t_20_19_d41d[rmii_eth_mac_h_l34_c29_d173] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_d173_return_output := data_in_regs(19);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(16);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l103_c9_9b2b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(11);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(18);

     -- uint8_7_2[rmii_eth_mac_h_l73_c50_47bc] LATENCY=0
     VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_47bc_return_output := uint8_7_2(
     data_out_reg);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(12);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(7);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(9);

     -- BIN_OP_EQ[rmii_eth_mac_h_l48_c6_8709] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_left;
     BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output := BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(5);

     -- BIN_OP_EQ[rmii_eth_mac_h_l99_c10_d611] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_left;
     BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_return_output := BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(13);

     -- BIN_OP_EQ[rmii_eth_mac_h_l93_c11_8307] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_left;
     BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output := BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(10);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(12);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(16);

     -- UNARY_OP_NOT[rmii_eth_mac_h_l82_c13_6fe8] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_return_output := UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(11);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(14);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(18);

     -- FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d[rmii_eth_mac_h_l113_c140_1741] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_1741_return_output := data_in_regs(9);

     -- FOR_rmii_eth_mac_h_l114_c30_8767_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d[rmii_eth_mac_h_l114_c146_8a01] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output := data_in_valid_regs(17);

     -- Submodule level 1
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_3cba_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_8709_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_0ad8_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_cc88_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_8307_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_d611_return_output;
     VAR_byte_counter_rmii_eth_mac_h_l103_c9_5f98 := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_9b2b_return_output, 2);
     VAR_bit_counter_rmii_eth_mac_h_l108_c7_227c := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_a1a2_return_output, 3);
     VAR_bit_counter_rmii_eth_mac_h_l89_c9_9bd3 := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_6cb5_return_output, 3);
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_left := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_21ae_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_left := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_21ae_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_21ae_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_21ae_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_21ae_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_21ae_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_21ae_return_output;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_left := VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_d173_return_output;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_left := VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_d173_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_6fe8_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse := VAR_bit_counter_rmii_eth_mac_h_l108_c7_227c;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse := VAR_bit_counter_rmii_eth_mac_h_l89_c9_9bd3;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse := VAR_byte_counter_rmii_eth_mac_h_l103_c9_5f98;
     -- bit_counter_MUX[rmii_eth_mac_h_l82_c9_f48c] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_cond;
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output := bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l44_c53_f5f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_left;
     BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_return_output := BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_return_output;

     -- data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609[rmii_eth_mac_h_l17_c15_4a4e] LATENCY=0
     VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_4a4e_return_output := CONST_REF_RD_uint1_t_20_uint1_t_20_a609(
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_8767_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_8a01_return_output,
     VAR_data_in_valid);

     -- state_MUX[rmii_eth_mac_h_l82_c9_f48c] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l82_c9_f48c_cond <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_cond;
     state_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue;
     state_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output := state_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l45_c48_d1c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_left;
     BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_return_output := BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_return_output;

     -- uint2_uint30[rmii_eth_mac_h_l96_c15_0c70] LATENCY=0
     VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_0c70_return_output := uint2_uint30(
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_d173_return_output,
     resize(VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_0b0c_return_output, 30));

     -- byte_counter_MUX[rmii_eth_mac_h_l99_c7_bb7a] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond;
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output := byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output;

     -- state_MUX[rmii_eth_mac_h_l99_c7_bb7a] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_cond;
     state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iftrue;
     state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output := state_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output;

     -- data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609[rmii_eth_mac_h_l17_c15_4a4e] LATENCY=0
     VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_4a4e_return_output := CONST_REF_RD_uint2_t_20_uint2_t_20_a609(
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_1fc7_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_1741_return_output,
     VAR_data_in);

     -- valid_MUX[rmii_eth_mac_h_l72_c5_cf82] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l72_c5_cf82_cond <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_cond;
     valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue;
     valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output := valid_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l98_c5_e9cd] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond;
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output := bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output;

     -- uint2_uint6[rmii_eth_mac_h_l73_c22_55cd] LATENCY=0
     VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_55cd_return_output := uint2_uint6(
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_d173_return_output,
     VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_47bc_return_output);

     -- last_MUX[rmii_eth_mac_h_l82_c9_f48c] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l82_c9_f48c_cond <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_cond;
     last_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_iftrue;
     last_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output := last_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l93_c8_33ec] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output := data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;

     -- Submodule level 2
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_right := VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_f5f5_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_right := VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d1c6_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue := VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output;
     REG_VAR_data_in_regs := VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_4a4e_return_output;
     REG_VAR_data_in_valid_regs := VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_4a4e_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue := VAR_last_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue := VAR_state_MUX_rmii_eth_mac_h_l82_c9_f48c_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue := VAR_state_MUX_rmii_eth_mac_h_l99_c7_bb7a_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue := VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_0c70_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue := VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_55cd_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue := VAR_valid_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;
     -- bit_counter_MUX[rmii_eth_mac_h_l93_c8_33ec] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond;
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output := bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l75_c7_0678] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_cond;
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_return_output := bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l93_c8_33ec] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output := fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;

     -- last_MUX[rmii_eth_mac_h_l75_c7_0678] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l75_c7_0678_cond <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_cond;
     last_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue;
     last_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_return_output := last_MUX_rmii_eth_mac_h_l75_c7_0678_return_output;

     -- state_MUX[rmii_eth_mac_h_l98_c5_e9cd] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond;
     state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue;
     state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output := state_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l44_c28_f2ef] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_left;
     BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output := BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l72_c5_cf82] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output := data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l45_c23_ab81] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_left;
     BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_return_output := BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_return_output;

     -- state_MUX[rmii_eth_mac_h_l75_c7_0678] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l75_c7_0678_cond <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_cond;
     state_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_iftrue;
     state_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_return_output := state_MUX_rmii_eth_mac_h_l75_c7_0678_return_output;

     -- valid_MUX[rmii_eth_mac_h_l71_c8_4f1f] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond;
     valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue;
     valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output := valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l98_c5_e9cd] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_cond;
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output := byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output;

     -- Submodule level 3
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_f2ef_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_ab81_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_0678_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue := VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue := VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue := VAR_last_MUX_rmii_eth_mac_h_l75_c7_0678_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue := VAR_state_MUX_rmii_eth_mac_h_l75_c7_0678_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue := VAR_state_MUX_rmii_eth_mac_h_l98_c5_e9cd_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse := VAR_valid_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;
     -- valid_MUX[rmii_eth_mac_h_l59_c8_d27c] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l59_c8_d27c_cond <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_cond;
     valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue;
     valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output := valid_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l71_c8_4f1f] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output := fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;

     -- state_MUX[rmii_eth_mac_h_l93_c8_33ec] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l93_c8_33ec_cond <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_cond;
     state_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue;
     state_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output := state_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;

     -- last_MUX[rmii_eth_mac_h_l72_c5_cf82] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l72_c5_cf82_cond <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_cond;
     last_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue;
     last_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output := last_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;

     -- state_MUX[rmii_eth_mac_h_l72_c5_cf82] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l72_c5_cf82_cond <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_cond;
     state_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue;
     state_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output := state_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;

     -- err_MUX[rmii_eth_mac_h_l63_c10_55e0] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l63_c10_55e0_cond <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_cond;
     err_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue;
     err_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output := err_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output;

     -- state_MUX[rmii_eth_mac_h_l54_c5_0347] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l54_c5_0347_cond <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_cond;
     state_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue;
     state_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_return_output := state_MUX_rmii_eth_mac_h_l54_c5_0347_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l72_c5_cf82] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_cond;
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output := bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;

     -- state_MUX[rmii_eth_mac_h_l63_c10_55e0] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l63_c10_55e0_cond <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_cond;
     state_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_iftrue;
     state_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output := state_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l93_c8_33ec] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_cond;
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output := byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;

     -- err_MUX[rmii_eth_mac_h_l54_c5_0347] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l54_c5_0347_cond <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_cond;
     err_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_iftrue;
     err_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_return_output := err_MUX_rmii_eth_mac_h_l54_c5_0347_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l71_c8_4f1f] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output := data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;

     -- Submodule level 4
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue := VAR_err_MUX_rmii_eth_mac_h_l54_c5_0347_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse := VAR_err_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue := VAR_last_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue := VAR_state_MUX_rmii_eth_mac_h_l54_c5_0347_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse := VAR_state_MUX_rmii_eth_mac_h_l63_c10_55e0_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue := VAR_state_MUX_rmii_eth_mac_h_l72_c5_cf82_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse := VAR_state_MUX_rmii_eth_mac_h_l93_c8_33ec_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse := VAR_valid_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;
     -- bit_counter_MUX[rmii_eth_mac_h_l71_c8_4f1f] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond;
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output := bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;

     -- valid_MUX[rmii_eth_mac_h_l48_c3_466c] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l48_c3_466c_cond <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_cond;
     valid_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue;
     valid_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_return_output := valid_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;

     -- err_MUX[rmii_eth_mac_h_l60_c5_7ab9] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond;
     err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue;
     err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output := err_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output;

     -- last_MUX[rmii_eth_mac_h_l71_c8_4f1f] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond;
     last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue;
     last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output := last_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l59_c8_d27c] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output := data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l59_c8_d27c] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output := fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;

     -- state_MUX[rmii_eth_mac_h_l60_c5_7ab9] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_cond;
     state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iftrue;
     state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output := state_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l71_c8_4f1f] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond;
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output := byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;

     -- state_MUX[rmii_eth_mac_h_l71_c8_4f1f] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_cond;
     state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iftrue;
     state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output := state_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;

     -- Submodule level 5
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue := VAR_err_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse := VAR_last_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue := VAR_state_MUX_rmii_eth_mac_h_l60_c5_7ab9_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse := VAR_state_MUX_rmii_eth_mac_h_l71_c8_4f1f_return_output;
     -- last_MUX[rmii_eth_mac_h_l59_c8_d27c] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l59_c8_d27c_cond <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_cond;
     last_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue;
     last_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output := last_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l59_c8_d27c] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond;
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output := byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;

     -- state_MUX[rmii_eth_mac_h_l59_c8_d27c] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l59_c8_d27c_cond <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_cond;
     state_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue;
     state_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output := state_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l48_c3_466c] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output := fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l59_c8_d27c] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_cond;
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output := bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l48_c3_466c] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output := data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;

     -- err_MUX[rmii_eth_mac_h_l59_c8_d27c] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l59_c8_d27c_cond <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_cond;
     err_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_iftrue;
     err_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output := err_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;

     -- Submodule level 6
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;
     REG_VAR_data_out_reg := VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse := VAR_err_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;
     REG_VAR_fcs_reg := VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse := VAR_last_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse := VAR_state_MUX_rmii_eth_mac_h_l59_c8_d27c_return_output;
     -- state_MUX[rmii_eth_mac_h_l48_c3_466c] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l48_c3_466c_cond <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_cond;
     state_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue;
     state_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_return_output := state_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l48_c3_466c] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond;
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output := bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;

     -- err_MUX[rmii_eth_mac_h_l48_c3_466c] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l48_c3_466c_cond <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_cond;
     err_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue;
     err_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_return_output := err_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l48_c3_466c] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_cond;
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output := byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;

     -- last_MUX[rmii_eth_mac_h_l48_c3_466c] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l48_c3_466c_cond <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_cond;
     last_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_iftrue;
     last_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_return_output := last_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;

     -- Submodule level 7
     REG_VAR_bit_counter := VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;
     REG_VAR_byte_counter := VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;
     REG_VAR_state := VAR_state_MUX_rmii_eth_mac_h_l48_c3_466c_return_output;
     -- CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4[rmii_eth_mac_h_l123_c10_8d41] LATENCY=0
     VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_8d41_return_output := CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4(
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_466c_return_output,
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_466c_return_output);

     -- Submodule level 8
     VAR_return_output := VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_8d41_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_data_in_regs <= REG_VAR_data_in_regs;
REG_COMB_data_in_valid_regs <= REG_VAR_data_in_valid_regs;
REG_COMB_data_out_reg <= REG_VAR_data_out_reg;
REG_COMB_state <= REG_VAR_state;
REG_COMB_bit_counter <= REG_VAR_bit_counter;
REG_COMB_byte_counter <= REG_VAR_byte_counter;
REG_COMB_fcs_reg <= REG_VAR_fcs_reg;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     data_in_regs <= REG_COMB_data_in_regs;
     data_in_valid_regs <= REG_COMB_data_in_valid_regs;
     data_out_reg <= REG_COMB_data_out_reg;
     state <= REG_COMB_state;
     bit_counter <= REG_COMB_bit_counter;
     byte_counter <= REG_COMB_byte_counter;
     fcs_reg <= REG_COMB_fcs_reg;
 end if;
 end if;
end process;

end arch;
