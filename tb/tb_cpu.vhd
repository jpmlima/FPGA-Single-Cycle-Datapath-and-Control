-- Runs the default program (rtl/program_pkg.vhd) and checks:
--   * the order of fetched addresses (taken and not-taken BEQ),
--   * final register and data-memory contents.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.cpu_pkg.all;

entity tb_cpu is
end entity tb_cpu;

architecture sim of tb_cpu is

  constant CLK_PERIOD : time := 20 ns;

  signal clk   : std_logic := '0';
  signal rst   : std_logic := '1';
  signal pc    : word_t;
  signal instr : instr_t;
  signal done  : boolean   := false;

  type int_array_t is array (natural range <>) of natural;

  -- Address 3 is skipped by the taken branch at address 2.
  constant EXPECTED_FETCHES : int_array_t := (0, 1, 2, 4, 5, 6, 7);

begin

  clk <= not clk after CLK_PERIOD / 2 when not done;

  dut : entity work.cpu
    port map (clk => clk, rst => rst, pc => pc, instr => instr);

  -- Internal signals, reached with VHDL-2008 external names. Declared in the
  -- process so they are bound after the DUT is elaborated.
  stim : process
    alias ctrl is << signal .tb_cpu.dut.ctrl : ctrl_t >>;
    alias regs is << signal .tb_cpu.dut.u_datapath.u_regs.regs : data_mem_t(0 to 7) >>;
    alias ram  is << signal .tb_cpu.dut.u_datapath.u_dmem.ram  : data_mem_t(0 to 255) >>;

    variable n_fetch : natural := 0;
    variable errors  : natural := 0;

    procedure check(name : string; got : word_t; expected : integer) is
    begin
      if to_integer(unsigned(got)) /= expected then
        report name & ": expected " & integer'image(expected) & ", got "
             & integer'image(to_integer(unsigned(got)))
          severity error;
        errors := errors + 1;
      end if;
    end procedure;

  begin
    wait for 2 * CLK_PERIOD;
    wait until falling_edge(clk);
    rst <= '0';

    -- Record each fetched address until the program has run once.
    while n_fetch < EXPECTED_FETCHES'length loop
      wait until rising_edge(clk);
      if ctrl.ir_load = '1' then
        if to_integer(unsigned(pc)) /= EXPECTED_FETCHES(n_fetch) then
          report "fetch #" & integer'image(n_fetch) & ": expected address "
               & integer'image(EXPECTED_FETCHES(n_fetch)) & ", got "
               & integer'image(to_integer(unsigned(pc)))
            severity error;
          errors := errors + 1;
        end if;
        n_fetch := n_fetch + 1;
      end if;
    end loop;

    -- Let the last instruction (sw) finish.
    wait until rising_edge(clk) and ctrl.ir_load = '1';

    check("r0", regs(0), 0);
    check("r3", regs(3), 4);
    check("r4", regs(4), 4);
    check("r5", regs(5), 0);
    check("mem[0]", ram(0), 4);
    check("mem[1]", ram(1), 4);
    check("mem[2]", ram(2), 4);
    check("mem[3]", ram(3), 0);

    assert errors = 0
      report "tb_cpu: " & integer'image(errors) & " failure(s)" severity failure;
    report "tb_cpu: program ran as expected (" & time'image(now) & ")";
    done <= true;
    std.env.finish;
  end process;

end architecture sim;
