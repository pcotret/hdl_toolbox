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
-- Summary: a simple FSM example

-- Libraries
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
LIBRARY work;
use work.all;

-- Entity
ENTITY myfsm IS 
PORT(clock   : IN  STD_LOGIC;
     input1  : IN  STD_LOGIC;
     output1 : OUT STD_LOGIC;
     output2 : OUT STD_LOGIC);
END entity myfsm;

-- Architecture
ARCHITECTURE rtl OF myfsm IS
-- Signals and states declaration
type state_type is (c0,c1,c2);
signal next_state : state_type;
signal current_state : state_type;
BEGIN 
	-- Process #1 - Clocked process
	fsm_proc:process(clock)
	begin
		if clock'event and clock='1' then
			current_state <= next_state; -- Next state
		end if;
	end process fsm_proc;
	-- Process #2 - Decoding of next state
	decoding_proc:process(current_state)
	begin
	case current_state is
		when c0 =>
			output1 <= '0';
			output2 <= '1';
		when c1 =>
			output1 <= '0';
			output2 <= '0';
		when c2 =>
			output1 <= '1';
			output2 <= '0';			
	end case;
	end process decoding_proc;
	-- Process #3 - Output coding
	output_proc:process(current_state,input1)
	begin
	case current_state is
		when c0 =>
			next_state <= c1;
		when c1 =>
			if input1='1' then
				next_state <= c2;
			else
				next_state <= c0;
			end if;
		when c2 =>
			next_state <= c0;
	end case;
end process output_proc;
end architecture rtl;
