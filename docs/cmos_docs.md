# CMOS notes

EDA     Electronic Design Automation
IC      Integrated Circuit
VLSI    Very Large System Integration
MOS     Metal Oxide Semiconductor
CMOS    Complementary Metal Oxide Semiconductor
MOSFET  MOS Field Effect Transistor


MOS transistor is a 4-terminal device on a silicon substrate.

Circuit schematic diagrams oftern show transistors in 3-terminal symbols, with
the assumption that the fourth terminal (known as the substrate terminal) is
either grounded or connected to power supply on the basis of the device type.

L is the n-channel length (runs from source to drain, beneath the gate)
W is the n-channel width  (runs perpendicular to L, in the same plane)
t_{ox} is the tichness of the thin oxide layer under the gate


The three terminals of the decive are **Gate**, **Source**, **Drain**.
A fourth terminal connecting the **Substrate** is something provided with
devices as well.

**N-channel MOSFET (NMOS)**

- If an arrow is drawn on the **source terminal**, it points **outwards**, away from the channel.
- Alternatively, an arrow on the **body (bulk) terminal**, drawn in the middle, points **inwards**, towards the channel.
- In simplified CMOS symbols, the arrow may be omitted; the NMOS gate has **no bubble**.

**P-channel MOSFET (PMOS)**

- If an arrow is drawn on the **source terminal**, it points **inwards**, towards the channel.
- Alternatively, an arrow on the **body (bulk) terminal**, drawn in the middle, points **outwards**, away from the channel.
- In simplified CMOS symbols, the arrow may be omitted; a **small circle (“bubble”) at the gate** identifies the PMOS.

The switching characteristic of a MOS device is determined by its **threshold
voltage**. denotated as V_{tn} for an n-channel transistor and V_{tp} for a
p-channel transistor.

When the gate-to-source voltage V_{GS} is greater than V_{tn}, a channel will
form in a MOS transistor. 

For an n-channel devide, this means:
V_{eff} = V_{GS} - V_{tn} > 0 

For a p-channel devide, this means:
V_{eff} = V_{SG} + V_{tp} > 0 

Where 

V_{tn} \approx  0.7
V_{tp} \approx -0.7



## Razavi Notes


1. The MOSFET has four terminals
2. MOS structure is symmetric
3. The arrow indicates the source
