-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "06/03/2020 07:24:07"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ControlUnit IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	opcode : IN std_logic_vector(2 DOWNTO 0);
	func : IN std_logic_vector(3 DOWNTO 0);
	EnPC : OUT std_logic;
	RI : OUT std_logic;
	RegWr : OUT std_logic;
	RegDst : OUT std_logic;
	ALUSrc : OUT std_logic;
	ALUOp : OUT std_logic_vector(3 DOWNTO 0);
	MemWr : OUT std_logic;
	MemtoReg : OUT std_logic
	);
END ControlUnit;

-- Design Ports Information
-- EnPC	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RI	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RegWr	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RegDst	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUSrc	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUOp[0]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUOp[1]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUOp[2]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUOp[3]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemWr	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemtoReg	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[0]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[1]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[2]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[3]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[2]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[0]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[1]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ControlUnit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_opcode : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_func : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_EnPC : std_logic;
SIGNAL ww_RI : std_logic;
SIGNAL ww_RegWr : std_logic;
SIGNAL ww_RegDst : std_logic;
SIGNAL ww_ALUSrc : std_logic;
SIGNAL ww_ALUOp : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_MemWr : std_logic;
SIGNAL ww_MemtoReg : std_logic;
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \EnPC~output_o\ : std_logic;
SIGNAL \RI~output_o\ : std_logic;
SIGNAL \RegWr~output_o\ : std_logic;
SIGNAL \RegDst~output_o\ : std_logic;
SIGNAL \ALUSrc~output_o\ : std_logic;
SIGNAL \ALUOp[0]~output_o\ : std_logic;
SIGNAL \ALUOp[1]~output_o\ : std_logic;
SIGNAL \ALUOp[2]~output_o\ : std_logic;
SIGNAL \ALUOp[3]~output_o\ : std_logic;
SIGNAL \MemWr~output_o\ : std_logic;
SIGNAL \MemtoReg~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \PS.Reset~feeder_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \PS.Reset~q\ : std_logic;
SIGNAL \opcode[0]~input_o\ : std_logic;
SIGNAL \opcode[2]~input_o\ : std_logic;
SIGNAL \opcode[1]~input_o\ : std_logic;
SIGNAL \op.SW~0_combout\ : std_logic;
SIGNAL \PS.Decode~q\ : std_logic;
SIGNAL \op.NOP~0_combout\ : std_logic;
SIGNAL \op.SW~q\ : std_logic;
SIGNAL \op.ADDI~1_combout\ : std_logic;
SIGNAL \op.INVALID~q\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \PS.Execute~q\ : std_logic;
SIGNAL \NS.WriteMem~0_combout\ : std_logic;
SIGNAL \PS.WriteMem~q\ : std_logic;
SIGNAL \NS.RegUpdate~0_combout\ : std_logic;
SIGNAL \PS.RegUpdate~q\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \PS.Fetch~q\ : std_logic;
SIGNAL \op.LW~0_combout\ : std_logic;
SIGNAL \op.LW~q\ : std_logic;
SIGNAL \op.ADDI~0_combout\ : std_logic;
SIGNAL \op.ADDI~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \op.NOP~q\ : std_logic;
SIGNAL \op.ARITH~0_combout\ : std_logic;
SIGNAL \op.ARITH~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \func[0]~input_o\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \func[1]~input_o\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \func[2]~input_o\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \func[3]~input_o\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \MemtoReg~0_combout\ : std_logic;
SIGNAL \ALT_INV_rst~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_opcode <= opcode;
ww_func <= func;
EnPC <= ww_EnPC;
RI <= ww_RI;
RegWr <= ww_RegWr;
RegDst <= ww_RegDst;
ALUSrc <= ww_ALUSrc;
ALUOp <= ww_ALUOp;
MemWr <= ww_MemWr;
MemtoReg <= ww_MemtoReg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_rst~inputclkctrl_outclk\ <= NOT \rst~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y49_N2
\EnPC~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PS.Fetch~q\,
	devoe => ww_devoe,
	o => \EnPC~output_o\);

-- Location: IOOBUF_X0_Y49_N9
\RI~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PS.Fetch~q\,
	devoe => ww_devoe,
	o => \RI~output_o\);

-- Location: IOOBUF_X0_Y45_N16
\RegWr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PS.RegUpdate~q\,
	devoe => ww_devoe,
	o => \RegWr~output_o\);

-- Location: IOOBUF_X0_Y46_N16
\RegDst~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector2~0_combout\,
	devoe => ww_devoe,
	o => \RegDst~output_o\);

-- Location: IOOBUF_X0_Y47_N23
\ALUSrc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector3~1_combout\,
	devoe => ww_devoe,
	o => \ALUSrc~output_o\);

-- Location: IOOBUF_X0_Y43_N16
\ALUOp[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector7~0_combout\,
	devoe => ww_devoe,
	o => \ALUOp[0]~output_o\);

-- Location: IOOBUF_X0_Y42_N2
\ALUOp[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector6~0_combout\,
	devoe => ww_devoe,
	o => \ALUOp[1]~output_o\);

