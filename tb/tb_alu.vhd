-- Self-checking ALU test: one vector per operation plus edge cases.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cpu_pkg.all;

entity tb_alu is
end entity tb_alu;

architecture sim of tb_alu is

  signal alu_op : alu_op_t := ALU_ADD;
  signal a, b   : word_t   := (others => '0');
  signal result : word_t;
  signal eq     : std_logic;

  type vec_t is record
    op       : alu_op_t;
    a, b     : integer;   -- interpreted as 8-bit two's complement
    expected : integer;
    name     : string(1 to 4);
  end record;

  type vec_array_t is array (natural range <>) of vec_t;

  constant VECTORS : vec_array_t := (
    (ALU_ADD,    5,    3,    8, "add "),
    (ALU_ADD,  127,    1, -128, "add "),  -- wraps
    (ALU_SUB,    3,    5,   -2, "sub "),
    (ALU_AND,  12,   10,    8, "and "),
    (ALU_OR,   12,   10,   14, "or  "),
    (ALU_XOR,  12,   10,    6, "xor "),
    (ALU_NOR,  12,   10,  -15, "nor "),
    (ALU_MULU,  20,   13,    4, "mulu"),  -- 260 mod 256
    (ALU_MUL,   -3,    5,  -15, "mul "),
    (ALU_SLL,    3,    2,   12, "sll "),
    (ALU_SRL,   -8,    1,  124, "srl "),  -- 0xF8 >> 1 = 0x7C
    (ALU_SRA,   -8,    1,   -4, "sra "),
    (ALU_SEQ,    7,    7,    1, "seq "),
    (ALU_SEQ,    7,    6,    0, "seq "),
    (ALU_SLT,   -1,    1,    1, "slt "),
    (ALU_SLTU,  -1,    1,    0, "sltu"),  -- 255 < 1 is false
    (ALU_SGT,    1,   -1,    1, "sgt "),
    (ALU_SGTU,   1,   -1,    0, "sgtu")
  );

  function to_word(x : integer) return word_t is
  begin
    return std_logic_vector(to_signed(x, DATA_WIDTH));
  end function;

begin

  dut : entity work.alu
    port map (alu_op => alu_op, a => a, b => b, result => result, eq => eq);

  stim : process
    variable errors : natural := 0;
  begin
    for i in VECTORS'range loop
      alu_op <= VECTORS(i).op;
      a      <= to_word(VECTORS(i).a);
      b      <= to_word(VECTORS(i).b);
      wait for 1 ns;

      if result /= to_word(VECTORS(i).expected) then
        report VECTORS(i).name & " " & integer'image(VECTORS(i).a) & ", "
             & integer'image(VECTORS(i).b) & ": expected "
             & integer'image(VECTORS(i).expected) & ", got "
             & integer'image(to_integer(signed(result)))
          severity error;
        errors := errors + 1;
      end if;

      if (eq = '1') /= (VECTORS(i).a = VECTORS(i).b) then
        report "eq flag wrong for vector " & integer'image(i) severity error;
        errors := errors + 1;
      end if;
    end loop;

    assert errors = 0
      report "tb_alu: " & integer'image(errors) & " failure(s)" severity failure;
    report "tb_alu: all " & integer'image(VECTORS'length) & " vectors passed";
    std.env.finish;
  end process;

end architecture sim;
