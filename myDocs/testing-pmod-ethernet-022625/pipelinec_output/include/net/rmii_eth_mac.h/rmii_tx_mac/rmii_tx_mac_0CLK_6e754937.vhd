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
-- Submodules: 80
entity rmii_tx_mac_0CLK_6e754937 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 axis_in : in axis8_t_stream_t;
 return_output : out rmii_tx_mac_t);
end rmii_tx_mac_0CLK_6e754937;
architecture arch of rmii_tx_mac_0CLK_6e754937 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal state : unsigned(2 downto 0) := unsigned(rmii_tx_mac_state_t_to_slv(rmii_tx_mac_state_t'left));
signal bit_counter : unsigned(5 downto 0) := to_unsigned(0, 6);
signal crc : unsigned(31 downto 0) := to_unsigned(0, 32);
signal crc_shift_reg : unsigned(31 downto 0) := to_unsigned(0, 32);
signal data_reg : unsigned(7 downto 0) := to_unsigned(0, 8);
signal last_byte_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
signal axis_in_data_reg : unsigned(7 downto 0) := to_unsigned(0, 8);
signal axis_in_data_reg_valid : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_state : unsigned(2 downto 0);
signal REG_COMB_bit_counter : unsigned(5 downto 0);
signal REG_COMB_crc : unsigned(31 downto 0);
signal REG_COMB_crc_shift_reg : unsigned(31 downto 0);
signal REG_COMB_data_reg : unsigned(7 downto 0);
signal REG_COMB_last_byte_reg : unsigned(0 downto 0);
signal REG_COMB_axis_in_data_reg : unsigned(7 downto 0);
signal REG_COMB_axis_in_data_reg_valid : unsigned(0 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_EQ[rmii_eth_mac_h_l158_c31_54c8]
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l159_c26_214d]
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l160_c32_44be]
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l167_c6_0674]
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l167_c3_7abf]
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(5 downto 0);

-- o_MUX[rmii_eth_mac_h_l167_c3_7abf]
signal o_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : rmii_tx_mac_t;

-- crc_shift_reg_MUX[rmii_eth_mac_h_l167_c3_7abf]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(31 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l167_c3_7abf]
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l167_c3_7abf]
signal state_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l167_c3_7abf]
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(7 downto 0);

-- reset_crc_MUX[rmii_eth_mac_h_l167_c3_7abf]
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l169_c5_a0a5]
signal state_MUX_rmii_eth_mac_h_l169_c5_a0a5_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_a0a5_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l173_c11_6389]
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l173_c8_d199]
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(5 downto 0);

-- o_MUX[rmii_eth_mac_h_l173_c8_d199]
signal o_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : rmii_tx_mac_t;

-- crc_shift_reg_MUX[rmii_eth_mac_h_l173_c8_d199]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(31 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l173_c8_d199]
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l173_c8_d199]
signal state_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l173_c8_d199]
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l176_c5_e0dd]
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l176_c5_e0dd]
signal state_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l184_c11_d16c]
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l184_c8_42a7]
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(5 downto 0);

-- o_MUX[rmii_eth_mac_h_l184_c8_42a7]
signal o_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : rmii_tx_mac_t;

-- crc_shift_reg_MUX[rmii_eth_mac_h_l184_c8_42a7]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(31 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l184_c8_42a7]
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l184_c8_42a7]
signal state_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l184_c8_42a7]
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l194_c11_1571]
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l194_c8_061e]
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(5 downto 0);

-- o_MUX[rmii_eth_mac_h_l194_c8_061e]
signal o_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : rmii_tx_mac_t;

-- crc_shift_reg_MUX[rmii_eth_mac_h_l194_c8_061e]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(31 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l194_c8_061e]
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l194_c8_061e]
signal state_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l194_c8_061e]
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l201_c38_eec7]
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l202_c5_59e0]
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(5 downto 0);

-- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l202_c5_59e0]
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(0 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l202_c5_59e0]
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l202_c5_59e0]
signal state_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l202_c5_59e0]
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l203_c7_45a3]
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(5 downto 0);

-- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l203_c7_45a3]
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(0 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l203_c7_45a3]
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l203_c7_45a3]
signal state_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l203_c7_45a3]
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(7 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l218_c18_3f62]
signal CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_x : unsigned(7 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l221_c11_5fda]
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l221_c8_2615]
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(5 downto 0);

-- o_tx_mac_output_valid_MUX[rmii_eth_mac_h_l221_c8_2615]
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(0 downto 0);

