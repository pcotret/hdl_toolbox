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
-- Summary: classic decoder for a 7-segment display.

-- Libraries
library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

-- Entity
entity seg_decoder is
port(-- Digits
     d3:in std_logic;
     d2:in std_logic;
     d1:in std_logic;
     d0:in std_logic;
     -- Segments
     a:out std_logic;
     b:out std_logic;
     c:out std_logic;
     d:out std_logic;
     e:out std_logic;
     f:out std_logic;
     g:out std_logic);
end entity seg_decoder;

-- Architecture
architecture behav of seg_decoder is
  begin
    a <= not(d1) and ((not(d3) and not(d2) and d0) or (d2 and not(d0)));
    b <= not(d3) and d2 and (d1 xor d0);
    c <= not(d2) and d1 and not(d0);
    d <= (not(d3) and not(d2) and not(d1) and d0) or (not(d3) and d2 and not(d1) and not(d0)) or (not(d3) and d2 and d1 and d0);
    e <= (not(d3) and d0) or (not(d3) and d2 and not(d1)) or (not(d2) and not(d1) and d0);
    f <= (not(d3) and not(d2) and d0) or (not(d3) and d1 and d0) or (not(d2) and d1);
    g <= (not(d3) and not(d2) and not(d1)) or (not(d3) and d2 and d1 and d0);
end architecture behav;
