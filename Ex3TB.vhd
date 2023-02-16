library ieee;
use ieee.std_logic_1164.all;

entity Ex3TB is
end Ex3TB;

architecture Behavioral of Ex3TB is

    signal sw : std_logic_vector(1 downto 0) := (others => '0');
    signal bulb : std_logic;
    signal sw_out : std_logic_vector(1 downto 0);

begin

    uut : entity work.Ex3
        port map(
            sw => sw,
            bulb => bulb,
            sw_out => sw_out
        );

    stimuli : process
    begin
        sw <= "00"
        wait for 10 ns;
        assert (bulb = '0') report "Bulb should be off when both switches are off";
        assert (sw_out = sw) report "sw_out should be equal to sw";

        sw <= "01"
        wait for 10 ns;
        assert (bulb = '1') report "Bulb should be on when switch 1 is on";
        assert (sw_out = sw) report "sw_out should be equal to sw";

        sw <= "10"
        wait for 10 ns;
        assert (bulb = '1') report "Bulb should be on when switch 2 is on";
        assert (sw_out = sw) report "sw_out should be equal to sw";

        sw <= "11"
        wait for 10 ns;
        assert (bulb = '0') report "Bulb should be off when both switches are on";
        assert (sw_out = sw) report "sw_out should be equal to sw";

        wait;
    end process;

end Behavioral;


