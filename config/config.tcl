# Design Name
set ::env(DESIGN_NAME) "counter"

# Verilog source files
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

# Clock Constraints
set ::env(CLOCK_PERIOD) "10.0"
set ::env(CLOCK_PORT) "clk"

# Physical Sizing Constraints
set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 50 50"

# PDN (Power Distribution Network) settings
set ::env(FP_PDN_MULTILAYER) 1

2. Explanation of Each Command
It is important to understand what these settings do so you can document them in your project portfolio:


set ::env(DESIGN_NAME) "counter": This tells OpenLane the name of your top-level module.


set ::env(VERILOG_FILES): This tells the tool where to find your hardware logic files (.v).

set ::env(CLOCK_PERIOD) "10.0": This sets the target speed for your chip. A 10ns period means the design is targeted for 100MHz.


set ::env(CLOCK_PORT) "clk": This identifies which pin on your module is the clock signal, allowing the tool to build a Clock Tree.


set ::env(FP_SIZING) "absolute": This overrides the automatic sizing, allowing you to manually define the chip dimensions.


set ::env(DIE_AREA) "0 0 50 50": This defines a 50x50 micrometer square area for your chip, which provides enough room for the logic and power grid.