-- o_tx_mac_output_data_MUX[rmii_eth_mac_h_l221_c8_2615]
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(1 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(1 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(1 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l221_c8_2615]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l221_c8_2615]
signal state_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l226_c5_24d9]
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output : unsigned(5 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l226_c5_24d9]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l226_c5_24d9]
signal state_MUX_rmii_eth_mac_h_l226_c5_24d9_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output : unsigned(2 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l233_c23_196e]
signal CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_x : unsigned(31 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_return_output : unsigned(31 downto 0);

-- crc_MUX[rmii_eth_mac_h_l250_c3_55e1]
signal crc_MUX_rmii_eth_mac_h_l250_c3_55e1_cond : unsigned(0 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iftrue : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iffalse : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_55e1_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l251_c12_d410]
signal CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_x : unsigned(31 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_return_output : unsigned(31 downto 0);

-- CONST_SR_0[rmii_eth_mac_h_l251_c42_2af6]
signal CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_x : unsigned(7 downto 0);
signal CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l251_c35_40a6]
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_right : unsigned(7 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l251_c35_775d]
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_left : unsigned(31 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_right : unsigned(7 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_return_output : unsigned(31 downto 0);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l251_c24_de5b]
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_0 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_1 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_2 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_3 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_4 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_5 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_6 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_7 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_8 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_9 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_10 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_11 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_12 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_13 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_14 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_15 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_return_output : unsigned(31 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l251_c12_62f1]
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_right : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l252_c12_7448]
signal CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_x : unsigned(31 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l252_c42_11d2]
signal CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_x : unsigned(7 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l252_c35_f822]
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_right : unsigned(7 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l252_c35_464d]
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_left : unsigned(31 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_right : unsigned(7 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_return_output : unsigned(31 downto 0);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l252_c24_0420]
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_0 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_1 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_2 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_3 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_4 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_5 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_6 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_7 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_8 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_9 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_10 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_11 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_12 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_13 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_14 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_15 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_return_output : unsigned(31 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l252_c12_2e07]
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_right : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_return_output : unsigned(31 downto 0);

-- crc_MUX[rmii_eth_mac_h_l254_c3_fb76]
signal crc_MUX_rmii_eth_mac_h_l254_c3_fb76_cond : unsigned(0 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iftrue : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iffalse : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_fb76_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l258_c28_ea0c]
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_return_output : unsigned(6 downto 0);

function CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return rmii_tx_mac_t is
 
  variable base : rmii_tx_mac_t; 
  variable return_output : rmii_tx_mac_t;
begin
      base.tx_mac_output_data := ref_toks_0;
      base.tx_mac_output_valid := ref_toks_1;
      base.tx_mac_input_ready := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return rmii_tx_mac_t is
 
  variable base : rmii_tx_mac_t; 
  variable return_output : rmii_tx_mac_t;
begin
      base.tx_mac_input_ready := ref_toks_0;
      base.tx_mac_output_data := ref_toks_1;
      base.tx_mac_output_valid := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return rmii_tx_mac_t is
 
  variable base : rmii_tx_mac_t; 
  variable return_output : rmii_tx_mac_t;
begin
      base.tx_mac_output_valid := ref_toks_0;
      base.tx_mac_output_data := ref_toks_1;
      base.tx_mac_input_ready := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function uint8_1_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);
begin
return_output := unsigned(std_logic_vector(x(1 downto 0)));
return return_output;
end function;

function uint32_1_0( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(1 downto 0);
begin
return_output := unsigned(std_logic_vector(x(1 downto 0)));
return return_output;
end function;

function CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return rmii_tx_mac_t is
 
  variable base : rmii_tx_mac_t; 
  variable return_output : rmii_tx_mac_t;
begin
      base.tx_mac_input_ready := ref_toks_0;
      base.tx_mac_output_valid := ref_toks_1;
      base.tx_mac_output_data := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8 : entity work.BIN_OP_EQ_uint6_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_left,
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_right,
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d : entity work.BIN_OP_EQ_uint6_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_left,
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_right,
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_left,
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_right,
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_left,
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_right,
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_cond,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output);

-- o_MUX_rmii_eth_mac_h_l167_c3_7abf : 0 clocks latency
o_MUX_rmii_eth_mac_h_l167_c3_7abf : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l167_c3_7abf_cond,
o_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue,
o_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse,
o_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output);

-- state_MUX_rmii_eth_mac_h_l167_c3_7abf : 0 clocks latency
state_MUX_rmii_eth_mac_h_l167_c3_7abf : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l167_c3_7abf_cond,
state_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue,
state_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse,
state_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond,
data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue,
data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse,
data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output);

-- reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf : 0 clocks latency
reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_cond,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output);

-- state_MUX_rmii_eth_mac_h_l169_c5_a0a5 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l169_c5_a0a5 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l169_c5_a0a5_cond,
state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iftrue,
state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iffalse,
state_MUX_rmii_eth_mac_h_l169_c5_a0a5_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_left,
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_right,
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_cond,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_return_output);

-- o_MUX_rmii_eth_mac_h_l173_c8_d199 : 0 clocks latency
o_MUX_rmii_eth_mac_h_l173_c8_d199 : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l173_c8_d199_cond,
o_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue,
o_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse,
o_MUX_rmii_eth_mac_h_l173_c8_d199_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output);

