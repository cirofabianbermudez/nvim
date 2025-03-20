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


## The Verification Process

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

## The Verification Plan

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

You need a methodology that finds bugs faster in order to reach the goal of 
100% coverage.


## Methodology Basics

Use the following principles:

- Constrained-random stimulus
- Functional coverage
- Layered testbench using transactors
- Common testbench for all tests
- Test case-specific code kept separate from testbench

All these principles are related. Random stimulus is crucial for exercising
complex designs. A directed test finds the bugs you expect to be in the design,
whereas a random test can find bugs you never anticipated.

When using random stimuli, you need functional coverage to measure verification progress.
Furthermore, once you start using automatically generated stimuli, you need an automated way
to predict the result, generally a scoreboard or reference model.

Building the testbench infrastructure, including self-prediction, takes a 
significant amount of work.

A layered testbench helps you control the complexity by breaking the problem
into manageable pieces. Transactors provide a useful pattern for building these
pieces. With appropriate planning, you can build a testbench infrastructure that can
be shared by all tests and does not have to be continually modified.

You just need to leave “hooks” where the tests can perform certain actions such as shaping
the stimulus and injecting disturbances.

Conversely, code specific to a single test must be kept separate from the testbench to prevent it from complicating the
infrastructure.

Building this style of testbench takes longer than a traditional directed
testbench, especially the self-checking portions. As a result, there may be a
significant delay before the first test can be run. 

While this up-front work may seem daunting, the payback is high. Every random
test you create shares this common testbench, as opposed to directed tests where
each is written from scratch. Each random test contains a few dozen lines of code to
constrain the stimulus in a certain direction and cause any desired exceptions, such
as creating a protocol violation. The result is that your single constrained-random
testbench is now finding bugs faster than the many directed ones.

As the rate of discovery begins to drop off, you can create new random constraints
to explore new areas. The last few bugs may only be found with directed
tests, but the vast majority of bugs will be found with random tests. If you create a
random testbench, you can always constrain it to created directed tests, but a directed
testbench can never be turned into a true random testbench.


## Constrained-Random Stimulus

Although you want the simulator to generate the stimulus, you don’t want totally
random values. You use the SystemVerilog language to describe the format of the
stimulus, and the simulator picks values that meet the constraints.

These values are sent into the design, and are also sent into a high-level model
that predicts what the result should be. The design’s actual output is compared
with the predicted output.

A random test often covers a wider space than a directed one.
This extra coverage may overlap other tests, or may explore new areas that you did
not anticipate. If these new areas find a bug, you are in luck! If the new area is not
legal, you need to write more constraints to keep random generation from creating
illegal design functionality. Lastly, you may still have to write a few directed tests to
find cases not covered by any other constrained-random tests.

The path to achieve complete coverage start with basic constrained-random tests.
Run them with many different seeds. When you look at the functional coverage reports,
find the holes where there are gaps in the coverage. Then you make minimal code
changes, perhaps by using new constraints, or by injecting errors or delays 
into the DUT. Spend most of your time in this outer loop, writing directed tests 
for only the few features that are very unlikely to be reached by random tests.

## What Should You Randomize?

When you think of randomizing the stimulus to a design, you might fi rst pick
the data fi elds. These values are is the easiest to create — just call `$random()`. The
problem is that this choice gives a very low payback in terms of bugs found. The
primary types of bugs found with random data are data path errors, perhaps with
bit-level mistakes. You need to fi nd bugs in the control logic, source of the most
devious problems.
