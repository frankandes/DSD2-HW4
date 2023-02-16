library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Ex2TB is
end Ex2TB;

architecture Behavioral of Ex2TB is

    signal d_in, clk, rst : std_logic := '0';
    signal q_out : std_logic;
    constant clk_per : time := 20 ns;

begin

    uut : entity work.Ex2
        port map (
            d_in => d_in,
            clk => clk,
            rst => rst,
            q_out => q_out
        );

    clk <= not clk after clk_per/2;

    stimuli : process
    begin
        rst <= '1';
        wait until clk = '0';
        assert q_out = '0' report "error1, q_out is " & std_logic'image(q_out) & " but expected to be 0";

        rst <= '0';
        d_in <= '0';
        wait for 2*clk_per;
        assert q_out = '0' report "error2, q_out is " & std_logic'image(q_out) & " but expected to be 0";

        d_in <= '1';
        wait for 3*clk_per;
        assert q_out = '1' report "error3, q_out is " & std_logic'image(q_out) & " but expected to be 1";
        
        wait for 2*clk_per;
        assert q_out = '0' report "error4, q_out is " & std_logic'image(q_out) & " but expected to be 0";

        d_in <= '0';
        wait for 2*clk_per;
        assert q_out = '0' report "error5, q_out is " & std_logic'image(q_out) & " but expected to be 0";

        d_in <= '1';
        wait for 2*clk_per;
        assert q_out = '0' report "error6, q_out is " & std_logic'image(q_out) & " but expected to be 0";

        d_in <= '0';
        wait for 2*clk_per;
        assert q_out = '0' report "error7, q_out is " & std_logic'image(q_out) & " but expected to be 0";

        wait;
    end process stimuli;

end Behavioral;



