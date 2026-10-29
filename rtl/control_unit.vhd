-- Control unit: Moore-style FSM that sequences each instruction over
-- 3 or 4 cycles (FETCH -> DECODE -> EXECUTE -> WRITEBACK/MEM_WRITE/BRANCH).
library ieee;
use ieee.std_logic_1164.all;

use work.cpu_pkg.all;

entity control_unit is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    opcode : in  opcode_t;
    funct  : in  alu_op_t;
    eq     : in  std_logic;  -- from the ALU, valid during EXECUTE
    ctrl   : out ctrl_t
  );
end entity control_unit;

architecture rtl of control_unit is

  type state_t is (S_RESET, S_FETCH, S_DECODE, S_EXECUTE,
                   S_WRITEBACK, S_MEM_WRITE, S_BRANCH);

  type instr_kind_t is (K_NOP, K_ARITH, K_ADDI, K_LW, K_SW, K_BEQ, K_INVALID);

  signal state, state_next : state_t;
  signal kind, kind_next   : instr_kind_t;

  function decode(op : opcode_t) return instr_kind_t is
  begin
    case op is
      when OP_NOP   => return K_NOP;
      when OP_ARITH => return K_ARITH;
      when OP_BEQ   => return K_BEQ;
      when OP_ADDI  => return K_ADDI;
      when OP_SW    => return K_SW;
      when OP_LW    => return K_LW;
      when others   => return K_INVALID;
    end case;
  end function;

begin

  seq : process (clk, rst)
  begin
    if rst = '1' then
      state <= S_RESET;
      kind  <= K_NOP;
    elsif rising_edge(clk) then
      state <= state_next;
      kind  <= kind_next;
    end if;
  end process;

  comb : process (state, kind, opcode, funct, eq)
    variable c : ctrl_t;
  begin
    c          := CTRL_IDLE;
    state_next <= state;
    kind_next  <= kind;

    case state is

      when S_RESET =>
        state_next <= S_FETCH;

      when S_FETCH =>
        c.ir_load  := '1';
        c.pc_inc   := '1';
        state_next <= S_DECODE;

      when S_DECODE =>
        kind_next  <= decode(opcode);
        state_next <= S_EXECUTE;

      when S_EXECUTE =>
        case kind is
          when K_ARITH =>
            c.alu_op   := funct;
            state_next <= S_WRITEBACK;
          when K_ADDI | K_LW =>
            c.alu_src_b := '1';
            state_next  <= S_WRITEBACK;
          when K_SW =>
            c.alu_src_b := '1';
            state_next  <= S_MEM_WRITE;
          when K_BEQ =>
            c.alu_op := ALU_SEQ;
            if eq = '1' then
              state_next <= S_BRANCH;
            else
              state_next <= S_FETCH;
            end if;
          when K_NOP | K_INVALID =>
            state_next <= S_FETCH;
        end case;

      when S_WRITEBACK =>
        c.reg_write := '1';
        case kind is
          when K_ARITH =>
            c.alu_op := funct;
          when K_ADDI =>
            c.alu_src_b := '1';
            c.reg_dst   := '1';
          when K_LW =>
            c.alu_src_b  := '1';
            c.reg_dst    := '1';
            c.mem_to_reg := '1';
          when others =>
            c.reg_write := '0';
        end case;
        state_next <= S_FETCH;

      when S_MEM_WRITE =>
        c.alu_src_b := '1';
        c.mem_write := '1';
        state_next  <= S_FETCH;

      -- PC was incremented in FETCH, so the target is (BEQ address + 1) + imm.
      when S_BRANCH =>
        c.alu_src_a := '0';
        c.alu_src_b := '1';
        c.pc_load   := '1';
        state_next  <= S_FETCH;

    end case;

    ctrl <= c;
  end process;

end architecture rtl;
