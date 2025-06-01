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
use work.global_wires_pkg.all;
-- Submodules: 12
entity rx_main_0CLK_646cd2b5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 global_to_module : in rx_main_global_to_module_t;
 module_to_global : out rx_main_module_to_global_t);
end rx_main_0CLK_646cd2b5;
architecture arch of rx_main_0CLK_646cd2b5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- Type holding all locally declared (feedback) wires of the func 
type feedback_vars_t is record
  -- Feedback vars
 deser_ready_for_input : unsigned(0 downto 0);
end record;
-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Feedback vars in the func
signal feedback_vars : feedback_vars_t;
-- Each function instance gets signals
-- BIN_OP_AND[ethernet_top_c_l108_c30_7c1b]
signal BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_return_output : unsigned(0 downto 0);

-- eth_8_rx[ethernet_top_c_l115_c23_3773]
signal eth_8_rx_ethernet_top_c_l115_c23_3773_CLOCK_ENABLE : unsigned(0 downto 0);
signal eth_8_rx_ethernet_top_c_l115_c23_3773_mac_axis : axis8_t_stream_t;
signal eth_8_rx_ethernet_top_c_l115_c23_3773_frame_ready : unsigned(0 downto 0);
signal eth_8_rx_ethernet_top_c_l115_c23_3773_return_output : eth_8_rx_t;

-- BIN_OP_EQ[ethernet_top_c_l118_c23_71a6]
signal BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_left : unsigned(47 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_right : unsigned(47 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[ethernet_top_c_l121_c29_b722]
signal BIN_OP_AND_ethernet_top_c_l121_c29_b722_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l121_c29_b722_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l121_c29_b722_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[ethernet_top_c_l121_c29_2c69]
signal BIN_OP_AND_ethernet_top_c_l121_c29_2c69_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l121_c29_2c69_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l121_c29_2c69_return_output : unsigned(0 downto 0);

-- work_deserialize[ethernet_top_c_l128_c30_f350]
signal work_deserialize_ethernet_top_c_l128_c30_f350_CLOCK_ENABLE : unsigned(0 downto 0);
signal work_deserialize_ethernet_top_c_l128_c30_f350_packet : axis8_t_stream_t;
signal work_deserialize_ethernet_top_c_l128_c30_f350_output_ready : unsigned(0 downto 0);
signal work_deserialize_ethernet_top_c_l128_c30_f350_return_output : work_deserialize_t;

-- BIN_OP_AND[ethernet_top_c_l142_c36_26ad]
signal BIN_OP_AND_ethernet_top_c_l142_c36_26ad_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l142_c36_26ad_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l142_c36_26ad_return_output : unsigned(0 downto 0);

function CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return uint8_t_6 is
 
  variable base : uint8_t_6; 
  variable return_output : uint8_t_6;
begin
      base(0) := ref_toks_0;
      base(1) := ref_toks_1;
      base(2) := ref_toks_2;
      base(3) := ref_toks_3;
      base(4) := ref_toks_4;
      base(5) := ref_toks_5;

      return_output := base;
      return return_output; 
end function;

function uint8_array6_be( x : uint8_t_6) return unsigned is

  --variable x : uint8_t_6;
  variable return_output : unsigned(47 downto 0);

begin
return_output := x(0)&x(1)&x(2)&x(3)&x(4)&x(5);
return return_output;
end function;

function CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0( ref_toks_0 : axis8_t;
 ref_toks_1 : unsigned) return axis8_t_stream_t is
 
  variable base : axis8_t_stream_t; 
  variable return_output : axis8_t_stream_t;
begin
      base.data := ref_toks_0;
      base.valid := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_work_inputs_t_stream_t_work_inputs_t_stream_t_42b0( ref_toks_0 : work_inputs_t;
 ref_toks_1 : unsigned) return work_inputs_t_stream_t is
 
  variable base : work_inputs_t_stream_t; 
  variable return_output : work_inputs_t_stream_t;
begin
      base.data := ref_toks_0;
      base.valid := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0( ref_toks_0 : eth_header_t;
 ref_toks_1 : unsigned) return eth_header_t_stream_t is
 
  variable base : eth_header_t_stream_t; 
  variable return_output : eth_header_t_stream_t;
begin
      base.data := ref_toks_0;
      base.valid := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_ethernet_top_c_l108_c30_7c1b : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l108_c30_7c1b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_left,
BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_right,
BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_return_output);

-- eth_8_rx_ethernet_top_c_l115_c23_3773 : 0 clocks latency
eth_8_rx_ethernet_top_c_l115_c23_3773 : entity work.eth_8_rx_0CLK_5110df32 port map (
clk,
eth_8_rx_ethernet_top_c_l115_c23_3773_CLOCK_ENABLE,
eth_8_rx_ethernet_top_c_l115_c23_3773_mac_axis,
eth_8_rx_ethernet_top_c_l115_c23_3773_frame_ready,
eth_8_rx_ethernet_top_c_l115_c23_3773_return_output);

-- BIN_OP_EQ_ethernet_top_c_l118_c23_71a6 : 0 clocks latency
BIN_OP_EQ_ethernet_top_c_l118_c23_71a6 : entity work.BIN_OP_EQ_uint48_t_uint48_t_0CLK_de264c78 port map (
BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_left,
BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_right,
BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_return_output);

-- BIN_OP_AND_ethernet_top_c_l121_c29_b722 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l121_c29_b722 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l121_c29_b722_left,
BIN_OP_AND_ethernet_top_c_l121_c29_b722_right,
BIN_OP_AND_ethernet_top_c_l121_c29_b722_return_output);

