----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2019 14:42:11
-- Design Name: 
-- Module Name: non_reset - Behavioral
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

ENTITY feu IS
   PORT (
     CLK, BTN_C : IN BIT;
     LED_3_0, LED_7_4 : OUT INTEGER RANGE 0 TO 15
   );
END feu; 
ARCHITECTURE Behavioural OF feu IS
   ALIAS reset IS BTN_C;
   SIGNAL clk_out : BIT := '0';
   CONSTANT clock_divisor : INTEGER := 200000000;
BEGIN
   clock_divider : PROCESS (CLK, reset)
   VARIABLE c : INTEGER RANGE 0 TO clock_divisor - 1 := 0;
   BEGIN
     IF reset = '1' THEN
        c := 0;
        clk_out <= '0';
     ELSIF CLK'EVENT AND CLK = '1' THEN
        IF c < (clock_divisor - 1) / 2 THEN
           c := c + 1;
           clk_out <= '0';
        ELSIF c = (clock_divisor - 1) THEN
           c := 0;
           clk_out <= '0';
     	ELSE 
           c := c + 1; 
           clk_out <= '1';
     	END IF;
     END IF;
   END PROCESS;
   PROCESS (clk_out)
   VARIABLE c : INTEGER RANGE 0 TO 20; --temps total d'un cycle
   VARIABLE etat : INTEGER RANGE 0 TO 3;
   VARIABLE feux_A, feux_B : INTEGER RANGE 0 TO 4;
     BEGIN
        IF (clk_out'EVENT AND clk_out = '1') THEN
	       IF c < 8 THEN
   	         c := c + 2;
             etat := 0;
           ELSIF c < 10 THEN
             c := c + 2;
             etat := 1;
           ELSIF c < 18 THEN
             c := c + 2;
             etat := 2;
           ELSIF c < 20 THEN
             c := c + 2;
             etat := 3;
           END IF;
           IF c = 20 THEN
	          c := 0; 
	   END IF; 
	END IF; 

        CASE etat IS
           WHEN 0 => feux_A := 1; feux_B := 4; --le feu de l'axe A est vert et le feu de l'axe B est rouge
           WHEN 1 => feux_A := 2; feux_B := 4; --le feu de l'axe A est orange, le feu de l'axe B est rouge
           WHEN 2 => feux_A := 4; feux_B := 1; --le feu de l'axe A est rouge, le feu de l'axe B est vert
           WHEN 3 => feux_A := 4; feux_B := 2; --le feu de l'axe A est rouge et le feu de l'axe B est orange
           WHEN OTHERS => feux_A := 1; feux_B := 4;
        END CASE;
        LED_3_0 <= feux_A;
        LED_7_4 <= feux_B;
     END PROCESS;
END Behavioural;

