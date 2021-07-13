library IEEE;
use IEEE.std_logic_1164.all;
entity t_ff is
  port(clk  :in  std_logic;
       rstn :in  std_logic;
       t    :in  std_logic;
       q    :out std_logic);
  end entity t_ff;

  architecture behav of t_ff is
    signal q_temp : std_logic:='0';
    begin
      process(clk)
      begin
        if rising_edge(clk) then
          if rstn='0' then
            q_temp<='0';
          else
            if t='1' then
              q_temp <= not(q_temp);
              else
              q_temp <= q_temp;
              end if;
            end if;
          end if;
      end process;
      q<= q_temp;
      end architecture behav;
