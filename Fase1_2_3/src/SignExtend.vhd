library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.all;

entity SignExtend is 
	port( unext		:	in		std_logic_vector(6	downto 0);
			extended : 	out	std_logic_vector(7 downto 0));
end SignExtend;

architecture Behavioral of SignExtend is

begin 
	extended(7) <= unext(6);
	extended(6 downto 0) <=  unext(6 downto 0);
end Behavioral;
