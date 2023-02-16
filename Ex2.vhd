library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Ex2 is
    port (
        d_in : in std_logic;
        q_out : out std_logic
        clk : in std_logic
        rst : in std_logic
    );
end Ex2;

architecture Behavioral of Ex2 is
    signal qint : std_logic_vector(3 downto 0);

begin

    internal : process (clk, rst)
        begin
            if (rst = '1') then
                qint <= (others => '0');
            elsif (rising_edge(clk)) then
                qint <= qint(2 downto 0) & d_in;
            end if;
        end process;

    output : process (qint)
        begin
            if (qint = "0111") then
                q_out <= '1';
            else
                q_out <= '0';
            end if;
        end process;

end Behavioral;