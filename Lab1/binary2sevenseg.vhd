-- binary2sevenseg.vhd
-- This component transforms BCD into a form
-- for the 7-seg displays on a DE0 board
-- Author : COMPSYS 201

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity binary2sevenseg  is
   
   port (
      digit 	: 	in std_logic_vector(3 downto 0);
      ss_out 	: 	out std_logic_vector(7 downto 0)
	);
	
end entity binary2sevenseg ;

architecture description of binary2sevenseg  is

	signal ss : std_logic_vector(7 downto 0);

begin

	ss <= 	"11000000" when digit = "0000" else -- 0 is "11000000" for an active low 7-segment display 
			"11111001" when digit = "0001" else -- 1, replace "XXXXXXXX" based on your truth table values seg0[7] to seg0[0]
			"10100100" when digit = "0010" else -- 2
			"10110000" when digit = "0011" else -- 3
			"10011001" when digit = "0100" else -- 4
			"10010010" when digit = "0101" else -- 5
			"10000010" when digit = "0110" else -- 6
			"11111000" when digit = "0111" else -- 7
			"00000000" when digit = "1000" else -- -8
			"01111000" when digit = "1001" else -- -7
			"00000010" when digit = "1010" else -- -6
			"00010010" when digit = "1011" else -- -5
			"00011001" when digit = "1100" else -- -4
			"00110000" when digit = "1101" else -- -3
			"00100100" when digit = "1110" else -- -2
			"01111001" when digit = "1111" else -- -1
			"10000110";
				
	ss_out <= ss;
   
end architecture description;