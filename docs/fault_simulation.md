# Fault simulation

> Note: this are taken from Synopsys lessons

## Fault Simulation Concept

- Hypothetical faults are inserted into a design
- Tests are run againt the faulty design (also called the Faulty Machine or FM)
- Results are compared againt the Reference design (also called the Good Machine or GM)
- If the tests are able to detect the faults, then there is a high probility they will detect errors in that area of the chip.

## Types of Fault simulators

- Serial
  - One fault per simulation
  - Very slow

- Parallel
  - Serial fault simulation
  - Uses many CPUs in parallel
  - Faster then serial but still slow

- Concurrent
  - Many thousands of faults is a single simulation
  - Uses many CPUs in parallel
  - Fastest method of fault simulation

## Detection criteria

- Detections points
  - Output signals, observation points, located at the output of gates and flipflops
  - Selection of this points is esential
  
  
  
## Fault Models

- Mimics real-life defects
- Fault model types:
  - Stuck-at
  - Transition
  - Transient
  - Variable
  - Bridge
  - IDDQ

## Fault Locations

- Wire (or net)
- Primitive
- Port (or cell)
- Arrays
- Variable

## Standard Fault Format (SFF)

- Fault Universe Description
- A comprehensive way of defining
  - Faults statuses
  - Faults groups
  - Mismatch resolution
  - Fault identification (generation) rules
  - Strobing points
  
  
## Fault Generate block

- Specify how and where to generate faults
- Define fault samplig and scale factor
- Define exclude block
  
Example:

```plain
<Dropped detected>  <bit-flip>    <transient fault at cycle 50>  <on a flip-flop>
# <status>          <fault type>  (<timing info>)                {<location info>}
DD                  ~             (50)                           {FLOP "tb.dut.flopB"}


<Not attempted>     <stuck-at 0 fault>  <on the port of a cell>
# <status>          <fault type>        {<location info>}
NA                  0                   {PORT "testbench.dur.blkA.Z"}


DD ~ (50) { FLOP "tb.dut.flopB"}
NA 0 { PORT "testbench.dur.blkA.Z"}

FaultList {
  NA 0 {PORT "test.dut.u1.Z"}
  NA 1 {PORT "test.dut.u1.Z"}

}
```
