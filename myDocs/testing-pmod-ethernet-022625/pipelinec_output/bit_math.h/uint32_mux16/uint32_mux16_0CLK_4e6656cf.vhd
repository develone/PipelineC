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
-- Submodules: 19
entity uint32_mux16_0CLK_4e6656cf is
port(
 sel : in unsigned(3 downto 0);
 in0 : in unsigned(31 downto 0);
 in1 : in unsigned(31 downto 0);
 in2 : in unsigned(31 downto 0);
 in3 : in unsigned(31 downto 0);
 in4 : in unsigned(31 downto 0);
 in5 : in unsigned(31 downto 0);
 in6 : in unsigned(31 downto 0);
 in7 : in unsigned(31 downto 0);
 in8 : in unsigned(31 downto 0);
 in9 : in unsigned(31 downto 0);
 in10 : in unsigned(31 downto 0);
 in11 : in unsigned(31 downto 0);
 in12 : in unsigned(31 downto 0);
 in13 : in unsigned(31 downto 0);
 in14 : in unsigned(31 downto 0);
 in15 : in unsigned(31 downto 0);
 return_output : out unsigned(31 downto 0));
end uint32_mux16_0CLK_4e6656cf;
architecture arch of uint32_mux16_0CLK_4e6656cf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_dd73]
signal layer0_node0_MUX_bit_math_h_l18_c3_dd73_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_dd73_iftrue : unsigned(31 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_dd73_iffalse : unsigned(31 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_dd73_return_output : unsigned(31 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_95aa]
signal layer0_node1_MUX_bit_math_h_l29_c3_95aa_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_95aa_iftrue : unsigned(31 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_95aa_iffalse : unsigned(31 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_95aa_return_output : unsigned(31 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_7941]
signal layer0_node2_MUX_bit_math_h_l40_c3_7941_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_7941_iftrue : unsigned(31 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_7941_iffalse : unsigned(31 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_7941_return_output : unsigned(31 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_7263]
signal layer0_node3_MUX_bit_math_h_l51_c3_7263_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7263_iftrue : unsigned(31 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7263_iffalse : unsigned(31 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7263_return_output : unsigned(31 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_7beb]
signal layer0_node4_MUX_bit_math_h_l62_c3_7beb_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_7beb_iftrue : unsigned(31 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_7beb_iffalse : unsigned(31 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_7beb_return_output : unsigned(31 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_353c]
signal layer0_node5_MUX_bit_math_h_l73_c3_353c_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_353c_iftrue : unsigned(31 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_353c_iffalse : unsigned(31 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_353c_return_output : unsigned(31 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_9e45]
signal layer0_node6_MUX_bit_math_h_l84_c3_9e45_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_9e45_iftrue : unsigned(31 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_9e45_iffalse : unsigned(31 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_9e45_return_output : unsigned(31 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_c330]
signal layer0_node7_MUX_bit_math_h_l95_c3_c330_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c330_iftrue : unsigned(31 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c330_iffalse : unsigned(31 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c330_return_output : unsigned(31 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_e387]
signal layer1_node0_MUX_bit_math_h_l112_c3_e387_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_e387_iftrue : unsigned(31 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_e387_iffalse : unsigned(31 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_e387_return_output : unsigned(31 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_d92b]
signal layer1_node1_MUX_bit_math_h_l123_c3_d92b_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_d92b_iftrue : unsigned(31 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_d92b_iffalse : unsigned(31 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_d92b_return_output : unsigned(31 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_ec51]
signal layer1_node2_MUX_bit_math_h_l134_c3_ec51_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_ec51_iftrue : unsigned(31 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_ec51_iffalse : unsigned(31 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_ec51_return_output : unsigned(31 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_9c42]
signal layer1_node3_MUX_bit_math_h_l145_c3_9c42_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_9c42_iftrue : unsigned(31 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_9c42_iffalse : unsigned(31 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_9c42_return_output : unsigned(31 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_2c57]
signal layer2_node0_MUX_bit_math_h_l162_c3_2c57_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_2c57_iftrue : unsigned(31 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_2c57_iffalse : unsigned(31 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_2c57_return_output : unsigned(31 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_696a]
signal layer2_node1_MUX_bit_math_h_l173_c3_696a_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_696a_iftrue : unsigned(31 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_696a_iffalse : unsigned(31 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_696a_return_output : unsigned(31 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_67c9]
signal layer3_node0_MUX_bit_math_h_l190_c3_67c9_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_67c9_iftrue : unsigned(31 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_67c9_iffalse : unsigned(31 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_67c9_return_output : unsigned(31 downto 0);

function uint4_0_0( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint4_1_1( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint4_2_2( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint4_3_3( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- layer0_node0_MUX_bit_math_h_l18_c3_dd73 : 0 clocks latency
layer0_node0_MUX_bit_math_h_l18_c3_dd73 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_dd73_cond,
layer0_node0_MUX_bit_math_h_l18_c3_dd73_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_dd73_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_dd73_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_95aa : 0 clocks latency
layer0_node1_MUX_bit_math_h_l29_c3_95aa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_95aa_cond,
layer0_node1_MUX_bit_math_h_l29_c3_95aa_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_95aa_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_95aa_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_7941 : 0 clocks latency
layer0_node2_MUX_bit_math_h_l40_c3_7941 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_7941_cond,
layer0_node2_MUX_bit_math_h_l40_c3_7941_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_7941_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_7941_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_7263 : 0 clocks latency
layer0_node3_MUX_bit_math_h_l51_c3_7263 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_7263_cond,
layer0_node3_MUX_bit_math_h_l51_c3_7263_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_7263_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_7263_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_7beb : 0 clocks latency
layer0_node4_MUX_bit_math_h_l62_c3_7beb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_7beb_cond,
layer0_node4_MUX_bit_math_h_l62_c3_7beb_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_7beb_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_7beb_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_353c : 0 clocks latency
layer0_node5_MUX_bit_math_h_l73_c3_353c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_353c_cond,
layer0_node5_MUX_bit_math_h_l73_c3_353c_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_353c_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_353c_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_9e45 : 0 clocks latency
layer0_node6_MUX_bit_math_h_l84_c3_9e45 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_9e45_cond,
layer0_node6_MUX_bit_math_h_l84_c3_9e45_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_9e45_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_9e45_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_c330 : 0 clocks latency
layer0_node7_MUX_bit_math_h_l95_c3_c330 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_c330_cond,
layer0_node7_MUX_bit_math_h_l95_c3_c330_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_c330_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_c330_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_e387 : 0 clocks latency
layer1_node0_MUX_bit_math_h_l112_c3_e387 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_e387_cond,
layer1_node0_MUX_bit_math_h_l112_c3_e387_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_e387_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_e387_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_d92b : 0 clocks latency
layer1_node1_MUX_bit_math_h_l123_c3_d92b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_d92b_cond,
layer1_node1_MUX_bit_math_h_l123_c3_d92b_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_d92b_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_d92b_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_ec51 : 0 clocks latency
layer1_node2_MUX_bit_math_h_l134_c3_ec51 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_ec51_cond,
layer1_node2_MUX_bit_math_h_l134_c3_ec51_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_ec51_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_ec51_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_9c42 : 0 clocks latency
layer1_node3_MUX_bit_math_h_l145_c3_9c42 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_9c42_cond,
layer1_node3_MUX_bit_math_h_l145_c3_9c42_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_9c42_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_9c42_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_2c57 : 0 clocks latency
layer2_node0_MUX_bit_math_h_l162_c3_2c57 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_2c57_cond,
layer2_node0_MUX_bit_math_h_l162_c3_2c57_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_2c57_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_2c57_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_696a : 0 clocks latency
layer2_node1_MUX_bit_math_h_l173_c3_696a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_696a_cond,
layer2_node1_MUX_bit_math_h_l173_c3_696a_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_696a_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_696a_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_67c9 : 0 clocks latency
layer3_node0_MUX_bit_math_h_l190_c3_67c9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_67c9_cond,
layer3_node0_MUX_bit_math_h_l190_c3_67c9_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_67c9_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_67c9_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 sel,
 in0,
 in1,
 in2,
 in3,
 in4,
 in5,
 in6,
 in7,
 in8,
 in9,
 in10,
 in11,
 in12,
 in13,
 in14,
 in15,
 -- All submodule outputs
 layer0_node0_MUX_bit_math_h_l18_c3_dd73_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_95aa_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_7941_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_7263_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_7beb_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_353c_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_9e45_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_c330_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_e387_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_d92b_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_ec51_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_9c42_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_2c57_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_696a_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_67c9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(31 downto 0);
 variable VAR_sel : unsigned(3 downto 0);
 variable VAR_in0 : unsigned(31 downto 0);
 variable VAR_in1 : unsigned(31 downto 0);
 variable VAR_in2 : unsigned(31 downto 0);
 variable VAR_in3 : unsigned(31 downto 0);
 variable VAR_in4 : unsigned(31 downto 0);
 variable VAR_in5 : unsigned(31 downto 0);
 variable VAR_in6 : unsigned(31 downto 0);
 variable VAR_in7 : unsigned(31 downto 0);
 variable VAR_in8 : unsigned(31 downto 0);
 variable VAR_in9 : unsigned(31 downto 0);
 variable VAR_in10 : unsigned(31 downto 0);
 variable VAR_in11 : unsigned(31 downto 0);
 variable VAR_in12 : unsigned(31 downto 0);
 variable VAR_in13 : unsigned(31 downto 0);
 variable VAR_in14 : unsigned(31 downto 0);
 variable VAR_in15 : unsigned(31 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(31 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(31 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(31 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(31 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(31 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(31 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(31 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(31 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_9409_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(31 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_iftrue : unsigned(31 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_iffalse : unsigned(31 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_return_output : unsigned(31 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(31 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_iftrue : unsigned(31 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_iffalse : unsigned(31 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_return_output : unsigned(31 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(31 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_iftrue : unsigned(31 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_iffalse : unsigned(31 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_return_output : unsigned(31 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(31 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_iftrue : unsigned(31 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_iffalse : unsigned(31 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_return_output : unsigned(31 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_e6af_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(31 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_iftrue : unsigned(31 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_iffalse : unsigned(31 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_return_output : unsigned(31 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(31 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_iftrue : unsigned(31 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_iffalse : unsigned(31 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_return_output : unsigned(31 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_3401_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(31 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_iftrue : unsigned(31 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_iffalse : unsigned(31 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_return_output : unsigned(31 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_cond : unsigned(0 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_sel := sel;
     VAR_in0 := in0;
     VAR_in1 := in1;
     VAR_in2 := in2;
     VAR_in3 := in3;
     VAR_in4 := in4;
     VAR_in5 := in5;
     VAR_in6 := in6;
     VAR_in7 := in7;
     VAR_in8 := in8;
     VAR_in9 := in9;
     VAR_in10 := in10;
     VAR_in11 := in11;
     VAR_in12 := in12;
     VAR_in13 := in13;
     VAR_in14 := in14;
     VAR_in15 := in15;

     -- Submodule level 0
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_iftrue := VAR_in9;
     -- uint4_0_0[bit_math_h_l14_c10_4934] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_9409] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_9409_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_3401] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_3401_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_e6af] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_e6af_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4934_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_cond := VAR_uint4_1_1_bit_math_h_l108_c10_9409_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_cond := VAR_uint4_1_1_bit_math_h_l108_c10_9409_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_cond := VAR_uint4_1_1_bit_math_h_l108_c10_9409_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_cond := VAR_uint4_1_1_bit_math_h_l108_c10_9409_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_cond := VAR_uint4_2_2_bit_math_h_l158_c10_e6af_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_cond := VAR_uint4_2_2_bit_math_h_l158_c10_e6af_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_cond := VAR_uint4_3_3_bit_math_h_l186_c10_3401_return_output;
     -- layer0_node2_MUX[bit_math_h_l40_c3_7941] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_7941_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_7941_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_7941_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_return_output := layer0_node2_MUX_bit_math_h_l40_c3_7941_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_7beb] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_7beb_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_7beb_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_7beb_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_return_output := layer0_node4_MUX_bit_math_h_l62_c3_7beb_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_9e45] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_9e45_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_9e45_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_9e45_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_return_output := layer0_node6_MUX_bit_math_h_l84_c3_9e45_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_7263] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_7263_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_7263_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_7263_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_return_output := layer0_node3_MUX_bit_math_h_l51_c3_7263_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_dd73] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_dd73_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_dd73_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_dd73_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_return_output := layer0_node0_MUX_bit_math_h_l18_c3_dd73_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_353c] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_353c_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_353c_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_353c_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_return_output := layer0_node5_MUX_bit_math_h_l73_c3_353c_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_c330] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_c330_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_c330_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_c330_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_return_output := layer0_node7_MUX_bit_math_h_l95_c3_c330_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_95aa] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_95aa_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_95aa_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_95aa_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_return_output := layer0_node1_MUX_bit_math_h_l29_c3_95aa_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_dd73_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_95aa_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_7941_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_7263_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_7beb_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_353c_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_9e45_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_c330_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_9c42] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_9c42_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_9c42_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_9c42_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_return_output := layer1_node3_MUX_bit_math_h_l145_c3_9c42_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_d92b] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_d92b_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_d92b_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_d92b_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_return_output := layer1_node1_MUX_bit_math_h_l123_c3_d92b_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_e387] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_e387_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_e387_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_e387_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_return_output := layer1_node0_MUX_bit_math_h_l112_c3_e387_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_ec51] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_ec51_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_ec51_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_ec51_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_return_output := layer1_node2_MUX_bit_math_h_l134_c3_ec51_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_e387_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_d92b_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_ec51_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_9c42_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_2c57] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_2c57_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_2c57_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_2c57_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_return_output := layer2_node0_MUX_bit_math_h_l162_c3_2c57_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_696a] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_696a_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_696a_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_696a_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_return_output := layer2_node1_MUX_bit_math_h_l173_c3_696a_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c57_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_696a_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_67c9] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_67c9_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_67c9_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_67c9_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_return_output := layer3_node0_MUX_bit_math_h_l190_c3_67c9_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_67c9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
