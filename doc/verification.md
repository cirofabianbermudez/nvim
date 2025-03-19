# SystemVerilog Verification Notes

## Acronyms

HVLs - Hardware Verification Languages
LRM - Language Reference Manual
UVM - Universal Verification Methodology
OVM - Open Verification Methodology
VMM - Verification Methodology Manual
RVM - Reference Verification Methodology 
API - Application Programming Interface
IPC - InterProcess Communication
RTL - Register Transfer Level
DUT - Design Under Test
OOP - Object Oriented Programming
CRT - Constrained Random Tests

- "Bugs are good"
- Always keep track of the details of each bug found.




Some of the typical features of an HVL that distinguish it from a Hardware 
Description Language are:

- Constrained-random stimuli generation
- Functional coverage
- Higher-level structures, specially Object-Oriented Programming, and transaction-level modeling
- Multi-threading and InterProcess communication (IPC)
- Support for HDL types such as Verilog's 4-state values
- Tight integration with event-simulator for control of the design


The goal of hardware design is to create a device that performs a particular task.
Your purpose as a verification engineer is to make sure the device can accomplish 
that task successfully, that is, the design is an accurate representation of the
specification.

Bugs are what you get when there is a discrepancy. The behavior of the device 
when used outside of its original purpose is not your responsibility, although 
you want to know where those boundaries lie.

As a verification engineer, you must read the hardware specification, create the
verification plan, and then follow it to build tests showing the RTL code correctly
implements the features. Therefore, as a verification engineer, not only do you 
have to understand the design and its intent, but also, you have to consider all the 
corner test cases that the designer might not have thought about.

As the verification engineer, your job is to read the same hardware specifications
and make an independent assessment of what they mean. Your tests then exercise
the RTL to show that it matches your interpretation.

You can never prove there are no bugs left, so you need to constantly come up 
with new verification tactics.

The verification plan is derived from the hardware specification and contains a
description of what features need to be exercised and the techniques to be used. These
steps may include directed or random testing, assertions, HW/SW co-verification,
emulation, formal proofs, and use of verification IP.

## Basic Testbench Functionality

The purpose of a testbench is to determine the correctness of the DUT. This is
accomplished by the following steps. Generate stimulus

- Apply stimulus to the DUT
- Capture the response
- Check for correctness
- Measure progress against the overall verification goals

Some steps are accomplished automatically by the testbench, while others are
manually determined by you. The methodology you choose determines how the
preceding steps are carried out.

## Directed Testing

You look at the hardware specification and write a verification plan with a 
list of tests, each of which concentrated on a set of related features.

Armed with this plan, you write stimulus vectors that exercise these features 
in the DUT. You then simulate the DUT with these vectors and manually review 
the resulting log files and waveforms to make sure the design does what you 
expect. Once the test works correctly, you check it off in the verification
plan and move to the next one.

Each test is targeted at a very specific set of design elements. If you
had enough time, you could write all the tests needed for 100% coverage of the
entire verification plan.

