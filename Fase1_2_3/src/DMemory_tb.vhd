library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DMemory_tb is

end entity DMemory_tb;

-----------------------------------------------------------

architecture testbench of DMemory_tb is

	signal clk  : std_logic;
	signal Addr : std_logic_vector(7 downto 0);
	signal WD   : std_logic_vector(7 downto 0);
	signal WE   : std_logic;
	signal RD   : std_logic_vector(7 downto 0);

begin
	-----------------------------------------------------------
	-- Clocks and Reset
	-----------------------------------------------------------
	CLK_GEN : process
	begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process CLK_GEN;



	-----------------------------------------------------------
	-- Testbench Stimulus
	-----------------------------------------------------------
	stimul : process
	begin
		Addr <= "00000000";
		WE <= '0';
		wait for 2 ns;
		Addr <= "00000001";
		WE <= '0';
		wait for 2 ns;
	end process; 
	----------------------------------------------------------
	-- Entity Under Test
	-----------------------------------------------------------
	DUT : entity work.DMemory(Behavioral)
		port map (
			clk  => clk,
			Addr => Addr,
			WD   => WD,
			WE   => WE,
			RD   => RD
		);

end architecture testbench;