-- state_MUX_rmii_eth_mac_h_l173_c8_d199 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l173_c8_d199 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l173_c8_d199_cond,
state_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue,
state_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse,
state_MUX_rmii_eth_mac_h_l173_c8_d199_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l173_c8_d199 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l173_c8_d199 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond,
data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue,
data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse,
data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output);

-- state_MUX_rmii_eth_mac_h_l176_c5_e0dd : 0 clocks latency
state_MUX_rmii_eth_mac_h_l176_c5_e0dd : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond,
state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue,
state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse,
state_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_left,
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_right,
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_cond,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output);

-- o_MUX_rmii_eth_mac_h_l184_c8_42a7 : 0 clocks latency
o_MUX_rmii_eth_mac_h_l184_c8_42a7 : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l184_c8_42a7_cond,
o_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue,
o_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse,
o_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output);

-- state_MUX_rmii_eth_mac_h_l184_c8_42a7 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l184_c8_42a7 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l184_c8_42a7_cond,
state_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue,
state_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse,
state_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond,
data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue,
data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse,
data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_left,
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_right,
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_cond,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_return_output);

-- o_MUX_rmii_eth_mac_h_l194_c8_061e : 0 clocks latency
o_MUX_rmii_eth_mac_h_l194_c8_061e : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l194_c8_061e_cond,
o_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue,
o_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse,
o_MUX_rmii_eth_mac_h_l194_c8_061e_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output);

-- state_MUX_rmii_eth_mac_h_l194_c8_061e : 0 clocks latency
state_MUX_rmii_eth_mac_h_l194_c8_061e : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l194_c8_061e_cond,
state_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue,
state_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse,
state_MUX_rmii_eth_mac_h_l194_c8_061e_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l194_c8_061e : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l194_c8_061e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond,
data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue,
data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse,
data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_left,
BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_right,
BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_cond,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output);

-- o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0 : 0 clocks latency
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_cond,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output);

-- state_MUX_rmii_eth_mac_h_l202_c5_59e0 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l202_c5_59e0 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l202_c5_59e0_cond,
state_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue,
state_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse,
state_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond,
data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue,
data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse,
data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_cond,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output);

-- o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3 : 0 clocks latency
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_cond,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output);

-- state_MUX_rmii_eth_mac_h_l203_c7_45a3 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l203_c7_45a3 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l203_c7_45a3_cond,
state_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue,
state_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse,
state_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond,
data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue,
data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse,
data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62 : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62 : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_x,
CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_left,
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_right,
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_cond,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_return_output);

-- o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615 : 0 clocks latency
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_cond,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_return_output);

-- o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615 : 0 clocks latency
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_cond,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_return_output);

-- state_MUX_rmii_eth_mac_h_l221_c8_2615 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l221_c8_2615 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l221_c8_2615_cond,
state_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue,
state_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse,
state_MUX_rmii_eth_mac_h_l221_c8_2615_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_cond,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output);

-- state_MUX_rmii_eth_mac_h_l226_c5_24d9 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l226_c5_24d9 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l226_c5_24d9_cond,
state_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue,
state_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse,
state_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l233_c23_196e : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l233_c23_196e : entity work.CONST_SR_2_uint32_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_x,
CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_return_output);

-- crc_MUX_rmii_eth_mac_h_l250_c3_55e1 : 0 clocks latency
crc_MUX_rmii_eth_mac_h_l250_c3_55e1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_MUX_rmii_eth_mac_h_l250_c3_55e1_cond,
crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iftrue,
crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iffalse,
crc_MUX_rmii_eth_mac_h_l250_c3_55e1_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l251_c12_d410 : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l251_c12_d410 : entity work.CONST_SR_4_uint32_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_x,
CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_return_output);

-- CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6 : 0 clocks latency
CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6 : entity work.CONST_SR_0_uint8_t_0CLK_de264c78 port map (
CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_x,
CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6 : entity work.BIN_OP_XOR_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_left,
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_right,
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d : entity work.BIN_OP_AND_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_left,
BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_right,
BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_return_output);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b : 0 clocks latency
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b : entity work.VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_0CLK_8bf83e3e port map (
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_1,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_2,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_3,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_4,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_5,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_6,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_7,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_8,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_9,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_10,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_11,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_12,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_13,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_14,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_15,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_var_dim_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1 : entity work.BIN_OP_XOR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_left,
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_right,
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l252_c12_7448 : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l252_c12_7448 : entity work.CONST_SR_4_uint32_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_x,
CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2 : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_x,
CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822 : entity work.BIN_OP_XOR_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_left,
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_right,
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d : entity work.BIN_OP_AND_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_left,
BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_right,
BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_return_output);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420 : 0 clocks latency
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420 : entity work.VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_0CLK_8bf83e3e port map (
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_1,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_2,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_3,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_4,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_5,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_6,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_7,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_8,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_9,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_10,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_11,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_12,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_13,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_14,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_15,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_var_dim_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07 : entity work.BIN_OP_XOR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_left,
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_right,
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_return_output);

