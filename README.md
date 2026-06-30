# 4-Bit Up/Down Counter (RTL-to-GDSII)

## 📌 Project Overview
This project demonstrates the complete ASIC design flow—from behavioral Verilog code to a manufacturing-ready physical layout (GDSII).I designed and implemented a 4-bit Up/Down counter using an open-source EDA toolchain.This project serves as a foundational step in understanding the transition from abstract digital logic to physical silicon blueprints.

## 🛠️ Toolchain & Infrastructure
To achieve this flow, I utilized the following open-source EDA tools:
* **OpenLane:** An automated RTL-to-GDSII framework.
* **Yosys:** Used for logic synthesis to translate RTL code into logic gates.
* **OpenROAD:** The primary engine for back-end physical design, including floorplanning, placement, and routing.
* **Magic:** Used for layout visualization and GDSII generation.
* **PDK:** Sky130A (SkyWater 130nm Process Design Kit).

## ⚙️ The ASIC Design Flow
The design process followed the standard ASIC design pipeline:
1. **Synthesis:** Converted Verilog RTL into a gate-level netlist.
2. **Floorplanning:** Defined the physical chip area (50x50 μm) and established the Power Distribution Network (PDN).
3. **Placement & Routing:** Placed individual logic cells and routed microscopic copper wires to connect components without violations.
4. **Sign-off:** Verified timing and manufacturing compliance (DRC).

---

## 💻 Hardware Logic (RTL)
The brain of the project is a 4-bit counter that increments or decrements based on a control signal. Below is the behavioral Verilog code (`src/counter.v`) used for the design:

```verilog
module counter (
    input clk,
    input rst,
    input up_down,
    output reg [3:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;
        else if (up_down)
            count <= count + 1'b1;
        else
            count <= count - 1'b1;
    end
endmodule
```
📐 Configuration & Constraints
To ensure OpenLane accurately synthesized and routed the chip, the following constraints were applied in the config.tcl file to define the PPA (Power, Performance, Area) parameters:
```
set ::env(DESIGN_NAME) "counter"
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(CLOCK_PERIOD) "10.0"
set ::env(CLOCK_PORT) "clk"
set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 50 50"
set ::env(FP_PDN_MULTILAYER) 1

```
📊 Final Results & MetricsThe automated flow was executed within a Docker container.
The final metrics extracted from the run reports (reports/metrics.csv) prove that the logic meets physical manufacturing standards:

Metric                  Value                           Description
Physical Area         2500 μm²                   Total physical area (50x50 μm).
Logic Cell Count    32Approximate                total number of standard logic gates used.
DRC Violations           0                       Manufacturing-ready; zero physical design rule violations.
Setup Slack            +1.45                     Positive timing slack confirms the chip will function at the target clock                                                    speed.

Outcome: Successfully generated a GDSII file ready for factory tape-out.
