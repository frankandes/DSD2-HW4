library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Ex3 is 
    port (
        sw : in std_logic_vector(1 downto 0);
        bulb : out std_logic;
        sw_out : out std_logic_vector(1 downto 0)
    );

end Ex3;

architecture Behavioral of Ex3 is
    signal sw_not : std_logic_vector(1 downto 0);
    signal and_int : std_logic_vector(1 downto 0);

begin

    sw_not <= not sw;
    and_int(1) <= sw(0) and sw_not(1);
    and_int(0) <= sw(1) and sw_not(0);
    bulb <= and_int(0) or and_int(1);
    sw_out <= sw;

end Behavioral;