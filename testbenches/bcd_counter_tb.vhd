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
-- Summary: Testbench for the BCD counter (0 to 9)

-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- Needed for arithmetics
library work;
use work.all;

-- Entity
entity bcd_counter_tb is
end entity bcd_counter_tb;

-- Architecture
architecture behav of bcd_counter_tb is
-- Constants declaration
constant CLK_PERIOD:time:=10 ns;
-- Signals declaration
signal clk : std_logic;
signal en  : std_logic;
signal raz : std_logic;
signal d3  : std_logic;
signal d2  : std_logic;
signal d1  : std_logic;
signal d0  : std_logic;
-- Component declaration
component bcd_counter is
port(clk : in  std_logic;
     en  : in  std_logic;
     raz : in  std_logic;
     d3  : out std_logic;
     d2  : out std_logic;
     d1  : out std_logic;
     d0  : out std_logic);
end component bcd_counter;
begin
	-- Component mapping
	uut0:bcd_counter
	port map(clk =>clk,
             en  =>en ,
             raz =>raz,
             d3  =>d3 ,
             d2  =>d2 ,
             d1  =>d1 ,
             d0  =>d0 );
	-- Clock process
	process
	begin
		clk <='0';
		wait for CLK_PERIOD/2;
		clk <='1';
		wait for CLK_PERIOD/2;
	end process;
	-- Reset process
	process
	begin
		raz <='1';
		wait for 3*CLK_PERIOD;
		raz <='0';
		wait;
	end process;
	-- Enable process
	process
	begin
		en <='0';
		wait for 3*CLK_PERIOD;
		en <='1';
		wait;
	end process;
end architecture behav;
