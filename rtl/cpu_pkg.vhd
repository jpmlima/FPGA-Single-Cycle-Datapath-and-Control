-- Shared types, ISA constants and control-signal bundle.
library ieee;
use ieee.std_logic_1164.all;

package cpu_pkg is

  constant DATA_WIDTH     : positive := 8;
  constant INSTR_WIDTH    : positive := 16;
  constant REG_ADDR_WIDTH : positive := 3;

  subtype word_t     is std_logic_vector(DATA_WIDTH - 1 downto 0);
  subtype instr_t    is std_logic_vector(INSTR_WIDTH - 1 downto 0);
  subtype reg_addr_t is std_logic_vector(REG_ADDR_WIDTH - 1 downto 0);
  subtype opcode_t   is std_logic_vector(2 downto 0);
  subtype alu_op_t   is std_logic_vector(3 downto 0);

  type instr_mem_t is array (natural range <>) of instr_t;
  type data_mem_t  is array (natural range <>) of word_t;

  -- Instruction fields
  --   R-type: [15:13] opcode | [12:10] rs | [9:7] rt | [6:4] rd | [3:0] funct
  --   I-type: [15:13] opcode | [12:10] rs | [9:7] rt | [6:0] imm (signed)
  subtype F_OPCODE is natural range 15 downto 13;
  subtype F_RS     is natural range 12 downto 10;
  subtype F_RT     is natural range  9 downto  7;
  subtype F_RD     is natural range  6 downto  4;
  subtype F_FUNCT  is natural range  3 downto  0;
  subtype F_IMM    is natural range  6 downto  0;

  -- Opcodes
  constant OP_NOP   : opcode_t := "000";
  constant OP_ARITH : opcode_t := "001";
  constant OP_BEQ   : opcode_t := "010";
  constant OP_ADDI  : opcode_t := "100";
  constant OP_SW    : opcode_t := "110";
  constant OP_LW    : opcode_t := "111";

  -- ALU operations (also the funct field of R-type instructions)
  constant ALU_ADD  : alu_op_t := "0000";
  constant ALU_SUB  : alu_op_t := "0001";
  constant ALU_AND  : alu_op_t := "0010";
  constant ALU_OR   : alu_op_t := "0011";
  constant ALU_XOR  : alu_op_t := "0100";
  constant ALU_NOR  : alu_op_t := "0101";
  constant ALU_MULU : alu_op_t := "0110";
  constant ALU_MUL  : alu_op_t := "0111";
  constant ALU_SLL  : alu_op_t := "1000";
  constant ALU_SRL  : alu_op_t := "1001";
  constant ALU_SRA  : alu_op_t := "1010";
  constant ALU_SEQ  : alu_op_t := "1011";
  constant ALU_SLT  : alu_op_t := "1100";
  constant ALU_SLTU : alu_op_t := "1101";
  constant ALU_SGT  : alu_op_t := "1110";
  constant ALU_SGTU : alu_op_t := "1111";

  -- Control signals driven by the control unit into the datapath.
  type ctrl_t is record
    pc_inc     : std_logic;  -- PC <= PC + 1
    pc_load    : std_logic;  -- PC <= ALU result (taken branch)
    ir_load    : std_logic;  -- latch instruction from IMEM
    reg_write  : std_logic;  -- write register file
    reg_dst    : std_logic;  -- write address: 0 = rd, 1 = rt
    alu_src_a  : std_logic;  -- ALU A: 0 = PC, 1 = rs
    alu_src_b  : std_logic;  -- ALU B: 0 = rt, 1 = sign-extended imm
    alu_op     : alu_op_t;
    mem_write  : std_logic;  -- write data memory
    mem_to_reg : std_logic;  -- write-back source: 0 = ALU, 1 = DMEM
  end record;

  constant CTRL_IDLE : ctrl_t := (
    pc_inc     => '0',
    pc_load    => '0',
    ir_load    => '0',
    reg_write  => '0',
    reg_dst    => '0',
    alu_src_a  => '1',
    alu_src_b  => '0',
    alu_op     => ALU_ADD,
    mem_write  => '0',
    mem_to_reg => '0'
  );

end package cpu_pkg;