-- crc_MUX_rmii_eth_mac_h_l254_c3_fb76 : 0 clocks latency
crc_MUX_rmii_eth_mac_h_l254_c3_fb76 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_MUX_rmii_eth_mac_h_l254_c3_fb76_cond,
crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iftrue,
crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iffalse,
crc_MUX_rmii_eth_mac_h_l254_c3_fb76_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_left,
BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_right,
BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_return_output);

-- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02 : 0 clocks latency
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02 : entity work.BIN_OP_PLUS_uint6_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_left,
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_right,
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 axis_in,
 -- Registers
 state,
 bit_counter,
 crc,
 crc_shift_reg,
 data_reg,
 last_byte_reg,
 axis_in_data_reg,
 axis_in_data_reg_valid,
 -- All submodule outputs
 BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output,
 o_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output,
 state_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output,
 data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output,
 reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output,
 state_MUX_rmii_eth_mac_h_l169_c5_a0a5_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_return_output,
 o_MUX_rmii_eth_mac_h_l173_c8_d199_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output,
 state_MUX_rmii_eth_mac_h_l173_c8_d199_return_output,
 data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output,
 state_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output,
 o_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output,
 state_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output,
 data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_return_output,
 o_MUX_rmii_eth_mac_h_l194_c8_061e_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output,
 state_MUX_rmii_eth_mac_h_l194_c8_061e_return_output,
 data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output,
 o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output,
 state_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output,
 data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output,
 o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output,
 state_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output,
 data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output,
 CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_return_output,
 o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_return_output,
 o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_return_output,
 state_MUX_rmii_eth_mac_h_l221_c8_2615_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output,
 state_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output,
 CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_return_output,
 crc_MUX_rmii_eth_mac_h_l250_c3_55e1_return_output,
 CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_return_output,
 CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_return_output,
 VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_return_output,
 CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_return_output,
 CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_return_output,
 VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_return_output,
 crc_MUX_rmii_eth_mac_h_l254_c3_fb76_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_return_output,
 BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : rmii_tx_mac_t;
 variable VAR_axis_in : axis8_t_stream_t;
 variable VAR_o : rmii_tx_mac_t;
 variable VAR_INC : unsigned(1 downto 0);
 variable VAR_preamble_ctr_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_return_output : unsigned(0 downto 0);
 variable VAR_fcs_ctr_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_return_output : unsigned(0 downto 0);
 variable VAR_last_bits_of_byte : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_23c6 : unsigned(1 downto 0);
 variable VAR_reset_crc : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_7abf_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_d199_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l178_c7_5e1b : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l181_c7_15ef : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l192_c5_6e25 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_42a7_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_061e_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : rmii_tx_mac_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870_rmii_eth_mac_h_l194_c8_061e_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_ddf2_return_output : unsigned(1 downto 0);
 variable VAR_last_bits_of_last_byte : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l217_c7_1a88 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l204_c9_e36d : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l212_c9_1683 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_return_output : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_cond : unsigned(0 downto 0);
 variable VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_14e7_return_output : unsigned(1 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l228_c7_3a12 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l232_c7_caf2 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_x : unsigned(31 downto 0);
 variable VAR_data_n : unsigned(7 downto 0);
 variable VAR_crc_table : uint32_t_16;
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iftrue : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iffalse : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_return_output : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_right : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_0 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_1 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_2 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_3 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_4 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_5 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_6 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_7 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_8 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_9 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_10 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_11 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_12 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_13 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_14 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_15 : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_return_output : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_right : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_0 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_1 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_2 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_3 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_4 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_5 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_6 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_7 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_8 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_9 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_10 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_11 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_12 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_13 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_14 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_15 : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iftrue : unsigned(31 downto 0);
 variable VAR_crc_rmii_eth_mac_h_l255_c5_714a : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iffalse : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_9b93_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_285a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_return_output : unsigned(6 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l189_l257_DUPLICATE_0b77_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_b945_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_state : unsigned(2 downto 0);
variable REG_VAR_bit_counter : unsigned(5 downto 0);
variable REG_VAR_crc : unsigned(31 downto 0);
variable REG_VAR_crc_shift_reg : unsigned(31 downto 0);
variable REG_VAR_data_reg : unsigned(7 downto 0);
variable REG_VAR_last_byte_reg : unsigned(0 downto 0);
variable REG_VAR_axis_in_data_reg : unsigned(7 downto 0);
variable REG_VAR_axis_in_data_reg_valid : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_state := state;
  REG_VAR_bit_counter := bit_counter;
  REG_VAR_crc := crc;
  REG_VAR_crc_shift_reg := crc_shift_reg;
  REG_VAR_data_reg := data_reg;
  REG_VAR_last_byte_reg := last_byte_reg;
  REG_VAR_axis_in_data_reg := axis_in_data_reg;
  REG_VAR_axis_in_data_reg_valid := axis_in_data_reg_valid;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_bit_counter_rmii_eth_mac_h_l212_c9_1683 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse := VAR_bit_counter_rmii_eth_mac_h_l212_c9_1683;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_6 := to_unsigned(1020740, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_6 := to_unsigned(1020740, 32);
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(SFD));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_3 := to_unsigned(1801765552, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_3 := to_unsigned(1801765552, 32);
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_right := to_unsigned(30, 5);
     VAR_bit_counter_rmii_eth_mac_h_l192_c5_6e25 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue := VAR_bit_counter_rmii_eth_mac_h_l192_c5_6e25;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_10 := unsigned'(X"9b6b51f4");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_10 := unsigned'(X"9b6b51f4");
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(FCS));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_right := unsigned(rmii_tx_mac_state_t_to_slv(DATA));
     VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_23c6 := resize(to_unsigned(0, 1), 2);
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse := VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_23c6;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue := to_unsigned(0, 1);
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse := to_unsigned(0, 1);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_4 := to_unsigned(996258700, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_4 := to_unsigned(996258700, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_2 := to_unsigned(1993593556, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_2 := to_unsigned(1993593556, 32);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_right := unsigned(rmii_tx_mac_state_t_to_slv(SFD));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_right := unsigned(rmii_tx_mac_state_t_to_slv(IDLE));
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(DATA));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_9 := unsigned'(X"bdb26158");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_9 := unsigned'(X"bdb26158");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_7 := to_unsigned(498631456, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_7 := to_unsigned(498631456, 32);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_right := unsigned(rmii_tx_mac_state_t_to_slv(PREAMBLE));
     VAR_bit_counter_rmii_eth_mac_h_l178_c7_5e1b := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue := VAR_bit_counter_rmii_eth_mac_h_l178_c7_5e1b;
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(PREAMBLE));
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_right := to_unsigned(2, 2);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_11 := unsigned'(X"86dc4190");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_11 := unsigned'(X"86dc4190");
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_right := to_unsigned(15, 8);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_13 := unsigned'(X"cb6e20c8");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_13 := unsigned'(X"cb6e20c8");
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_right := to_unsigned(6, 3);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_8 := unsigned'(X"a005713c");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_8 := unsigned'(X"a005713c");
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse := to_unsigned(1, 1);
     VAR_bit_counter_rmii_eth_mac_h_l204_c9_e36d := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue := VAR_bit_counter_rmii_eth_mac_h_l204_c9_e36d;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_right := unsigned(rmii_tx_mac_state_t_to_slv(FCS));
     VAR_crc_rmii_eth_mac_h_l255_c5_714a := resize(to_unsigned(0, 1), 32);
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iftrue := VAR_crc_rmii_eth_mac_h_l255_c5_714a;
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue := to_unsigned(1, 1);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_0 := to_unsigned(1304293916, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_0 := to_unsigned(1304293916, 32);
     VAR_bit_counter_rmii_eth_mac_h_l228_c7_3a12 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue := VAR_bit_counter_rmii_eth_mac_h_l228_c7_3a12;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_5 := to_unsigned(651600872, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_5 := to_unsigned(651600872, 32);
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(IDLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_right := to_unsigned(60, 6);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_14 := unsigned'(X"edb71064");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_14 := unsigned'(X"edb71064");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_15 := unsigned'(X"f0000000");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_15 := unsigned'(X"f0000000");
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse := to_unsigned(0, 1);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_1 := to_unsigned(1342890616, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_1 := to_unsigned(1342890616, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_12 := unsigned'(X"d6d930ac");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_12 := unsigned'(X"d6d930ac");
     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb[rmii_eth_mac_h_l173_c8_d199] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_d199_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb(
     to_unsigned(0, 1),
     to_unsigned(1, 2),
     to_unsigned(1, 1));

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd[rmii_eth_mac_h_l184_c8_42a7] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_42a7_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd(
     to_unsigned(1, 1),
     to_unsigned(3, 2),
     to_unsigned(1, 1));

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724[rmii_eth_mac_h_l167_c3_7abf] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_7abf_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724(
     VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_23c6,
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_42a7_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_d199_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_7abf_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_axis_in := axis_in;

     -- Submodule level 0
     VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_x := axis_in_data_reg;
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_x := axis_in_data_reg;
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_cond := axis_in_data_reg_valid;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_left := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_left := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_left := bit_counter;
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_left := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse := bit_counter;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_left := crc;
     VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_x := crc;
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iffalse := crc;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue := crc;
     VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_x := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue := crc_shift_reg;
     VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_x := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue := data_reg;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_right := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue := last_byte_reg;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_left := state;
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse := state;
     -- uint8_1_0[rmii_eth_mac_h_l196_c28_ddf2] LATENCY=0
     VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_ddf2_return_output := uint8_1_0(
     data_reg);

     -- BIN_OP_EQ[rmii_eth_mac_h_l221_c11_5fda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_left;
     BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output := BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output;

     -- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_left <= VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_left;
     BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_right <= VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_return_output := BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_return_output;

     -- CONST_SR_0[rmii_eth_mac_h_l251_c42_2af6] LATENCY=0
     -- Inputs
     CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_x <= VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_x;
     -- Outputs
     VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_return_output := CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_return_output;

     -- CONST_SR_4[rmii_eth_mac_h_l252_c42_11d2] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_return_output := CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_285a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_285a_return_output := VAR_axis_in.valid;

     -- BIN_OP_EQ[rmii_eth_mac_h_l158_c31_54c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_left;
     BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_return_output := BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l167_c6_0674] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_left;
     BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output := BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_b945 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_b945_return_output := VAR_axis_in.data.tlast;

     -- BIN_OP_EQ[rmii_eth_mac_h_l159_c26_214d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_left;
     BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_return_output := BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l184_c11_d16c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_left;
     BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output := BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output;

     -- CONST_SR_2[rmii_eth_mac_h_l218_c18_3f62] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_return_output := CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_return_output;

     -- CONST_SR_4[rmii_eth_mac_h_l251_c12_d410] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_return_output := CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_return_output;

     -- CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l189_l257_DUPLICATE_0b77 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l189_l257_DUPLICATE_0b77_return_output := VAR_axis_in.data.tdata(0);

     -- BIN_OP_EQ[rmii_eth_mac_h_l160_c32_44be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_left;
     BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output := BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output;

     -- uint32_1_0[rmii_eth_mac_h_l223_c28_14e7] LATENCY=0
     VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_14e7_return_output := uint32_1_0(
     crc_shift_reg);

     -- CONST_SR_2[rmii_eth_mac_h_l233_c23_196e] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_return_output := CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l194_c11_1571] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_left;
     BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output := BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l173_c11_6389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_left;
     BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output := BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output;

     -- Submodule level 1
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_54c8_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_214d_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_left := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_44be_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output;
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_0674_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_6389_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_d16c_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_1571_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output;
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output;
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_5fda_return_output;
     VAR_bit_counter_rmii_eth_mac_h_l181_c7_15ef := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_return_output, 6);
     VAR_bit_counter_rmii_eth_mac_h_l217_c7_1a88 := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_return_output, 6);
     VAR_bit_counter_rmii_eth_mac_h_l232_c7_caf2 := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l181_l217_DUPLICATE_8d02_return_output, 6);
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_b945_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_b945_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_285a_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_285a_return_output;
     REG_VAR_axis_in_data_reg := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l189_l257_DUPLICATE_0b77_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l189_l257_DUPLICATE_0b77_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l189_l257_DUPLICATE_0b77_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_right := VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_2af6_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse := VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_3f62_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse := VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_196e_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_left := VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_d410_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_right := VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_11d2_return_output;
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue := VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_14e7_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse := VAR_bit_counter_rmii_eth_mac_h_l181_c7_15ef;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse := VAR_bit_counter_rmii_eth_mac_h_l217_c7_1a88;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse := VAR_bit_counter_rmii_eth_mac_h_l232_c7_caf2;
     -- bit_counter_MUX[rmii_eth_mac_h_l176_c5_e0dd] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond;
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output := bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l201_c38_eec7] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_left;
     BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output := BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l226_c5_24d9] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output;

     -- state_MUX[rmii_eth_mac_h_l169_c5_a0a5] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l169_c5_a0a5_cond <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_cond;
     state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iftrue;
     state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_return_output := state_MUX_rmii_eth_mac_h_l169_c5_a0a5_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l251_c35_40a6] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_left;
     BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_return_output := BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l226_c5_24d9] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_cond;
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output := bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output;

     -- reset_crc_MUX[rmii_eth_mac_h_l167_c3_7abf] LATENCY=0
     -- Inputs
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_cond <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_cond;
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue;
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse;
     -- Outputs
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output := reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;

     -- o_tx_mac_output_data_MUX[rmii_eth_mac_h_l221_c8_2615] LATENCY=0
     -- Inputs
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_cond <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_cond;
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue;
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse;
     -- Outputs
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_return_output := o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_return_output;

     -- state_MUX[rmii_eth_mac_h_l226_c5_24d9] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l226_c5_24d9_cond <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_cond;
     state_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_iftrue;
     state_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output := state_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output;

     -- o_tx_mac_output_valid_MUX[rmii_eth_mac_h_l221_c8_2615] LATENCY=0
     -- Inputs
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_cond <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_cond;
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue;
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse;
     -- Outputs
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_return_output := o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_return_output;

     -- state_MUX[rmii_eth_mac_h_l176_c5_e0dd] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_cond;
     state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iftrue;
     state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output := state_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output;

     -- Submodule level 2
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_eec7_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_40a6_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output;
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_cond := VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue := VAR_state_MUX_rmii_eth_mac_h_l169_c5_a0a5_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue := VAR_state_MUX_rmii_eth_mac_h_l176_c5_e0dd_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue := VAR_state_MUX_rmii_eth_mac_h_l226_c5_24d9_return_output;
     -- BIN_OP_AND[rmii_eth_mac_h_l251_c35_775d] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_left;
     BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_return_output := BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_return_output;

     -- state_MUX[rmii_eth_mac_h_l203_c7_45a3] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l203_c7_45a3_cond <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_cond;
     state_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue;
     state_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output := state_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l221_c8_2615] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l203_c7_45a3] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_cond;
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output := bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;

     -- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l203_c7_45a3] LATENCY=0
     -- Inputs
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_cond <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_cond;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse;
     -- Outputs
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output := o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l203_c7_45a3] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;

     -- o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870[rmii_eth_mac_h_l194_c8_061e] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870_rmii_eth_mac_h_l194_c8_061e_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870(
     to_unsigned(0, 1),
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2615_return_output,
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2615_return_output);

     -- bit_counter_MUX[rmii_eth_mac_h_l221_c8_2615] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_cond;
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_return_output := bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l203_c7_45a3] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_cond;
     data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output := data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;

     -- state_MUX[rmii_eth_mac_h_l221_c8_2615] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l221_c8_2615_cond <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_cond;
     state_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_iftrue;
     state_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_return_output := state_MUX_rmii_eth_mac_h_l221_c8_2615_return_output;

     -- Submodule level 3
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_var_dim_0 := resize(VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_775d_return_output, 4);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2615_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2615_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue := VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870_rmii_eth_mac_h_l194_c8_061e_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue := VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue := VAR_state_MUX_rmii_eth_mac_h_l203_c7_45a3_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse := VAR_state_MUX_rmii_eth_mac_h_l221_c8_2615_return_output;
     -- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l202_c5_59e0] LATENCY=0
     -- Inputs
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_cond <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_cond;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse;
     -- Outputs
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output := o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output;

     -- state_MUX[rmii_eth_mac_h_l202_c5_59e0] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l202_c5_59e0_cond <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_cond;
     state_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue;
     state_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output := state_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l202_c5_59e0] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l202_c5_59e0] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_cond;
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output := bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output;

     -- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l251_c24_de5b] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_0;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_1 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_1;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_2 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_2;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_3 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_3;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_4 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_4;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_5 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_5;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_6 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_6;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_7 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_7;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_8 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_8;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_9 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_9;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_10 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_10;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_11 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_11;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_12 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_12;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_13 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_13;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_14 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_14;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_15 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_ref_toks_15;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_var_dim_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_return_output := VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l194_c8_061e] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l202_c5_59e0] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_cond;
     data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output := data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output;

     -- Submodule level 4
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_right := VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_de5b_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue := VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue := VAR_state_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output;
     -- bit_counter_MUX[rmii_eth_mac_h_l194_c8_061e] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_cond;
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_return_output := bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;

     -- state_MUX[rmii_eth_mac_h_l194_c8_061e] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l194_c8_061e_cond <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_cond;
     state_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue;
     state_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_return_output := state_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l194_c8_061e] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724[rmii_eth_mac_h_l194_c8_061e] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_061e_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724(
     VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_ddf2_return_output,
     to_unsigned(1, 1),
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_59e0_return_output);

     -- data_reg_MUX[rmii_eth_mac_h_l194_c8_061e] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_cond;
     data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output := data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l251_c12_62f1] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_left;
     BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_return_output := BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l184_c8_42a7] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;

     -- Submodule level 5
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_return_output;
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_x := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_62f1_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_061e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse := VAR_state_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;
     -- o_MUX[rmii_eth_mac_h_l194_c8_061e] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l194_c8_061e_cond <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_cond;
     o_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_iftrue;
     o_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_return_output := o_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;

     -- CONST_SR_4[rmii_eth_mac_h_l252_c12_7448] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_return_output := CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_return_output;

     -- state_MUX[rmii_eth_mac_h_l184_c8_42a7] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l184_c8_42a7_cond <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_cond;
     state_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue;
     state_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output := state_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l173_c8_d199] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l184_c8_42a7] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l252_c35_f822] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_left;
     BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_return_output := BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l184_c8_42a7] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_cond;
     data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output := data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l184_c8_42a7] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_cond;
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output := bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_f822_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_left := VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_7448_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse := VAR_o_MUX_rmii_eth_mac_h_l194_c8_061e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse := VAR_state_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;
     -- data_reg_MUX[rmii_eth_mac_h_l173_c8_d199] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond;
     data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output := data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;

     -- state_MUX[rmii_eth_mac_h_l173_c8_d199] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l173_c8_d199_cond <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_cond;
     state_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue;
     state_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_return_output := state_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;

     -- o_MUX[rmii_eth_mac_h_l184_c8_42a7] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l184_c8_42a7_cond <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_cond;
     o_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_iftrue;
     o_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output := o_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l252_c35_464d] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_left;
     BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_return_output := BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l167_c3_7abf] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l173_c8_d199] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_cond;
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_return_output := bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l173_c8_d199] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;

     -- Submodule level 7
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_var_dim_0 := resize(VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_464d_return_output, 4);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;
     REG_VAR_crc_shift_reg := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse := VAR_o_MUX_rmii_eth_mac_h_l184_c8_42a7_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse := VAR_state_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;
     -- data_reg_MUX[rmii_eth_mac_h_l167_c3_7abf] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond;
     data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output := data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;

     -- state_MUX[rmii_eth_mac_h_l167_c3_7abf] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l167_c3_7abf_cond <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_cond;
     state_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue;
     state_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output := state_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l167_c3_7abf] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;

     -- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l252_c24_0420] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_0;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_1 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_1;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_2 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_2;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_3 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_3;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_4 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_4;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_5 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_5;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_6 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_6;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_7 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_7;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_8 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_8;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_9 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_9;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_10 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_10;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_11 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_11;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_12 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_12;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_13 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_13;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_14 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_14;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_15 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_ref_toks_15;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_var_dim_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_return_output := VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l167_c3_7abf] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_cond;
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output := bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;

     -- o_MUX[rmii_eth_mac_h_l173_c8_d199] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l173_c8_d199_cond <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_cond;
     o_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_iftrue;
     o_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_return_output := o_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;

     -- Submodule level 8
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_right := VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_0420_return_output;
     REG_VAR_bit_counter := VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;
     REG_VAR_data_reg := VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;
     REG_VAR_last_byte_reg := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse := VAR_o_MUX_rmii_eth_mac_h_l173_c8_d199_return_output;
     REG_VAR_state := VAR_state_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;
     -- BIN_OP_XOR[rmii_eth_mac_h_l252_c12_2e07] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_left;
     BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_return_output := BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_return_output;

     -- o_MUX[rmii_eth_mac_h_l167_c3_7abf] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l167_c3_7abf_cond <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_cond;
     o_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_iftrue;
     o_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output := o_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;

     -- Submodule level 9
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iftrue := VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_2e07_return_output;
     VAR_return_output := VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output;
     -- crc_MUX[rmii_eth_mac_h_l250_c3_55e1] LATENCY=0
     -- Inputs
     crc_MUX_rmii_eth_mac_h_l250_c3_55e1_cond <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_cond;
     crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iftrue <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iftrue;
     crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iffalse <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_iffalse;
     -- Outputs
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_return_output := crc_MUX_rmii_eth_mac_h_l250_c3_55e1_return_output;

     -- CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d[rmii_eth_mac_h_l258_c44_9b93] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_9b93_return_output := VAR_o_MUX_rmii_eth_mac_h_l167_c3_7abf_return_output.tx_mac_input_ready;

     -- Submodule level 10
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_right := VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_9b93_return_output;
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iffalse := VAR_crc_MUX_rmii_eth_mac_h_l250_c3_55e1_return_output;
     -- BIN_OP_AND[rmii_eth_mac_h_l258_c28_ea0c] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_left;
     BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_return_output := BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_return_output;

     -- crc_MUX[rmii_eth_mac_h_l254_c3_fb76] LATENCY=0
     -- Inputs
     crc_MUX_rmii_eth_mac_h_l254_c3_fb76_cond <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_cond;
     crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iftrue <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iftrue;
     crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iffalse <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_iffalse;
     -- Outputs
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_return_output := crc_MUX_rmii_eth_mac_h_l254_c3_fb76_return_output;

     -- Submodule level 11
     REG_VAR_axis_in_data_reg_valid := VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ea0c_return_output;
     REG_VAR_crc := VAR_crc_MUX_rmii_eth_mac_h_l254_c3_fb76_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_state <= REG_VAR_state;
REG_COMB_bit_counter <= REG_VAR_bit_counter;
REG_COMB_crc <= REG_VAR_crc;
REG_COMB_crc_shift_reg <= REG_VAR_crc_shift_reg;
REG_COMB_data_reg <= REG_VAR_data_reg;
REG_COMB_last_byte_reg <= REG_VAR_last_byte_reg;
REG_COMB_axis_in_data_reg <= REG_VAR_axis_in_data_reg;
REG_COMB_axis_in_data_reg_valid <= REG_VAR_axis_in_data_reg_valid;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     state <= REG_COMB_state;
     bit_counter <= REG_COMB_bit_counter;
     crc <= REG_COMB_crc;
     crc_shift_reg <= REG_COMB_crc_shift_reg;
     data_reg <= REG_COMB_data_reg;
     last_byte_reg <= REG_COMB_last_byte_reg;
     axis_in_data_reg <= REG_COMB_axis_in_data_reg;
     axis_in_data_reg_valid <= REG_COMB_axis_in_data_reg_valid;
 end if;
 end if;
end process;

end arch;
