----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2019 14:23:19
-- Design Name: 
-- Module Name: ex01 - Behavioral
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

entity ex01 is
    port (BTN_D, BTN_G: in bit;
          LED_1_0: out integer range 0 to 3);
end ex01;

architecture Behavioral of ex01 is
begin
    process (BTN_D, BTN_G)
    variable compte: integer range 0 to 3;
    begin
    if BTN_D'event AND BTN_D = '1' AND BTN_G='0' THEN
        compte:= compte + 1;
    end if;
    IF BTN_G'event and BTN_G = '1' THEN compte := 0;
    end if;
    LED_1_0 <= compte;
 end process;
end Behavioral;
