----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.09.2019 15:36:39
-- Design Name: 
-- Module Name: exercice2 - Behavioral
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

entity add1 is
    port (cin, a, b: IN BIT;
          s,cout: OUT BIT);
end add1;

architecture Ex of add1 is

begin 
    cout <= (a AND b) OR (cin AND (a XOR b));
    s <= (cin XOR a) XOR b;
end Ex;

entity add2 is
--  Port ( );
    Port (SW_1_0, SW_3_2: IN BIT_VECTOR (1 DOWNTO 0); LED_1_0: OUT BIT_VECTOR (1 DOWNTO 0); cout: OUT BIT);
end add2;

architecture Behavioral of add2 is
signal c: BIT;
component add1 is
    port (a,b,cin: IN BIT; s,cout: OUT BIT);
end component add1;
begin
    A0: add1 PORT MAP (SW_1_0(0), SW_3_2(0), '0', LED_1_0(0), c);
    A1: add1 PORT MAP (SW_1_0(1), SW_3_2(1), c, LED_1_0(1), cout);
end Behavioral;
