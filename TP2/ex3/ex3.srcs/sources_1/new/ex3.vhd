----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2019 15:59:26
-- Design Name: 
-- Module Name: ex3 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ex3 is
--  Port ( );
    port (SW_0, BTN_D: in bit;
          LED_0: out bit;
          LED_7_4: out integer range 0 to 5);
end ex3;

architecture Behavioral of ex3 is
begin
    process (BTN_D)
    variable state: integer range 0 to 5;
    begin
        if (BTN_D'event AND BTN_D = '1') then
            case state is
                when 0 => if SW_0 = '1' then state :=1; end if;
                when 1 => if SW_0 = '1' then state :=2; else state :=0; end if;
                when 2 => if SW_0 = '0' then state :=3; else state :=0; end if;
                when 3 => if SW_0 = '1' then state :=4; else state :=0; end if;
                when 4 => if SW_0 = '0' then state :=5; else state :=0; end if;
                when others => state :=0;
            end case;
        end if;
        if state = 5 then 
            LED_0 <= '1';
        else
            LED_0 <= '0';
        end if;
        LED_7_4 <= state;
    end process;
end Behavioral;
