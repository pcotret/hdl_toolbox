----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrew Powell
-- 
-- Create Date:    12:49:47 08/22/2015 
-- Design Name: 
-- Module Name:    Toggle - Behavioral 
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

entity Button is
	generic (
		WIDTH				: integer := 32;
		CHECK_TICK		: integer := 1000000);
	port (
		signal clock	: in std_logic;
		signal reset	: in std_logic;
		signal input	: in std_logic;
		signal output	: out std_logic);
end Button;

architecture Behavioral of Button is
	component Timer
		generic (	
			WIDTH				: integer;
			RESET_VALUE		: integer);
		port (		
			clock				: in std_logic;
			reset				: in std_logic;
			ready				: out std_logic);
	end component;
	signal curr_input		: std_logic;
	signal prev_input		: std_logic;
	signal check_0_ready	: std_logic;
begin
	Check_0	: Timer
		generic 	map (
			WIDTH => WIDTH,
			RESET_VALUE => CHECK_TICK)
		port map (
			clock => clock,
			reset => reset,
			ready => check_0_ready);
	process (clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				curr_input <= '0';
				prev_input <= '0';
				output <= '0';
			else
				if (check_0_ready='1') then
					curr_input <= input;
				end if;
				if (curr_input='0' and prev_input='1') then
					output <= '1';
				else
					output <= '0';
				end if;
				prev_input <= curr_input;
			end if;
		end if;
	end process;
end Behavioral;

