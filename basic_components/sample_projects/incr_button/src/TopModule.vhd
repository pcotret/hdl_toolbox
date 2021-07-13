----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrew Powell
-- 
-- Create Date:    22:12:36 08/21/2015 
-- Design Name: 
-- Module Name:    TopModule - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;		

entity TopModule is
	generic (
		-- Width of output value in bits.
		OUTPUT_WIDTH	: integer := 8;
		-- Ticks until output value increments. 
		-- Equivalent to 1 second.
		TIMER_TICKS		: integer := 100000000;
		-- Width of timer.
		TIMER_WIDTH		: integer := 32;
		-- Width of signals related to the debouncing
		-- of pushbuttons.
		DEBOUNCE_WIDTH	: integer := 20;
		-- Ticks until pushbuttons are checked for input.
		DEBOUNCE_TICK	: integer := 1000000);
	port (
		-- 100 MHz CMOS oscillator.
		CLK 	: in std_logic;		
		-- The output value is transferred to the LEDs to 
		-- display output.
		LED	: out std_logic_vector((OUTPUT_WIDTH-1) downto 0);		
		-- Reset button.
		BTND	: in std_logic;	
		-- Resume / pause button.
		BTNC	: in std_logic;		
		-- Decrement counter when paused.
		BTNL	: in std_logic;		
		-- Increment counter when paused.
		BTNR	: in std_logic);													
end TopModule;

architecture Behavioral of TopModule is

	-- Component declarations.
	component Timer
		generic (	
			WIDTH				: integer;
			RESET_VALUE		: integer);
		port (		
			clock				: in std_logic;
			reset				: in std_logic;
			ready				: out std_logic);
	end component;
	component Button
		generic (
			WIDTH				: integer;
			CHECK_TICK		: integer);
		port (
			signal clock	: in std_logic;
			signal reset	: in std_logic;
			signal input	: in std_logic;
			signal output	: out std_logic);
	end component;
	component Toggle
		generic (
			WIDTH		: integer;
			CHECK_TICK		: integer);
		port (
			signal clock	: in std_logic;
			signal reset	: in std_logic;
			signal input	: in std_logic;
			signal output	: out std_logic);
	end component;
	
	-- Signal declarations.
	signal clock 			: std_logic;
	signal reset			: std_logic;
	signal output_value	: std_logic_vector((OUTPUT_WIDTH-1) downto 0);
	signal timer_ready	: std_logic;
	signal pause_in		: std_logic;
	signal pause_out		: std_logic;
	signal decrement_in	: std_logic;
	signal decrement_out	: std_logic;
	signal increment_in	: std_logic;
	signal increment_out	: std_logic;
	
begin

	-- Signal assignments.
	LED <= output_value;
	clock <= CLK;
	reset <= BTND;
	pause_in <= BTNC;
	decrement_in <= BTNL;
	increment_in <= BTNR;
	
	-- Instantiations / port maps.
	Timer_0		: Timer
		generic 	map (
			WIDTH => TIMER_WIDTH,
			RESET_VALUE => TIMER_TICKS)
		port map (
			clock => clock,
			reset => reset,
			ready => timer_ready);
	Decrement_0	: Button
		generic 	map (
			WIDTH => DEBOUNCE_WIDTH,
			CHECK_TICK => DEBOUNCE_TICK)
		port map (
			clock => clock,
			reset => reset,
			input	=> decrement_in,
			output => decrement_out);
	Increment_0	: Button
		generic 	map (
			WIDTH => DEBOUNCE_WIDTH,
			CHECK_TICK => DEBOUNCE_TICK)
		port map (
			clock => clock,
			reset => reset,
			input	=> increment_in,
			output => increment_out);
	Pause_0		: Toggle
		generic map(
			WIDTH => DEBOUNCE_WIDTH,
			CHECK_TICK	=> DEBOUNCE_TICK)
		port map (
			clock	=> clock,
			reset	=> reset,
			input	=> pause_in,
			output => pause_out);
			
	-- Behavorial block.
	process (clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				output_value <= conv_std_logic_vector(0,OUTPUT_WIDTH);
			else
				if (pause_out='1') then
					if (decrement_out='1') then
						output_value <= output_value-1;
					elsif (increment_out='1') then
						output_value <= output_value+1;
					end if;
				else
					if (timer_ready='1') then
						output_value <= output_value+1;
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;