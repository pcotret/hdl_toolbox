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
-- Summary: Testbench for the simple ALU - Hardcoded for a 4-bit ALU

-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity
entity alu_tb is
end entity alu_tb;

-- Architecture
architecture rtl of alu_tb is
-- Constants declaration
constant DATA_WIDTH:integer:=4;
constant TIME1:time:=100 ns;
constant TIME2:time:=250 ns;
constant TIME3:time:=175 ns;
constant CLK_PERIOD:time:=10 ns;
-- Signals declaration
signal clk       : std_logic;
signal rst       : std_logic;
signal data1_in  : std_logic_vector(DATA_WIDTH-1 downto 0);
signal data2_in  : std_logic_vector(DATA_WIDTH-1 downto 0);
signal opcode    : std_logic_vector(2 downto 0);
signal carry_out : std_logic;
signal flag      : std_logic;
signal data_out  : std_logic_vector(DATA_WIDTH-1 downto 0);
-- Component declaration
component alu is
generic(DATA_WIDTH:integer:=4);
port(clk                : in  std_logic;
     rst                : in  std_logic;
	 data1_in, data2_in : in  std_logic_vector(DATA_WIDTH-1 downto 0);
     opcode             : in  std_logic_vector(2 downto 0);
     carry_out          : out std_logic;
     flag               : out std_logic;
     data_out           : out std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end component alu;
begin
	-- Component mapping
	uut0:alu
	generic map(DATA_WIDTH=>4)
	port map(clk       => clk,
			 rst       => rst,
		     data1_in  => data1_in,
			 data2_in  => data2_in,
			 opcode    => opcode,
			 carry_out => carry_out,
			 flag      => flag,
			 data_out  => data_out
			);
	-- Reset process
	process
	begin
		rst <='1';
		wait for 3*CLK_PERIOD;
		rst <='0';
		wait;
	end process;
	-- Clock process
	process
	begin
		clk <='0';
		wait for CLK_PERIOD/2;
		clk <='1';
		wait for CLK_PERIOD/2;
	end process;
	-- Data1 process
	process
	begin
		data1_in <= "0000";
		wait for TIME1/2;data1_in <= "0001";
		wait for TIME1/2;data1_in <= "0010";
		wait for TIME1/2;data1_in <= "0011";
		wait for TIME1/2;data1_in <= "0100";
		wait for TIME1/2;data1_in <= "0101";
		wait for TIME1/2;data1_in <= "0110";
		wait for TIME1/2;data1_in <= "0111";
		wait for TIME1/2;data1_in <= "1000";
		wait for TIME1/2;data1_in <= "1001";
		wait for TIME1/2;data1_in <= "1010";
		wait for TIME1/2;data1_in <= "1011";
		wait for TIME1/2;data1_in <= "1100";
		wait for TIME1/2;data1_in <= "1101";
		wait for TIME1/2;data1_in <= "1110";
		wait for TIME1/2;data1_in <= "1111";
		wait for TIME1/2;data1_in <= "0000";
	end process;
	-- Data2 process
	process
	begin
		data2_in <= "0000";
		wait for TIME2/2;data2_in <= "0001";
		wait for TIME2/2;data2_in <= "0010";
		wait for TIME2/2;data2_in <= "0011";
		wait for TIME2/2;data2_in <= "0100";
		wait for TIME2/2;data2_in <= "0101";
		wait for TIME2/2;data2_in <= "0110";
		wait for TIME2/2;data2_in <= "0111";
		wait for TIME2/2;data2_in <= "1000";
		wait for TIME2/2;data2_in <= "1001";
		wait for TIME2/2;data2_in <= "1010";
		wait for TIME2/2;data2_in <= "1011";
		wait for TIME2/2;data2_in <= "1100";
		wait for TIME2/2;data2_in <= "1101";
		wait for TIME2/2;data2_in <= "1110";
		wait for TIME2/2;data2_in <= "1111";
		wait for TIME2/2;data2_in <= "0000";
	end process;
	-- Opcode process
	process
	begin
		opcode <= "000";
		wait for TIME3/2;opcode <= "001";
		wait for TIME3/2;opcode <= "010";
		wait for TIME3/2;opcode <= "011";
		wait for TIME3/2;opcode <= "100";
		wait for TIME3/2;opcode <= "101";
		wait for TIME3/2;opcode <= "110";
		wait for TIME3/2;opcode <= "111";
		wait for TIME3/2;opcode <= "000";
	end process;
end architecture rtl;
