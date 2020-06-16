library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-----------------------------------------------------------

entity Interconnect_tb is

end entity Interconnect_tb;

-----------------------------------------------------------

architecture Stimulus of Interconnect_tb is

	-- Testbench DUT generics


	-- Testbench DUT ports
	signal EnPC     : std_logic;
	signal RegWr    : std_logic;
	signal RegDst   : std_logic;
	signal AluSrc   : std_logic;
	signal AluSrc2   : std_logic;
	signal Branch   : std_logic;
	signal loadPC   : std_logic;
	signal MemtoReg : std_logic;
	signal MemWr    : std_logic;
	signal RI       : std_logic;
	signal clk      : std_logic;
	signal AluOp    : std_logic_vector(3 downto 0);
	signal inst     : std_logic_vector(15 downto 0);
	signal rst 		: std_logic;



begin
	-----------------------------------------------------------
	-- Clocks and Reset
	-----------------------------------------------------------
	CLK_GEN : process
	begin
		clk <= '1';
		wait for 20 ns;
		clk <= '0';
		wait for 20 ns;
	end process CLK_GEN;

------------------------------
	-- Testbench Stimulus
	-----------------------------------------------------------
	--first instruction
	stim : process
	begin
	rst <= '1';
	wait for 50 ns;
	rst <= '0';
	wait ;
	end process;
	-----------------------------------------------------------
	-- Entity Under Test
	-----------------------------------------------------------
	Datapath : entity work.Datapath(Behavioral)
		port map (
			EnPC     => EnPC,
			loadPC   => loadPC,
			Branch   => Branch,
			RegWr    => RegWr,
			RegDst   => RegDst,
			rst      => rst,
			AluSrc   => AluSrc,
			AluSrc2  => AluSrc2,
			MemtoReg => MemtoReg,
			MemWr    => MemWr,
			RI       => RI,
			clk      => clk,
			AluOp    => AluOp,
			inst     => inst
		);

	ControlUnit : entity work.ControlUnit(Behavioral)
		port map (
			clk      => clk,
			rst      => rst,
			opcode   => inst(15 downto 13),
			func     => inst(3 downto 0),
			Branch   => Branch,
			EnPC     => EnPC,
			loadPC 	 => loadPC,
			RI       => RI,
			RegWr    => RegWr,
			RegDst   => RegDst,
			ALUSrc   => ALUSrc,
			AluSrc2  => AluSrc2,
			ALUOp    => ALUOp,
			MemWr    => MemWr,
			MemtoReg => MemtoReg
		);
end Stimulus;
