library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IMemory is
	 port ( 
	 		  clk	: in  std_logic;
			  EN 	: in  std_logic;
           RA 	: in  std_logic_vector(7 downto 0);
			  RD 	: out std_logic_vector(15 downto 0));
end IMemory;

architecture Behavioral of IMemory is
	subtype TDataWord is std_logic_vector(15 downto 0);
	type TROM is array (0 to 7) of TDataWord;
	constant rom: TROM := (X"E180", X"E201", X"4E01", X"2E51", X"C202",X"5601",X"2E51",X"C283");
	
	--							 3bits	  3 bits   3 bits		 7 bits
	--							[opcode]		[rs]		[rt]		[address]
	--LW $0, $3, 0			  111			000		 011		 0000000
	--LW $0, $4, 1			  111		 	000		 100		 0000001
	--beq $3,$4,2			  010			011		 100		 0000001


	--sub


	--SW	$0, $4, 2		  110			000		 100		 0000010
	--beq $5,$4,1			  010			101      100 		 0000001
	--sub
	--SW	$0, $5, 3		  110			000		 101		 0000011


	
	begin
	process(EN,clk)
		begin
		if(rising_edge(clk))then
			if(EN = '1') then 
				RD <= rom(to_integer(unsigned(RA(2 downto 0))));
			end if;
		end if;
	end process;
end Behavioral;

