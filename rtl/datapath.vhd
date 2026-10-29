-- Datapath: PC, instruction ROM, register file, ALU and data RAM,
-- steered by the control bundle from control_unit.
library ieee;
use ieee.std_logic_1164.all;

use work.cpu_pkg.all;

entity datapath is
  generic (
    IMEM_ADDR_BITS : positive := 3;
    PROGRAM        : instr_mem_t;
    DATA_INIT      : data_mem_t
  );
  port (
    clk   : in  std_logic;
    rst   : in  std_logic;
    ctrl  : in  ctrl_t;
    instr : out instr_t;    -- current instruction, to the control unit
    eq    : out std_logic;  -- ALU equality flag, to the control unit
    pc    : out word_t
  );
end entity datapath;

architecture rtl of datapath is

  signal pc_q       : word_t;
  signal ir         : instr_t;
  signal imm        : word_t;
  signal wa         : reg_addr_t;
  signal rs_data    : word_t;
  signal rt_data    : word_t;
  signal alu_a      : word_t;
  signal alu_b      : word_t;
  signal alu_result : word_t;
  signal mem_data   : word_t;
  signal wb_data    : word_t;

begin

  -- Fetch ---------------------------------------------------------------

  u_pc : entity work.pc
    generic map (WIDTH => DATA_WIDTH)
    port map (
      clk     => clk,
      rst     => rst,
      inc     => ctrl.pc_inc,
      load    => ctrl.pc_load,
      next_pc => alu_result,
      pc      => pc_q
    );

  u_imem : entity work.imem
    generic map (ADDR_BITS => IMEM_ADDR_BITS, CONTENTS => PROGRAM)
    port map (
      clk   => clk,
      en    => ctrl.ir_load,
      addr  => pc_q,
      instr => ir
    );

  -- Decode / register read ---------------------------------------------

  u_sext : entity work.sign_extend
    generic map (IN_WIDTH => 7, OUT_WIDTH => DATA_WIDTH)
    port map (din => ir(F_IMM), dout => imm);

  u_wa_mux : entity work.mux2
    generic map (WIDTH => REG_ADDR_WIDTH)
    port map (sel => ctrl.reg_dst, d0 => ir(F_RD), d1 => ir(F_RT), y => wa);

  u_regs : entity work.reg_file
    port map (
      clk => clk,
      ra1 => ir(F_RS),
      ra2 => ir(F_RT),
      rd1 => rs_data,
      rd2 => rt_data,
      we  => ctrl.reg_write,
      wa  => wa,
      wd  => wb_data
    );

  -- Execute -------------------------------------------------------------

  u_alu_a_mux : entity work.mux2
    generic map (WIDTH => DATA_WIDTH)
    port map (sel => ctrl.alu_src_a, d0 => pc_q, d1 => rs_data, y => alu_a);

  u_alu_b_mux : entity work.mux2
    generic map (WIDTH => DATA_WIDTH)
    port map (sel => ctrl.alu_src_b, d0 => rt_data, d1 => imm, y => alu_b);

  u_alu : entity work.alu
    generic map (WIDTH => DATA_WIDTH)
    port map (
      alu_op => ctrl.alu_op,
      a      => alu_a,
      b      => alu_b,
      result => alu_result,
      eq     => eq
    );

  -- Memory / write-back -------------------------------------------------

  u_dmem : entity work.dmem
    generic map (INIT => DATA_INIT)
    port map (
      clk  => clk,
      we   => ctrl.mem_write,
      addr => alu_result,
      wd   => rt_data,
      rd   => mem_data
    );

  u_wb_mux : entity work.mux2
    generic map (WIDTH => DATA_WIDTH)
    port map (sel => ctrl.mem_to_reg, d0 => alu_result, d1 => mem_data, y => wb_data);

  instr <= ir;
  pc    <= pc_q;

end architecture rtl;
