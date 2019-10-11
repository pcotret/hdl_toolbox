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
-- Summary: "Gates machine": simple logic and clocked versions

-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- Needed for arithmetics
library work;
use work.all;

-- Entity
entity gates is
port(a_in          : in  std_logic;
     b_in          : in  std_logic;
     clk           : in  std_logic;
     and_out       : out std_logic;
	 or_out        : out std_logic;
	 xor_out           : out std_logic;
	 and_out_gated : out std_logic;
	 or_out_gated  : out std_logic;
	 xor_out_gated     : out std_logic	 
	);
end entity gates;

-- Architecture
-- Solution #1
architecture rtl of gates is
begin
	process(clk)
	begin
		and_out_gated <= a_in and b_in;
		or_out_gated  <= a_in or b_in;
		xor_out_gated     <= a_in xor b_in;
	end process;
	and_out <= a_in and b_in;
	or_out  <= a_in or b_in;
	xor_out     <= a_in xor b_in;
end architecture rtl;