-- BIN_OP_AND_ethernet_top_c_l121_c29_2c69 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l121_c29_2c69 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l121_c29_2c69_left,
BIN_OP_AND_ethernet_top_c_l121_c29_2c69_right,
BIN_OP_AND_ethernet_top_c_l121_c29_2c69_return_output);

-- work_deserialize_ethernet_top_c_l128_c30_f350 : 0 clocks latency
work_deserialize_ethernet_top_c_l128_c30_f350 : entity work.work_deserialize_0CLK_771b4af2 port map (
clk,
work_deserialize_ethernet_top_c_l128_c30_f350_CLOCK_ENABLE,
work_deserialize_ethernet_top_c_l128_c30_f350_packet,
work_deserialize_ethernet_top_c_l128_c30_f350_output_ready,
work_deserialize_ethernet_top_c_l128_c30_f350_return_output);

-- BIN_OP_AND_ethernet_top_c_l142_c36_26ad : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l142_c36_26ad : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l142_c36_26ad_left,
BIN_OP_AND_ethernet_top_c_l142_c36_26ad_right,
BIN_OP_AND_ethernet_top_c_l142_c36_26ad_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Feedback vars
 feedback_vars,
 -- Clock cross input
 global_to_module,
 -- All submodule outputs
 BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_return_output,
 eth_8_rx_ethernet_top_c_l115_c23_3773_return_output,
 BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_return_output,
 BIN_OP_AND_ethernet_top_c_l121_c29_b722_return_output,
 BIN_OP_AND_ethernet_top_c_l121_c29_2c69_return_output,
 work_deserialize_ethernet_top_c_l128_c30_f350_return_output,
 BIN_OP_AND_ethernet_top_c_l142_c36_26ad_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_loopback_headers_fifo_in_ready : unsigned(0 downto 0);
 variable VAR_eth_rx_mac_axis_out : axis8_t_stream_t;
 variable VAR_FPGA_MAC_BYTES : uint8_t_6;
 variable VAR_work_pipeline_in_ready : unsigned(0 downto 0);
 variable VAR_work_pipeline_in : work_inputs_t_stream_t;
 variable VAR_loopback_headers_fifo_in : eth_header_t_stream_t;
 variable VAR_deser_ready_for_input : unsigned(0 downto 0);
 variable VAR_eth_rx_out_ready : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_return_output : unsigned(0 downto 0);
 variable VAR_eth_rx : eth_8_rx_t;
 variable VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_mac_axis : axis8_t_stream_t;
 variable VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_frame_ready : unsigned(0 downto 0);
 variable VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_return_output : eth_8_rx_t;
 variable VAR_frame : eth8_frame_t_stream_t;
 variable VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_1c01_return_output : eth8_frame_t_stream_t;
 variable VAR_mac_match : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_dst_mac_d41d_ethernet_top_c_l118_c23_5acb_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_left : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_right : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l118_c68_ec5b_return_output : uint8_t_6;
 variable VAR_uint8_array6_be_ethernet_top_c_l118_c52_a337_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_return_output : unsigned(0 downto 0);
 variable VAR_valid_and_ready : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_ethernet_top_c_l121_c29_3f78_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_b722_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_b722_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_b722_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_return_output : unsigned(0 downto 0);
 variable VAR_deser_in_stream : axis8_t_stream_t;
 variable VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_ethernet_top_c_l125_c26_43ed_return_output : axis8_t;
 variable VAR_deser_output_ready : unsigned(0 downto 0);
 variable VAR_deser : work_deserialize_t;
 variable VAR_work_deserialize_ethernet_top_c_l128_c30_f350_packet : axis8_t_stream_t;
 variable VAR_work_deserialize_ethernet_top_c_l128_c30_f350_output_ready : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0_ethernet_top_c_l129_c5_f7a2_return_output : axis8_t_stream_t;
 variable VAR_work_deserialize_ethernet_top_c_l128_c30_f350_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_deserialize_ethernet_top_c_l128_c30_f350_return_output : work_deserialize_t;
 variable VAR_CONST_REF_RD_uint1_t_work_deserialize_t_packet_ready_d41d_ethernet_top_c_l132_c27_4139_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_work_inputs_t_work_deserialize_t_data_d41d_ethernet_top_c_l133_c27_d00f_return_output : work_inputs_t;
 variable VAR_CONST_REF_RD_uint1_t_work_deserialize_t_valid_d41d_ethernet_top_c_l134_c28_c50c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_ethernet_top_c_l141_c35_0362_return_output : eth_header_t;
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_start_of_payload_d41d_ethernet_top_c_l142_c36_d486_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l142_c36_26ad_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l142_c36_26ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l142_c36_26ad_return_output : unsigned(0 downto 0);
 variable VAR_work_pipeline_in_CONST_REF_RD_work_inputs_t_stream_t_work_inputs_t_stream_t_42b0_ethernet_top_c_l101_c6_944a_return_output : work_inputs_t_stream_t;
 variable VAR_loopback_headers_fifo_in_CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0_ethernet_top_c_l101_c6_944a_return_output : eth_header_t_stream_t;
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     -- CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e[ethernet_top_c_l118_c68_ec5b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l118_c68_ec5b_return_output := CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e(
     to_unsigned(160, 8),
     to_unsigned(177, 8),
     to_unsigned(194, 8),
     to_unsigned(211, 8),
     to_unsigned(228, 8),
     to_unsigned(245, 8));

     -- Submodule level 1
     -- uint8_array6_be[ethernet_top_c_l118_c52_a337] LATENCY=0
     VAR_uint8_array6_be_ethernet_top_c_l118_c52_a337_return_output := uint8_array6_be(
     VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l118_c68_ec5b_return_output);

     -- Submodule level 2
     VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_right := VAR_uint8_array6_be_ethernet_top_c_l118_c52_a337_return_output;
 -- Reads from global variables
     VAR_loopback_headers_fifo_in_ready := global_to_module.loopback_headers_fifo_in_ready;
     VAR_eth_rx_mac_axis_out := global_to_module.eth_rx_mac_axis_out;
     VAR_work_pipeline_in_ready := global_to_module.work_pipeline_in_ready;
     -- Submodule level 0
     VAR_work_deserialize_ethernet_top_c_l128_c30_f350_output_ready := VAR_work_pipeline_in_ready;
     VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_mac_axis := VAR_eth_rx_mac_axis_out;
     VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_right := VAR_loopback_headers_fifo_in_ready;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;

     -- Submodule level 0
     VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_work_deserialize_ethernet_top_c_l128_c30_f350_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_left := feedback_vars.deser_ready_for_input;
     -- BIN_OP_AND[ethernet_top_c_l108_c30_7c1b] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_left <= VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_left;
     BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_right <= VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_return_output := BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_b722_right := VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_return_output;
     VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_frame_ready := VAR_BIN_OP_AND_ethernet_top_c_l108_c30_7c1b_return_output;
     -- eth_8_rx[ethernet_top_c_l115_c23_3773] LATENCY=0
     -- Clock enable
     eth_8_rx_ethernet_top_c_l115_c23_3773_CLOCK_ENABLE <= VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_CLOCK_ENABLE;
     -- Inputs
     eth_8_rx_ethernet_top_c_l115_c23_3773_mac_axis <= VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_mac_axis;
     eth_8_rx_ethernet_top_c_l115_c23_3773_frame_ready <= VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_frame_ready;
     -- Outputs
     VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_return_output := eth_8_rx_ethernet_top_c_l115_c23_3773_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d[ethernet_top_c_l116_c33_1c01] LATENCY=0
     VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_1c01_return_output := VAR_eth_8_rx_ethernet_top_c_l115_c23_3773_return_output.frame;

     -- Submodule level 3
     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_start_of_payload_d41d[ethernet_top_c_l142_c36_d486] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_start_of_payload_d41d_ethernet_top_c_l142_c36_d486_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_1c01_return_output.data.start_of_payload;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d[ethernet_top_c_l121_c29_3f78] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_ethernet_top_c_l121_c29_3f78_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_1c01_return_output.valid;

     -- CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d[ethernet_top_c_l125_c26_43ed] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_ethernet_top_c_l125_c26_43ed_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_1c01_return_output.data.payload;

     -- CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d[ethernet_top_c_l141_c35_0362] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_ethernet_top_c_l141_c35_0362_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_1c01_return_output.data.header;

     -- CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_dst_mac_d41d[ethernet_top_c_l118_c23_5acb] LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_dst_mac_d41d_ethernet_top_c_l118_c23_5acb_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_1c01_return_output.data.header.dst_mac;

     -- Submodule level 4
     VAR_BIN_OP_AND_ethernet_top_c_l142_c36_26ad_left := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_start_of_payload_d41d_ethernet_top_c_l142_c36_d486_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_b722_left := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_ethernet_top_c_l121_c29_3f78_return_output;
     VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_left := VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_dst_mac_d41d_ethernet_top_c_l118_c23_5acb_return_output;
     -- BIN_OP_EQ[ethernet_top_c_l118_c23_71a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_left <= VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_left;
     BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_right <= VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_return_output := BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_return_output;

     -- BIN_OP_AND[ethernet_top_c_l121_c29_b722] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l121_c29_b722_left <= VAR_BIN_OP_AND_ethernet_top_c_l121_c29_b722_left;
     BIN_OP_AND_ethernet_top_c_l121_c29_b722_right <= VAR_BIN_OP_AND_ethernet_top_c_l121_c29_b722_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_b722_return_output := BIN_OP_AND_ethernet_top_c_l121_c29_b722_return_output;

     -- Submodule level 5
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_left := VAR_BIN_OP_AND_ethernet_top_c_l121_c29_b722_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_right := VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_71a6_return_output;
     -- BIN_OP_AND[ethernet_top_c_l121_c29_2c69] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l121_c29_2c69_left <= VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_left;
     BIN_OP_AND_ethernet_top_c_l121_c29_2c69_right <= VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_return_output := BIN_OP_AND_ethernet_top_c_l121_c29_2c69_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_ethernet_top_c_l142_c36_26ad_right := VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_return_output;
     -- CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0[ethernet_top_c_l129_c5_f7a2] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0_ethernet_top_c_l129_c5_f7a2_return_output := CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0(
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_ethernet_top_c_l125_c26_43ed_return_output,
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_2c69_return_output);

     -- BIN_OP_AND[ethernet_top_c_l142_c36_26ad] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l142_c36_26ad_left <= VAR_BIN_OP_AND_ethernet_top_c_l142_c36_26ad_left;
     BIN_OP_AND_ethernet_top_c_l142_c36_26ad_right <= VAR_BIN_OP_AND_ethernet_top_c_l142_c36_26ad_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l142_c36_26ad_return_output := BIN_OP_AND_ethernet_top_c_l142_c36_26ad_return_output;

     -- Submodule level 7
     VAR_work_deserialize_ethernet_top_c_l128_c30_f350_packet := VAR_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0_ethernet_top_c_l129_c5_f7a2_return_output;
     -- loopback_headers_fifo_in_CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0[ethernet_top_c_l101_c6_944a] LATENCY=0
     VAR_loopback_headers_fifo_in_CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0_ethernet_top_c_l101_c6_944a_return_output := CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0(
     VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_ethernet_top_c_l141_c35_0362_return_output,
     VAR_BIN_OP_AND_ethernet_top_c_l142_c36_26ad_return_output);

     -- work_deserialize[ethernet_top_c_l128_c30_f350] LATENCY=0
     -- Clock enable
     work_deserialize_ethernet_top_c_l128_c30_f350_CLOCK_ENABLE <= VAR_work_deserialize_ethernet_top_c_l128_c30_f350_CLOCK_ENABLE;
     -- Inputs
     work_deserialize_ethernet_top_c_l128_c30_f350_packet <= VAR_work_deserialize_ethernet_top_c_l128_c30_f350_packet;
     work_deserialize_ethernet_top_c_l128_c30_f350_output_ready <= VAR_work_deserialize_ethernet_top_c_l128_c30_f350_output_ready;
     -- Outputs
     VAR_work_deserialize_ethernet_top_c_l128_c30_f350_return_output := work_deserialize_ethernet_top_c_l128_c30_f350_return_output;

     -- Submodule level 8
     VAR_loopback_headers_fifo_in := VAR_loopback_headers_fifo_in_CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0_ethernet_top_c_l101_c6_944a_return_output;
     -- CONST_REF_RD_uint1_t_work_deserialize_t_packet_ready_d41d[ethernet_top_c_l132_c27_4139] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_deserialize_t_packet_ready_d41d_ethernet_top_c_l132_c27_4139_return_output := VAR_work_deserialize_ethernet_top_c_l128_c30_f350_return_output.packet_ready;

     -- CONST_REF_RD_work_inputs_t_work_deserialize_t_data_d41d[ethernet_top_c_l133_c27_d00f] LATENCY=0
     VAR_CONST_REF_RD_work_inputs_t_work_deserialize_t_data_d41d_ethernet_top_c_l133_c27_d00f_return_output := VAR_work_deserialize_ethernet_top_c_l128_c30_f350_return_output.data;

     -- CONST_REF_RD_uint1_t_work_deserialize_t_valid_d41d[ethernet_top_c_l134_c28_c50c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_deserialize_t_valid_d41d_ethernet_top_c_l134_c28_c50c_return_output := VAR_work_deserialize_ethernet_top_c_l128_c30_f350_return_output.valid;

     -- Submodule level 9
     feedback_vars.deser_ready_for_input <= VAR_CONST_REF_RD_uint1_t_work_deserialize_t_packet_ready_d41d_ethernet_top_c_l132_c27_4139_return_output;
     -- work_pipeline_in_CONST_REF_RD_work_inputs_t_stream_t_work_inputs_t_stream_t_42b0[ethernet_top_c_l101_c6_944a] LATENCY=0
     VAR_work_pipeline_in_CONST_REF_RD_work_inputs_t_stream_t_work_inputs_t_stream_t_42b0_ethernet_top_c_l101_c6_944a_return_output := CONST_REF_RD_work_inputs_t_stream_t_work_inputs_t_stream_t_42b0(
     VAR_CONST_REF_RD_work_inputs_t_work_deserialize_t_data_d41d_ethernet_top_c_l133_c27_d00f_return_output,
     VAR_CONST_REF_RD_uint1_t_work_deserialize_t_valid_d41d_ethernet_top_c_l134_c28_c50c_return_output);

     -- Submodule level 10
     VAR_work_pipeline_in := VAR_work_pipeline_in_CONST_REF_RD_work_inputs_t_stream_t_work_inputs_t_stream_t_42b0_ethernet_top_c_l101_c6_944a_return_output;
   end if;
 end loop;

-- Global wires driven various places in pipeline
if clk_en_internal='1' then
  module_to_global.work_pipeline_in <= VAR_work_pipeline_in;
else
  module_to_global.work_pipeline_in <= work_inputs_t_stream_t_NULL;
end if;
if clk_en_internal='1' then
  module_to_global.loopback_headers_fifo_in <= VAR_loopback_headers_fifo_in;
else
  module_to_global.loopback_headers_fifo_in <= eth_header_t_stream_t_NULL;
end if;
end process;

end arch;
