library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
    generic
    (
        NUMBER_OF_CLOCKS    : integer := 5                              --! The number of times the clock should be divided
    );
    port
    (
        clk     : in    std_logic;                                      --! The input clock
        clk_en  : in    std_logic;                                      --! Synchronous clock enable
        
        clk_out : out   std_logic_vector(NUMBER_OF_CLOCKS - 1 downto 0) --! The output clocks (includes input clock).
    );
end clock_divider;

architecture clock_divider_arch of clock_divider is
    signal temp_clk : unsigned(NUMBER_OF_CLOCKS - 2 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(clk_en = '1') then
                temp_clk <= temp_clk + 1;       --! This counter will roll over, but that is what we want it to do.
            end if;
        end if;
    end process;
    
    clk_out <= std_logic_vector(temp_clk) & clk;
    
end clock_divider_arch;