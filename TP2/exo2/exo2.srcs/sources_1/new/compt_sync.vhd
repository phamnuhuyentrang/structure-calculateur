----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2019 14:50:55
-- Design Name: 
-- Module Name: compt_sync - Behavioral
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

entity compt_sync is
--  Port ( );
    port(BTN_D, BTN_G: in bit;
         LED_1_0: out integer range 0 to 3);
end compt_sync;

architecture Behavioral of compt_sync is
begin
    process (BTN_D)
        variable compte: integer range 0 to 3;
    begin
        if (BTN_D'event AND BTN_D='1') then
            if BTN_G = '0' then compte:= compte+1;
            else compte:=0; 
            end if;
        end if;
        LED_1_0 <= compte;
    end process;
end Behavioral;
