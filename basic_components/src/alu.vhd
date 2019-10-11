-- The MIT License (MIT)
-- Copyright (c) 2016 pascal.cotret@protonmail.ch
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
-- Author: Pascal Cotret
-- Contact: pascal.cotret@protonmail.ch
-- Date: 2016-03-01
-- Summary: A simple ALU with configurable data width
-- 000 Addition
-- 001 Test or difference
-- 010 AND
-- 011 OR
-- 100 XOR
----------------------------------------------------------------------------

-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity
entity alu is
generic(DATA_WIDTH:integer:=4); -- 4-bits wide in/out ports
port(clk                : in std_logic;
     rst                : in std_logic; -- Asychronous reset
     data1_in, data2_in : in  std_logic_vector(DATA_WIDTH-1 downto 0);
     opcode             : in  std_logic_vector(2 downto 0);
     carry_out          : out std_logic;
     flag               : out std_logic;
     data_out           : out std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end entity alu;

-- Architecture
architecture rtl of alu is
-- Signals declaration
signal tmp: std_logic_vector(DATA_WIDTH downto 0);
begin
	-- Main process
	main_proc:process(clk, rst) is
	begin
        if rst='1' then
            carry_out <= '0';
            flag      <= '0';
            data_out  <= (others=>'0');
        elsif clk'event and clk='1' then
            flag <= '0';
		    case opcode is
				when "000" =>
				-- For the addition, the output result is on 4 bits and
				-- we eventually get a carry if a fifth bit is needed.
					tmp   	  <= std_logic_vector((unsigned('0'&data1_in)+unsigned(data2_in)));
					data_out  <= tmp(3 downto 0);
					carry_out <= tmp(4);
				when "001" =>
				-- For the substraction, a flag is held when data2>data1.
				-- Furthermore, this part performs |data1-data2|
					if(data1_in>=data2_in) then
						data_out <= std_logic_vector(unsigned(data1_in)-unsigned(data2_in));
						flag     <= '0';
					else
						data_out <= std_logic_vector(unsigned(data2_in)-unsigned(data1_in));
						flag     <= '1';
					end if;
				when "010" =>
					data_out <= data1_in and data2_in;
				when "011" =>
					data_out <= data1_in or data2_in;
				when "100" =>
					data_out <= data1_in xor data2_in;
				when others =>
					tmp       <= (others=>'0');
					data_out  <= tmp(3 downto 0);
					carry_out <= tmp(4);
			end case;
		end if;
	end process main_proc;
end architecture rtl;
