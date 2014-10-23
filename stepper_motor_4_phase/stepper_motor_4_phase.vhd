library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stepper_motor_4_phase is
    port
    (
        clk     : in    std_logic;
        clk_en  : in    std_logic;
        step    : in    signed(255 downto 0);
        
        A       : out   std_logic;
        B       : out   std_logic;
        C       : out   std_logic;
        D       : out   std_logic
    );
end stepper_motor_4_phase;

architecture stepper_motor_4_phase_arch of stepper_motor_4_phase is
    signal out_vector   : std_logic_vector(3 downto 0) := b"0011";
begin
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(clk_en = '1') then
                out_vector <= out_vector(2 downto 0) & out_vector(3);
            end if;
        end if;
    end process;
    
    A <= out_vector(0);
    B <= out_vector(1);
    C <= out_vector(2);
    D <= out_vector(3);
    
end stepper_motor_4_phase_arch;