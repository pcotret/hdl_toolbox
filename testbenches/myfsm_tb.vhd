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
-- Summary: testbench for a simple FSM example

-- Libraries
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
LIBRARY work;
use work.all;

-- Entity
ENTITY myfsm_tb IS 
END entity myfsm_tb;

-- Architecture
ARCHITECTURE rtl OF myfsm_tb IS
-- Constants declaration
constant IN_PERIOD:time:=40 ns;
constant CLK_PERIOD:time:=10 ns;
-- Signals declaration
signal clock   : STD_LOGIC;
signal input1  : STD_LOGIC;
signal output1 : STD_LOGIC;
signal output2 : STD_LOGIC;
-- Component declaration
component myfsm IS 
PORT(clock   : IN  STD_LOGIC;
     input1  : IN  STD_LOGIC;
     output1 : OUT STD_LOGIC;
     output2 : OUT STD_LOGIC);
END component myfsm;

begin
	-- Component mapping
	uut0:myfsm
	port map(clock   => clock,
			 input1  => input1,
			 output1 => output1,
			 output2 => output2);
	-- Clock process
	process
	begin
		clock <='0';
		wait for CLK_PERIOD/2;
		clock <='1';
		wait for CLK_PERIOD/2;
	end process;
	-- Input process
	process
	begin
		input1 <='0';
		wait for IN_PERIOD/2;
		input1 <='1';
		wait for IN_PERIOD/2;
	end process;
end architecture rtl;
