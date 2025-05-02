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
-- Submodules: 2
entity blinky_main_0CLK_23f04728 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 module_to_global : out blinky_main_module_to_global_t);
end blinky_main_0CLK_23f04728;
architecture arch of blinky_main_0CLK_23f04728 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal counter : unsigned(24 downto 0) := to_unsigned(0, 25);
signal REG_COMB_counter : unsigned(24 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- CONST_SR_24[ethernet_top_c_l209_c11_9b57]
signal CONST_SR_24_ethernet_top_c_l209_c11_9b57_x : unsigned(24 downto 0);
signal CONST_SR_24_ethernet_top_c_l209_c11_9b57_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[ethernet_top_c_l212_c3_c4cf]
signal BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_return_output : unsigned(25 downto 0);


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_24_ethernet_top_c_l209_c11_9b57 : 0 clocks latency
CONST_SR_24_ethernet_top_c_l209_c11_9b57 : entity work.CONST_SR_24_uint25_t_0CLK_de264c78 port map (
CONST_SR_24_ethernet_top_c_l209_c11_9b57_x,
CONST_SR_24_ethernet_top_c_l209_c11_9b57_return_output);

-- BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf : 0 clocks latency
BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf : entity work.BIN_OP_PLUS_uint25_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_left,
BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_right,
BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Registers
 counter,
 -- All submodule outputs
 CONST_SR_24_ethernet_top_c_l209_c11_9b57_return_output,
 BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_led_r : unsigned(0 downto 0);
 variable VAR_led_g : unsigned(0 downto 0);
 variable VAR_led_b : unsigned(0 downto 0);
 variable VAR_led_r_ethernet_top_c_l209_c3_464e : unsigned(0 downto 0);
 variable VAR_CONST_SR_24_ethernet_top_c_l209_c11_9b57_return_output : unsigned(24 downto 0);
 variable VAR_CONST_SR_24_ethernet_top_c_l209_c11_9b57_x : unsigned(24 downto 0);
 variable VAR_counter_ethernet_top_c_l212_c3_3865 : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_return_output : unsigned(25 downto 0);
 -- State registers comb logic variables
variable REG_VAR_counter : unsigned(24 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_counter := counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_right := to_unsigned(1, 1);
     VAR_led_g := to_unsigned(1, 1);
     VAR_led_b := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_left := counter;
     VAR_CONST_SR_24_ethernet_top_c_l209_c11_9b57_x := counter;
     -- CONST_SR_24[ethernet_top_c_l209_c11_9b57] LATENCY=0
     -- Inputs
     CONST_SR_24_ethernet_top_c_l209_c11_9b57_x <= VAR_CONST_SR_24_ethernet_top_c_l209_c11_9b57_x;
     -- Outputs
     VAR_CONST_SR_24_ethernet_top_c_l209_c11_9b57_return_output := CONST_SR_24_ethernet_top_c_l209_c11_9b57_return_output;

     -- BIN_OP_PLUS[ethernet_top_c_l212_c3_c4cf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_left <= VAR_BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_left;
     BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_right <= VAR_BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_return_output := BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_return_output;

     -- Submodule level 1
     VAR_counter_ethernet_top_c_l212_c3_3865 := resize(VAR_BIN_OP_PLUS_ethernet_top_c_l212_c3_c4cf_return_output, 25);
     VAR_led_r_ethernet_top_c_l209_c3_464e := resize(VAR_CONST_SR_24_ethernet_top_c_l209_c11_9b57_return_output, 1);
     REG_VAR_counter := VAR_counter_ethernet_top_c_l212_c3_3865;
     VAR_led_r := VAR_led_r_ethernet_top_c_l209_c3_464e;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_counter <= REG_VAR_counter;
-- Global wires driven various places in pipeline
if clk_en_internal='1' then
  module_to_global.led_r <= VAR_led_r;
else
  module_to_global.led_r <= to_unsigned(0, 1);
end if;
if clk_en_internal='1' then
  module_to_global.led_g <= VAR_led_g;
else
  module_to_global.led_g <= to_unsigned(0, 1);
end if;
if clk_en_internal='1' then
  module_to_global.led_b <= VAR_led_b;
else
  module_to_global.led_b <= to_unsigned(0, 1);
end if;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     counter <= REG_COMB_counter;
 end if;
 end if;
end process;

end arch;
