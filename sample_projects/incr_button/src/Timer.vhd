----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrew Powell
-- 
-- Create Date:    23:40:09 08/21/2015 
-- Design Name: 
-- Module Name:    Timer - Behavioral 
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

entity Timer is
	generic (	
		WIDTH				: integer := 32;
		RESET_VALUE		: integer := 100000000);
	port (		
		clock				: in std_logic;
		reset				: in std_logic;
		ready				: out std_logic);
end Timer;

architecture Behavioral of Timer is
	signal counter	: std_logic_vector((WIDTH-1) downto 0);
begin
	process (clock)
	begin
		if (clock'event and clock='1') then
			if (reset='1') then
				counter <= conv_std_logic_vector(0,WIDTH);
				ready <= '0';
			else
				if (counter=RESET_VALUE) then
					ready <= '1';
					counter <= conv_std_logic_vector(0,WIDTH);
				else
					ready <= '0';
					counter <= counter+1;
				end if;
			end if;
		end if;
	end process;
end Behavioral;



