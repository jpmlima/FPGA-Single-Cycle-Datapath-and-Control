-- Top level: datapath + control unit. PC and the current instruction are
-- exposed so the design can be observed on hardware (LEDs, SignalTap).
library ieee;
use ieee.std_logic_1164.all;

use work.cpu_pkg.all;
use work.program_pkg.all;

entity cpu is
  generic (
    IMEM_ADDR_BITS : positive    := 3;
    PROG           : instr_mem_t := PROGRAM;
    DMEM_INIT      : data_mem_t  := DATA_INIT
  );
  port (
    clk   : in  std_logic;
    rst   : in  std_logic;
    pc    : out word_t;
    instr : out instr_t
  );
end entity cpu;

architecture rtl of cpu is
  signal ctrl  : ctrl_t;
  signal ir    : instr_t;
  signal eq    : std_logic;
begin

  u_control : entity work.control_unit
    port map (
      clk    => clk,
      rst    => rst,
      opcode => ir(F_OPCODE),
      funct  => ir(F_FUNCT),
      eq     => eq,
      ctrl   => ctrl
    );

  u_datapath : entity work.datapath
    generic map (
      IMEM_ADDR_BITS => IMEM_ADDR_BITS,
      PROGRAM        => PROG,
      DATA_INIT      => DMEM_INIT
    )
    port map (
      clk   => clk,
      rst   => rst,
      ctrl  => ctrl,
      instr => ir,
      eq    => eq,
      pc    => pc
    );

  instr <= ir;

end architecture rtl;
