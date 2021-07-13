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

entity Toggle is
	generic (
		WIDTH				: integer := 32;
		CHECK_TICK		: integer := 1000000);
	port (
		signal clock	: in std_logic;
		signal reset	: in std_logic;
		signal input	: in std_logic;
		signal output	: out std_logic);
end Toggle;

architecture Behavioral of Toggle is
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
	signal buff_output		: std_logic;
	signal button_pressed	: std_logic;
begin
	Button_0	: Button
		generic 	map (
			WIDTH => WIDTH,
			CHECK_TICK => CHECK_TICK)
		port map (
			clock => clock,
			reset => reset,
			input => input,
			output => button_pressed);
	process (clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				buff_output <= '0';
				output <= '0';
			else
				if (button_pressed='1') then
					buff_output <= not buff_output;
				end if;
				output <= buff_output;
			end if;
		end if;
	end process;
end Behavioral;

