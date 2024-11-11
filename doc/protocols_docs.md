# Protocol notes

## ASB (Advanced System Bus)

The ASB is designed for high-performance, high-bandwidth usages:

- Non-multiplexed (i.e. separate) address and data buses
- support for pipelined operation (including arbitration)
- support for multiple bus masters, with low silicon overhead
- support for multiple slave devices, including a bridge to the peripheral bus (APB)
- centralised decoder and arbiter

## APB (Advanced Peripheral Bus)

The APB is designed to be a secondary bus to ASB, connected by a bridge (which limits the ASB loading).

## ASB vs APB

In summary:

ASB

- is used for CPUs, DSP, DMA controllers and other bus masters, or high-performance peripherals (usually with FIFOs)

APB

- is used for unpipelined, register-mapped slave peripherals, especially when the number of peripherals is high, and power-consumption needs to be minimised

ASB and APB

- share the test methodology incorporated in AMBA
