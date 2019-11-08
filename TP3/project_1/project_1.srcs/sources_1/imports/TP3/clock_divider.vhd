-- Diviseur de fréquence.
--
-- Divise la fréquence du singal clock_in par divisor :
-- f(clock_out) = f(clock_in) / divisor
-- Le signal de réinitialisation reset est asynchrone.
entity clock_divider is
    -- La clause generic permet de définir des paramètres
    -- pour l'entité qui pourront être modifiés lors de 
    -- l'instanciation du composant.
    generic(divisor : integer := 100000000);
    port(clock_in, reset : in bit;
         clock_out : out bit);
end clock_divider;

architecture Behavioral of clock_divider is
begin 
    process(clock_in, reset)
        variable c : integer range 0 to divisor - 1 := 0;
    begin
        if reset = '1' then
            c := 0;
        elsif clock_in'event and clock_in = '1' then
            if c < (divisor - 1) then
                c := c + 1;
            else
                c := 0;
            end if;
        end if;
        
        if c < (divisor - 1) / 2 then
            clock_out <= '0';
        else
            clock_out <= '1';
        end if;
    end process;
end Behavioral;
