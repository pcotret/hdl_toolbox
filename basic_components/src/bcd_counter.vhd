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
-- Summary: a BCD counter (0 to 9)

-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- Needed for arithmetics
library work;
use work.all;

-- Entity
entity bcd_counter is
port(-- Control ports
     clk : in  std_logic;
     en  : in  std_logic;
     raz : in  std_logic;
     -- Digits
     d3  : out std_logic;
     d2  : out std_logic;
     d1  : out std_logic;
     d0  : out std_logic);
end entity bcd_counter;

-- Architecture
architecture behav of bcd_counter is
-- Signals declaration
signal counter_val: std_logic_vector(3 downto 0);
  begin
    -- Main process
    main_proc:process(clk,en,raz)
    begin
      if raz='1' then
        counter_val <= (others => '0');
      elsif clk'event and clk='1' then
        if en='1' then
          counter_val <= counter_val + 1;
			 if counter_val>=9 then
				counter_val<=(others=>'0');
			 end if;
        end if;
      end if;
    end process main_proc;
    d3 <= counter_val(3);
    d2 <= counter_val(2);
    d1 <= counter_val(1);
    d0 <= counter_val(0);
end architecture behav;
