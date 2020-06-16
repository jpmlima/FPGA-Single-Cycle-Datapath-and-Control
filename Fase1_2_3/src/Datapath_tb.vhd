library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-----------------------------------------------------------

entity Datapath_tb is

end entity Datapath_tb;

-----------------------------------------------------------

architecture Stimulus of Datapath_tb is

	signal rst		 : std_logic;
	signal EnPC     : std_logic;
	signal RegWr    : std_logic;
	signal RegDst   : std_logic;
	signal AluSrc   : std_logic;
	signal MemtoReg : std_logic;
	signal MemWr    : std_logic;
	signal RI       : std_logic;
	signal clk      : std_logic;
	signal AluOp    : std_logic_vector(3 downto 0);
	signal inst     : std_logic_vector(15 downto 0);

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

	------------------------------
	-- Testbench Stimulus
	------------------------------
	
	--first instruction
	Stim : process
	begin
		
		--state reset
		EnPC     <= '0';
		RI       <= '0';
		EnPC     <= '0';
		RI       <= '0';
		RegWr    <= '0';
		RegDst   <= '0';
		ALUSrc   <= '0';
		ALUOp    <= (others => '0');
		MemWr    <= '0';
		MemtoReg <= '0';
		wait for 80 ns;

		--first instruction
		EnPC 	<= '1';--fetch
		RI 		<= '1';
		RegWr 	<= '0';
		wait for 30 ns;

		EnPC 	<= '0';--decode
		RI 		<= '0';
		wait for 30 ns;

		EnPC 	<= '0';--execute
		RI 		<= '0';
		ALUOp		<= "0000";
		wait for 30 ns;	

		EnPC 	<= '0';--regupdate
		RI 		<= '0';
		RegWr 	<= '1';
		RegDst 	<= '1';
		MemtoReg <= '1';
		ALUSrc 	<=	'1';
		MemWr	<=	'0';
		wait for 30 ns;

		--second instruction
		EnPC 	<= '1';--fetch
		RI 		<= '1';
		RegWr 	<= '0';
		wait for 30 ns;

		EnPC 	<= '0';--decode
		RI 		<= '0';
		wait for 30 ns;

		EnPC 	<= '0';--execute
		RI 		<= '0';
		ALUOp		<= "0000";
		wait for 30 ns;	

		EnPC 	<= '0';--regupdate
		RI 		<= '0';
		RegWr 	<= '1';
		RegDst 	<= '1';
		MemtoReg <= '1';
		ALUSrc 	<=	'1';
		MemWr	<=	'0';
		wait for 30 ns;
				--second instruction
		EnPC 	<= '1';--fetch
		RI 		<= '1';
		wait for 30 ns;

		EnPC 	<= '0';--decode
		RI 		<= '0';
		wait for 30 ns;

		EnPC 	<= '0';--execute
		RI 		<= '0';
		ALUOp		<= "0000";
		wait for 30 ns;	

		EnPC 	<= '0';--regupdate
		RI 		<= '0';
		RegWr 	<= '0';
		RegDst 	<= '1';
		MemtoReg <= '1';
		ALUSrc 	<=	'1';
		MemWr	<=	'0';
		wait for 30 ns;
	
	end process;
	-----------------------------------------------------------
	-- Entity Under Test
	-----------------------------------------------------------
	DUT : entity work.Datapath(Behavioral)
		port map (
			EnPC     => EnPC,
			RegWr    => RegWr,
			RegDst   => RegDst,
			rst      => rst,
			AluSrc   => AluSrc,
			MemtoReg => MemtoReg,
			MemWr    => MemWr,
			RI       => RI,
			clk      => clk,
			AluOp    => AluOp,
			inst     => inst
		);
end Stimulus;