-- Location: IOOBUF_X0_Y42_N9
\ALUOp[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector5~0_combout\,
	devoe => ww_devoe,
	o => \ALUOp[2]~output_o\);

-- Location: IOOBUF_X0_Y45_N23
\ALUOp[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector4~0_combout\,
	devoe => ww_devoe,
	o => \ALUOp[3]~output_o\);

-- Location: IOOBUF_X0_Y46_N23
\MemWr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PS.WriteMem~q\,
	devoe => ww_devoe,
	o => \MemWr~output_o\);

-- Location: IOOBUF_X0_Y47_N16
\MemtoReg~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MemtoReg~0_combout\,
	devoe => ww_devoe,
	o => \MemtoReg~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X1_Y47_N12
\PS.Reset~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \PS.Reset~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \PS.Reset~feeder_combout\);

-- Location: IOIBUF_X0_Y36_N15
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: CLKCTRL_G4
\rst~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: FF_X1_Y47_N13
\PS.Reset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \PS.Reset~feeder_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PS.Reset~q\);

-- Location: IOIBUF_X0_Y47_N1
\opcode[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(0),
	o => \opcode[0]~input_o\);

-- Location: IOIBUF_X0_Y48_N8
\opcode[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(2),
	o => \opcode[2]~input_o\);

-- Location: IOIBUF_X0_Y48_N1
\opcode[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(1),
	o => \opcode[1]~input_o\);

-- Location: LCCOMB_X1_Y47_N4
\op.SW~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \op.SW~0_combout\ = (!\opcode[0]~input_o\ & (\opcode[2]~input_o\ & \opcode[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[0]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \op.SW~0_combout\);

-- Location: FF_X1_Y47_N1
\PS.Decode\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \PS.Fetch~q\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PS.Decode~q\);

-- Location: LCCOMB_X1_Y47_N18
\op.NOP~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \op.NOP~0_combout\ = (!\rst~input_o\ & \PS.Decode~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datad => \PS.Decode~q\,
	combout => \op.NOP~0_combout\);

-- Location: FF_X1_Y47_N5
\op.SW\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \op.SW~0_combout\,
	ena => \op.NOP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \op.SW~q\);

-- Location: LCCOMB_X1_Y47_N8
\op.ADDI~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \op.ADDI~1_combout\ = (!\opcode[2]~input_o\ & \opcode[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \opcode[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \op.ADDI~1_combout\);

-- Location: FF_X1_Y47_N9
\op.INVALID\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \op.ADDI~1_combout\,
	ena => \op.NOP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \op.INVALID~q\);

-- Location: LCCOMB_X1_Y47_N10
\Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\PS.Decode~q\) # ((\PS.Execute~q\ & \op.INVALID~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PS.Decode~q\,
	datac => \PS.Execute~q\,
	datad => \op.INVALID~q\,
	combout => \Selector10~0_combout\);

-- Location: FF_X1_Y47_N11
\PS.Execute\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector10~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PS.Execute~q\);

-- Location: LCCOMB_X1_Y47_N30
\NS.WriteMem~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \NS.WriteMem~0_combout\ = (\op.SW~q\ & \PS.Execute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \op.SW~q\,
	datad => \PS.Execute~q\,
	combout => \NS.WriteMem~0_combout\);

-- Location: FF_X1_Y47_N31
\PS.WriteMem\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \NS.WriteMem~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PS.WriteMem~q\);

-- Location: LCCOMB_X1_Y47_N6
\NS.RegUpdate~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \NS.RegUpdate~0_combout\ = (\PS.Execute~q\ & (!\op.SW~q\ & !\op.INVALID~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PS.Execute~q\,
	datac => \op.SW~q\,
	datad => \op.INVALID~q\,
	combout => \NS.RegUpdate~0_combout\);

-- Location: FF_X1_Y47_N7
\PS.RegUpdate\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \NS.RegUpdate~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PS.RegUpdate~q\);

-- Location: LCCOMB_X1_Y47_N14
\Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = ((\PS.WriteMem~q\) # (\PS.RegUpdate~q\)) # (!\PS.Reset~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PS.Reset~q\,
	datac => \PS.WriteMem~q\,
	datad => \PS.RegUpdate~q\,
	combout => \Selector8~0_combout\);

-- Location: FF_X1_Y47_N15
\PS.Fetch\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector8~0_combout\,
	clrn => \ALT_INV_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PS.Fetch~q\);

-- Location: LCCOMB_X1_Y47_N2
\op.LW~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \op.LW~0_combout\ = (\opcode[2]~input_o\ & \opcode[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \opcode[2]~input_o\,
	datad => \opcode[0]~input_o\,
	combout => \op.LW~0_combout\);

-- Location: FF_X1_Y47_N3
\op.LW\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \op.LW~0_combout\,
	ena => \op.NOP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \op.LW~q\);

