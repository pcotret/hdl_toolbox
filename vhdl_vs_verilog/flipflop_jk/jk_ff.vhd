library IEEE;
use IEEE.std_logic_1164.all;
entity jk_ff is
port (j   : in  std_logic;
      k   : in  std_logic;
      clk : in  std_logic;
      q   : out std_logic);
end entity jk_ff;

architecture behav of jk_ff is
    signal q_temp: std_logic;
    begin
    process(clk)
    begin
        if rising_edge(clk) then
            if j='0' and k='0' then
                q_temp <= q_temp;
                elsif j='0' and k='1' then
                q_temp <= '0';
                    elsif j='1' and k='0' then
                q_temp <= '1';
                        else
                q_temp <= not(q_temp);
                        end if;
        end if;
    end process;
    q<=q_temp; 
end architecture behav;