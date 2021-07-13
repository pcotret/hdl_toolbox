library IEEE;
use IEEE.std_logic_1164.all;
entity d_ff is
   port(d    : in  std_logic;
        rstn : in  std_logic;
        clk  : in  std_logic;
        q    : out std_logic);
   end entity d_ff;
architecture behav of d_ff is
   begin
      process(clk)
      begin
         if rising_edge(clk) then
            if (rstn='0') then
               q<='0';
               else
               q<=d;
               end if;
            end if;
      end process;
      end architecture behav;