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
-- Summary: testbench for a 7-segment display.

-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

-- Entity
entity seg_decoder_tb is
end entity seg_decoder_tb;

-- Architecture
architecture behav of seg_decoder_tb is
-- Constants declaration
constant IN_PERIOD:time:=10 ns;
-- Signals declaration
signal d3 : std_logic;
signal d2 : std_logic;
signal d1 : std_logic;
signal d0 : std_logic;
signal a  : std_logic;
signal b  : std_logic;
signal c  : std_logic;
signal d  : std_logic;
signal e  : std_logic;
signal f  : std_logic;
signal g  : std_logic;
-- Component declaration
component seg_decoder is
port(d3:in std_logic;
     d2:in std_logic;
     d1:in std_logic;
     d0:in std_logic;
     a:out std_logic;
     b:out std_logic;
     c:out std_logic;
     d:out std_logic;
     e:out std_logic;
     f:out std_logic;
     g:out std_logic);
end component seg_decoder;
begin
	-- Component mapping
	uut0:seg_decoder
	port map(d3 => d3,
			 d2 => d2,
			 d1 => d1,
			 d0 => d0,
			 a  => a,
			 b  => b,
			 c  => c,
			 d  => d,
			 e  => e,
			 f  => f,
			 g  => g);
	-- Input process
	process
	begin
		d3 <='0';d2 <='0';d1 <='0';d0 <='0';
		wait for IN_PERIOD;
		d3 <='0';d2 <='0';d1 <='0';d0 <='1';
		wait for IN_PERIOD;
		d3 <='0';d2 <='0';d1 <='1';d0 <='0';
		wait for IN_PERIOD;
		d3 <='0';d2 <='0';d1 <='1';d0 <='1';
		wait for IN_PERIOD;
		d3 <='0';d2 <='1';d1 <='0';d0 <='0';
		wait for IN_PERIOD;
		d3 <='0';d2 <='1';d1 <='0';d0 <='1';
		wait for IN_PERIOD;
		d3 <='0';d2 <='1';d1 <='1';d0 <='0';
		wait for IN_PERIOD;
		d3 <='0';d2 <='1';d1 <='1';d0 <='1';
		wait for IN_PERIOD;
		d3 <='1';d2 <='0';d1 <='0';d0 <='0';
		wait for IN_PERIOD;
		d3 <='1';d2 <='0';d1 <='0';d0 <='1';
		wait for IN_PERIOD;
	end process;
end architecture behav;
