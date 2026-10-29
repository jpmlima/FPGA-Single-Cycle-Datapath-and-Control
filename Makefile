GHDL      ?= ghdl
BUILD     := build
GHDLFLAGS := --std=08 --workdir=$(BUILD)

# Analysis order matters: packages first, then leaf modules, then top level.
RTL := \
	rtl/cpu_pkg.vhd \
	rtl/program_pkg.vhd \
	rtl/mux2.vhd \
	rtl/sign_extend.vhd \
	rtl/pc.vhd \
	rtl/reg_file.vhd \
	rtl/imem.vhd \
	rtl/dmem.vhd \
	rtl/alu.vhd \
	rtl/control_unit.vhd \
	rtl/datapath.vhd \
	rtl/cpu.vhd

TB    := tb/tb_alu.vhd tb/tb_cpu.vhd
TESTS := tb_alu tb_cpu

.PHONY: test analyze wave clean $(TESTS)

test: $(TESTS)

analyze:
	@mkdir -p $(BUILD)
	$(GHDL) -a $(GHDLFLAGS) $(RTL) $(TB)

$(TESTS): analyze
	$(GHDL) -e $(GHDLFLAGS) $@
	$(GHDL) -r $(GHDLFLAGS) $@ --assert-level=error

# Waveform of the full program run; open with GTKWave or Surfer.
wave: analyze
	$(GHDL) -e $(GHDLFLAGS) tb_cpu
	$(GHDL) -r $(GHDLFLAGS) tb_cpu --wave=$(BUILD)/tb_cpu.ghw
	@echo "Waveform written to $(BUILD)/tb_cpu.ghw"

clean:
	rm -rf $(BUILD) *.o *.cf tb_alu tb_cpu
