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
-- Summary: the simplest multiplixer with several architecture representations

-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- Needed for arithmetics
library work;
use work.all;

-- Entity
entity mux_2to1 is
port(a_in  : in  std_logic;
     b_in  : in  std_logic;
     sel   : in  std_logic;
     c_out : out std_logic);
end entity mux_2to1;

-- Architecture
-- Solution #1
architecture rtl of mux_2to1 is
begin
	c_out<=a_in when sel='1' else b_in;
end architecture rtl;

-- Solution #2
-- architecture rtl of mux_2to1 is
-- begin
	-- c_out<=(a_in and sel) or (b_in and not(sel));
-- end architecture rtl;

-- Solution #3
-- architecture rtl of mux_2to1 is
-- begin
	-- main_proc:process
	-- begin
		-- case sel is
		-- when '1'    =>
			-- c_out <= a_in;
		-- when '0'    =>
			-- c_out <= b_in;
		-- when others =>
			-- c_out <= b_in;
		-- end case;
	-- end process main_proc;
-- end architecture rtl;

-- Solution #4
-- architecture rtl of mux_2to1 is
-- begin
	-- main_proc:process(a_in,b_in,sel)
	-- begin
		-- if sel='1' then
			-- c_out <= a_in;
		-- else
			-- c_out <= b_in;
		-- end if;
	-- end process main_proc;
-- end architecture rtl;