-- Location: LCCOMB_X1_Y47_N0
\op.ADDI~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \op.ADDI~0_combout\ = (\opcode[2]~input_o\ & (!\opcode[0]~input_o\ & !\opcode[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[2]~input_o\,
	datab => \opcode[0]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \op.ADDI~0_combout\);

-- Location: FF_X1_Y47_N19
\op.ADDI\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \op.ADDI~0_combout\,
	sload => VCC,
	ena => \op.NOP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \op.ADDI~q\);

-- Location: LCCOMB_X1_Y47_N24
\Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\PS.RegUpdate~q\ & ((\op.LW~q\) # (\op.ADDI~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \op.LW~q\,
	datac => \op.ADDI~q\,
	datad => \PS.RegUpdate~q\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X1_Y47_N20
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\opcode[0]~input_o\) # ((\opcode[2]~input_o\) # (\opcode[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[0]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: FF_X1_Y47_N21
\op.NOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Equal0~0_combout\,
	ena => \op.NOP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \op.NOP~q\);

-- Location: LCCOMB_X1_Y47_N26
\op.ARITH~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \op.ARITH~0_combout\ = (\opcode[0]~input_o\ & (!\opcode[2]~input_o\ & !\opcode[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opcode[0]~input_o\,
	datac => \opcode[2]~input_o\,
	datad => \opcode[1]~input_o\,
	combout => \op.ARITH~0_combout\);

-- Location: FF_X1_Y47_N27
\op.ARITH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \op.ARITH~0_combout\,
	ena => \op.NOP~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \op.ARITH~q\);

-- Location: LCCOMB_X1_Y47_N22
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\PS.Execute~q\ & (\op.NOP~q\ & (!\op.INVALID~q\ & !\op.ARITH~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PS.Execute~q\,
	datab => \op.NOP~q\,
	datac => \op.INVALID~q\,
	datad => \op.ARITH~q\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X1_Y47_N28
\Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\Selector3~0_combout\) # ((\PS.WriteMem~q\) # (\Selector2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~0_combout\,
	datac => \PS.WriteMem~q\,
	datad => \Selector2~0_combout\,
	combout => \Selector3~1_combout\);

-- Location: IOIBUF_X0_Y44_N1
\func[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(0),
	o => \func[0]~input_o\);

-- Location: LCCOMB_X1_Y44_N12
\Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\op.ARITH~q\ & (\func[0]~input_o\ & ((\PS.Execute~q\) # (\PS.RegUpdate~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PS.Execute~q\,
	datab => \op.ARITH~q\,
	datac => \func[0]~input_o\,
	datad => \PS.RegUpdate~q\,
	combout => \Selector7~0_combout\);

-- Location: IOIBUF_X0_Y44_N8
\func[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(1),
	o => \func[1]~input_o\);

-- Location: LCCOMB_X1_Y44_N26
\Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\op.ARITH~q\ & (\func[1]~input_o\ & ((\PS.Execute~q\) # (\PS.RegUpdate~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PS.Execute~q\,
	datab => \op.ARITH~q\,
	datac => \func[1]~input_o\,
	datad => \PS.RegUpdate~q\,
	combout => \Selector6~0_combout\);

-- Location: IOIBUF_X0_Y44_N15
\func[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(2),
	o => \func[2]~input_o\);

-- Location: LCCOMB_X1_Y44_N24
\Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\op.ARITH~q\ & (\func[2]~input_o\ & ((\PS.Execute~q\) # (\PS.RegUpdate~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PS.Execute~q\,
	datab => \op.ARITH~q\,
	datac => \func[2]~input_o\,
	datad => \PS.RegUpdate~q\,
	combout => \Selector5~0_combout\);

-- Location: IOIBUF_X0_Y44_N22
\func[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(3),
	o => \func[3]~input_o\);

-- Location: LCCOMB_X1_Y44_N18
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\op.ARITH~q\ & (\func[3]~input_o\ & ((\PS.Execute~q\) # (\PS.RegUpdate~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PS.Execute~q\,
	datab => \op.ARITH~q\,
	datac => \func[3]~input_o\,
	datad => \PS.RegUpdate~q\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X1_Y47_N16
\MemtoReg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MemtoReg~0_combout\ = (\op.LW~q\ & \PS.RegUpdate~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \op.LW~q\,
	datad => \PS.RegUpdate~q\,
	combout => \MemtoReg~0_combout\);

ww_EnPC <= \EnPC~output_o\;

ww_RI <= \RI~output_o\;

ww_RegWr <= \RegWr~output_o\;

ww_RegDst <= \RegDst~output_o\;

ww_ALUSrc <= \ALUSrc~output_o\;

ww_ALUOp(0) <= \ALUOp[0]~output_o\;

ww_ALUOp(1) <= \ALUOp[1]~output_o\;

ww_ALUOp(2) <= \ALUOp[2]~output_o\;

ww_ALUOp(3) <= \ALUOp[3]~output_o\;

ww_MemWr <= \MemWr~output_o\;

ww_MemtoReg <= \MemtoReg~output_o\;
END structure;


