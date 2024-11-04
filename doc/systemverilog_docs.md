# SystemVerilog notes

## Acronyms

LRM -> Language Reference Manual

## Well Designed Verification Environment

Test Environment must:

- Be structure for Debug
- Avoid false positives

Test must:

- Achieve Functional Coverage
  - Prevent untested regions
- Reach Corner Cases
  - Anticipated Cases
  - Error Injection
    - Environment Error
    - DUT Error
  - Unanticipated Cases
    - Random Tests
- Be robust, reusable, scalable

## SystemVerilog Test Environment

<div style="text-align: center;">
  <img src="img/test_environment.svg" alt="test_environment" width=90%"/>
</div>

## SystemVerilog - Key Features

SystemVerilog introduces two new design units

- The `program` block (**NOT RECOMMENDED TO USE**)
  - Use `module` instead
  - Is where you develop testbench code
  - Is entry point for testbench execution
- The `interface`
  - Is mechanism to connect testbench to DUT
  - Is a named bundle of wires
  - Can be passed just like a port in a port list

SystemVerilog testbenches uses Object Oriented Programming (OOP)

- Uses `class` definition

## Program Block - Encapsulate Test Code

The `program` block provides

- Entry point to test execution
- Scope for program-wide data and routines
- Race-free iteration between testbench and design

Develop test code in `program` code

- Can also use a `module` block

```verilog
program automatic test(router_if.TB vif);
  initial begin
    run();
  end

  task run();
  ...
  endtask : run
endprogram : test
```

## Interface - Encapsulate Connectivity

An `interface` encapsulates the communication between DUT and testbench including

- Connectivity (signals) - name bundle of wires
  - One or more bundles to connect modules and tests
  - Can be reused for different tests and devices
- Directional information (`modports`)
- Timing (`clocking` blocks)
- Functionality (`task`, `function`, assertions, `initial/always` blocks)

Solves many problem with traditional connections

- Port list for he connections are compact
- Easy to add new connections
- Opportunity to pass DUT connections throughout the testbench (virtual interfaces)

## Comparing SystemVerilog Containers

| `module`           | `interface`        | `program`     | `class`       |
| ------------------ | ------------------ | ------------- | ------------- |
| modules intance    |                    |               |               |
| interface instance | interface instance |               |               |
| `clocking`         | `clocking`         | `clocking`    |               |
| `class`            | `class`            | `class`       | `class`       |
| object             | object             | object        | object        |
| `reg (logic)`      | `reg (logic)`      | `reg (logic)` | `reg (logic)` |
| variable           | variable           | variable      | variable      |
| `wire`             | `wire`             | `wire`        |               |
| `assign`           | `assign`           | `assign`      |               |
| `initial/always`   | `initial/always`   | `initial`     |               |
| `task`             | `task`             | `task`        | `task`        |
| `function`         | `function`         | `function`    | `function`    |

## Interface - An Example

The RTL code is connected with bundled signals

```verilog
module test(simple_bus sb);
...
endmodule
```

```verilog
module cpu(simple_bus sb);
...
endmodule
```

```verilog
interface simple_bus();
  logic req, gnt;
  logic [7:0] addr;
  wire  [7:0] data;
  logic [7:0] mode;
  logic start, rdy;
endinterface
```

```verilog
module top;
  logic clk = 0;
  always begin
    #10 clk = !clk;
    simple_bus sb(clk);
    test t1(sb);
    cpu c1(sb);
  end
endmodule
```

## Synchronous Timing: `clocking` Blocks

Are just for testbench

- Emulates the launch and captures flops at IO of DUT

Create explicit synchronous timing domains

- All signals driven or sampled at clocking event
  - By default all interface signals are asynchronous
- Interaction between testbench and DUT ideally happens only at clock edges (cycle-based)

Specify signal direction

- Outputs can not be sampled
- Input signals cannot be driven

Multiple clocking blocks supported

- Active driver
- Reactive driver
- Monitor

```verilog
clocking cb @(posedge clock);
  default input #1ns output #1ns;
  output reset_n;
  output din;
  output frame_n;
  output valid_n;
  input  dout;
  input  valido_n;
  input  busy_n;
  input  frameo_n;
endclocking : cb
```

## Signal Direction Using `modport`

Enforce signal access and direction with `modport`

```verilog
interface router_if (input logic clock);
  logic         reset_n;
  ...
  logic [15:0]  frameo_n;

  clocking cb @(posedge clock);
    default input #1ns output #1ns;
    output reset_n;
    ...
    input  frameo_n;
  endclocking : cb

  modport DUT(input reset_n, input din, output dout, ...);
  modport TB(clocking cb, output reset_n);
endinterface: router_if
```

```verilog
module test (router_if.TB vif);
  initial begin
    vif.reset_n = 'd0;
    vif.cb.frame_n <= '1;
    vif.cb.valid_n <= '1;
  end
endmodule : test
```

```verilog
module router (router_if.DUT vif, input logic clock);
...
endmodule : router
```

## A complete `interface`

```verilog
interface router_if (input logic clock);
  // Named bundle of asynchronous signals
  logic         reset_n;
  logic [15:0]  din;
  logic [15:0]  frame_n;
  logic [15:0]  valid_n;
  logic [15:0]  dout;
  logic [15:0]  valido_n;
  logic [15:0]  busy_n;
  logic [15:0]  frameo_n;

  // Create synchronous behavior by placing into `clocking` block
  clocking cb @(posedge clock);
    default input #1ns output #1ns;  // Sample and drive skews
    output reset_n;
    output din;
    output frame_n;
    output valid_n;
    input  dout;
    input  valido_n;
    input  busy_n;
    input  frameo_n;
  endclocking : cb

  // Defines access and direction with modport
  modport TB(clocking cb, output reset_n);  // Synchronous and Asynchronous behavior
endinterface: router_if
```

## Driving and Samplign DUT Signals

DUT signals are driven in the device driver

DUT signals are sampled in the device monitor

## SystemVerilog Testbench Timing

Clocking clock emulates synchronous drives and samples

- Driving and sampling events occur at clocking event

<div style="text-align: center;">
  <img src="img/systemverilog_timing.svg" alt="systemverilog_timing" width=90%"/>
</div>

$$
\begin{array}{lll}
\text{Sample} & = & t_{0} - \text{Input Skew} \\
\text{Drive}  & = & t_{0} + \text{Output Skew}
\end{array}
$$

## Input and Output Skews

<div style="text-align: center;">
  <img src="img/sv_skew.svg" alt="sv_skew" width=90%"/>
</div>

Output Skew is the `clk2q` delay of the launch flop for the DUT input

- Defaults to `#0`

Input Skew is the `setup` time of the capture flop for the DUT output

- Defaults to `#1step` - preponed region of simulation step

## SystemVerilog Scheduling

Each time slot is divided into 5 major regions

- `Preponed` Sample signal before any changed (`1#step`)
- `Active` Design simulation (`modules`), including NBA (Non-Blocking Assignments)
- `Observed` Assertions evaluated after design executes
- `Reactive` Testbench activity (`program`)
- `Postponed` Read only phase

| Region      | Activity   |
| ----------- | ---------- |
| `Preponed`  | sample     |
| `Active`    | design     |
| `Observed`  | assertions |
| `Reactive`  | testbench  |
| `Postponed` | `$monitor` |

## Synchronous Drive Statements

```verilog
interface.cb.signal <= <values|expression>;
```

Drive must be non-blocking

Driving of input signals is not allowed

Example:

```verilog
vif.cb.din[3] <= var_a;
```

## Sampling Synchronous Signals

```verilog
variable = interface.cb.signal;
```

Variable is assigned the sampled value

- Value that the clocking clock sampled at the most recent clocking event

Avoid non-blocking assignment

Sampling of output signal is not allowed

Example:

```verilog
data[i] = vif.cb.dout[7];
```

## Using Interface in Program

```verilog
// Pass modport as port list
program automatic test(router_if.TB vif);
  initial begin
    reset();
  end

  task reset();
    vif.reset_n = 1'b0;          // Asynchronous signals are driven without reference to clocking block
    vif.cb.frame_n <= 16'hffff;  // Synchronous signals are referenced via clocking block
    vif.cb.valid_n <= ~('b0);
    repeat(2) @(vif.cb);
    vif.cb.reset_n <= 1'b1;
    repeat(15) @(vif.cb);        // Advance clock cycles via clocking block
  endtask

endprogram: test
```

## Complete Top-Level Harness

Instantiate test program and interface in harness file

```verilog
// Legacy DUT (wires)
module router(
  reset_n, din, frame_n, valid_n, dout,
  valido_n, busy_n, frameo_n
);
...
endmodule
```

```verilog
module router_test_top;
  parameter simulation_cycle = 100;
  bit SystemClock;

  // Instantiate interface
  router_if vif(SystemClock);    // Connect SystemCLock to interface block

  // Instantiate test program
  test router_test(vif)

  // Instantiate DUT using interface connection
  router dut(
    .reset_n   (vif.reset_n),
    .din       (vif.din),
    .frame_n   (vif.frame_n),
    .valid_n   (vif.valid_n),
    .dout      (vif.dout),
    .valido_n  (vif.valido_n),
    .busy_n    (vif.busy_n),
    .frameo_n  (vif.frameo_n)
  );

endmodule
```

## Compile RTL and Simulate with VCS

Compile HDL code: (generate `simv` simulation binary)

```plain
top_test.sv    // Test code
router_if.sv   // Interface
tb.sv          // Harness
router.sv      // RTL
```

This is the basic way to compile and simulate:

```plain
vcs -sverilog -debug_access+all tb.sv test.sv router_if.sv router.v
```

```plain
./simv
```

But it is recommended to use a Makefile instead:

```makefile
ROOT_DIR := $(CURDIR)
CUR_DATE := $(shell date +%Y-%m-%d_%H-%M-%S)
RUN_DIR := $(CURDIR)/work

SEED ?= 1
PLUS ?=

RTL_PATH = $(abspath $(ROOT_DIR)/../rtl)
RTL_FILES = $(RTL_PATH)/router.v
SVE = -F $(ROOT_DIR)/sve.f
FILES = $(RTL_FILES) $(SVE)

VCS = vcs -full64 -sverilog \
   -lca -debug_access+all -kdb +vcs+vcdpluson \
   -timescale=1ns/100ps $(FILES) -l comp.log \
   -top tb

SIM_OPTS = -l simv.log \
            +$(PLUS)

.PHONY: compile clean help

all: help

compile:
 @mkdir -p $(RUN_DIR)/sim
 cd $(RUN_DIR)/sim && $(VCS)

sim:
 cd $(RUN_DIR)/sim && ./simv +ntb_random_seed=${SEED} $(SIM_OPTS)

random:
 cd $(RUN_DIR)/sim && ./simv +ntb_random_seed_automatic $(SIM_OPTS)

verdi:
 cd $(RUN_DIR)/sim && verdi -dbdir ./simv.daidir -ssf ./novas.fsdb -nologo &

clean:
 rm -rf $(RUN_DIR)

help:
 @echo ""
 @echo "=================================================================="
 @echo ""
 @echo "---------------------------- Targets -----------------------------"
 @echo " compile             : Runs compilation"
 @echo " sim                 : Runs simulation with default seed"
 @echo " random              : Runs simulation with random seed"
 @echo " clean               : Delete work/ directory"
 @echo "=================================================================="
 @echo ""
 @echo "--------------------------- Variables ----------------------------"
 @echo "  SEED                : Random seed used, must be an integer > 0"
 @echo "  PLUS                : Add extra flags in simv command"
 @echo ""
```

`sve.f` (Simulation Verification Environment) files

```plain
+incdir+tests
+incdir+tb
+incdir+sv
sv/router_if.sv
test/top_test.sv
tb/tb.sv
```

For more information about all the flags refer to [VCS/SIMV docs](vcs_simv_docs.md).

## SystemVerilog Run-Time Options

Pass values form simulation command line using `+argument`

Retrieve `+argument` value with `$value$plusargs()`

```verilog
initial begin : proc_user_args
  int value;
  if ($value$plusargs("custom=%d", value)) begin
    $display("The value is: %2d", value);
  end else begin
    $display("Using default seed");
  end
end : proc_user_args
```

```plain
./simv +custom=10
```

Create your own argument options for simulation control and debug

## SystemVerilog Testbench Code Structure: `module`

Test code can be embedded inside `module` block

- `module` is instantiated in the top-level harness file

```verilog
// Compile unit scope variables
`include <files>
module name(interface);
  `include <files>
  // Program global scope variables
  initial begin
  // Local scope variables
  // Top-level test code
  end

  task task_name(...);
  // task local scope variables
  // task code
  endtask
endmodule
```

```verilog
module test(...);
  initial begin
    $fsdbDumpvars;
    reset();
  end
  task reset(...);
  ...
  endtask
endmodule
```

```verilog
module tb;
  router_if vif(SystemClock);
  test top_test(vif);
  router dut (...);
endmodule
```

## Lexical Convention

Same as Verilog

- Case sensitive identifiers (names)
- White spaces are ignored except within strings
- Comments
  - Single line `//`
  - Multi line `/* */`

Number format

```plain
<size>'<base><number>
```

```plain
'b  (binary)        :[01xXzZ]
'd  (decimal)       :[0123456789]
'o  (octal)         :[01234567xXzZ]
'H  (HEXADECIMAL)   :[0123456789ABCDEEFABCDEEFxXzZ]
```

Can be padded with `_` (underscore) for readability

```plain
16'b_1100_1011_1010_0010
32'h_beef_cafe
```

## Data types

A datatype is a set of values (2-state or 4-state) that can be used to declare data objects or to define user-defined data types
The Verilog data types have 4-state values: (`0`, `1`, `Z`, `X`).

SystemVerilog adds 2-state value types based on bit:

- Has values 0 and 1 only.
- Direct replacements for reg, logic or integer.
- Greater efficiency at higher-abstraction level modeling (RTL).
- You can add the `unsigned` keyword after as a modifier.

| Type       | Description                     | Sign             |
| ---------- | ------------------------------- | ---------------- |
| `bit`      | Single bit, Scalable to vector  | Default unsigned |
| `byte`     | 8-bit vector or ASCII character | Default signed   |
| `shortint` | 16-bit vector                   | Default signed   |
| `int`      | 32-bit vector                   | Default signed   |
| `longint`  | 64-bit vector                   | Default signed   |

The keyword `logic` defines that the variable or net is a 4-state data type.

## 2-State (1|0) Data Types (1/3)

```plain
bit [msb:lsb] var_name [=initial_value]
```

Better compiler optimizations for better performance

Variable initialized to `'0` if `initial_value` is not specified

- `'0` is unsized literal, it will expand the variable name to the number of bits automatically

Assigned `0` for `x` or `z` value assignments

- Sized as specified
- Defaults to `unsigned`

```verilog
bit flag;
bit[15:0] sample, temp = 16'hdeed;
bit[7:0] a = 8'b1;         //  8'b0000_0001
bit[7:0] b =  'b1;         //  8'b0000_0001
bit[7:0] c =  '1;          //  8'b1111_1111
bit[32:0] signed ref_data = -155;
```

## 2-State (1|0) Data Types (2/3)

```plain
2-state-type variable_name [=initial_value];
```

Sized integral 2-state data types:

- `byte` - 8-bit signed data type
- `shortint` - 16-bit signed data type
- `int` - 32-bit signed data type
- `longint` - 64-bit signed data type

```verilog
shortint temp = 256;
int sample, ref_data = -9876;
longint a, b;
longint unsigned testdata;
```

## 2-State (1|0) Data Types (3/3)

Real 2-state data types:

- `real` - Equivalent to `double` in C
- `shortreal` - Equivalent to `float` in C
- `realtime`
  - 64-bit real variable for use with `$realtime`
  - Can be used interchangeably with `$real` variables

```verilog
real alpha = 100.3, cov_result;
realtime t64;
t64 = $realtime;
cov_result = $get_coverage();
if (cov_result == 100.0) begin
...
end
```

## 4-State (1|0|X|Z) Data Types (1/2)

```plain
reg | logic [msb:lsb] variable_name [=initial_value]
```

Variables must be 4-state to emulate correct hardware behavior in simulation

- `reg` and `logic` are synonyms
- Used to drive/store DUT interface signals in testbench
- Initialized to `'x` if initial_value is not specified
  - `'x` in unsized literal
- Can be used in continuous assignment (single drive only), unlike `reg`
- Can be used as outputs of modules
- Defaults to `unsigned`

```verilog
logic[15:0] sample = '1, ref_data = 'x;
assign sample = vif.cb.dout;
```

## 4-State (1|0|X|Z) Data Types (2/2)

Sized 4-state data types

```verilog
integer variable_name [=initial_value]
```

- 32-bit signed data type

```verilog
time variable_name [=initial_value]
```

- 64-bit unsigned data type

```verilog
integer a = -100, b;
time current_time;
b = -a;
current_time = $time;
if (current_time > 100ms)
```

You can use time units in SystemVerilog

## String Data Type

```verilog
string variable_name [=initial_value]
```

Default to empty string `""`

Can be created with `$sformatf()` system function

Built-in operator and methods:

- `==`, `!=`, `compare()`, and `icompare()`
- `itoa()`, `atoi()`, `atohex`, `toupper()`, `tolower()`, etc
- `len()`, `getc()`, `putc()`, `substr()`
- See SystemVerilog LRM for more

```verilog
string name, s = "Now is the time";
for (int i=0; i<4; i++) begin
  name = $sformatf("string%0d", i);
  $display("%s, upper: %s", name, name.toupper());
end
s.put(s.len()-1, s.getc(5))
$display(s.substr(s.len()-4, s.len()-1))
```

`sformat`: This function formats a string and stores the result in a pre-existing string variable. It returns an integer indicating the number of characters written. You must pass the string variable as the first argument.

```verilog
string formatted_str;
int len = sformat(formatted_str, "Value: %0d", 42);
```

`sformatf`: This function works like sprintf in C. It formats a string and returns the result directly as a string without needing a pre-existing variable.

```verilog
string formatted_str = sformatf("Value: %0d", 42);
```

## Enumerated Data Types

Define enumerated type

```verilog
typedef enum [data_type] {named constants} enumtype;
```

Declare enum variables

```verilog
enumtype var_name [=initial_value];
```

- Data type default to `int`
- Variable initialized to `'0` if `initial_value` is not specified (`x` for a 4 state data_type)
- `enum` can be displayed as ASCII or value

```verilog
typedef enum bit[2:0] {IDLE=1, TEST, START} state_e;
state_e current, next = IDLE;
$display("current = %0d, next = %s", current, next);
$display("next = %p", next);
```

`%p` is designed to print a pretty representation of the data, which can be useful for composite data types like `struct`, `union`, `enum` `array` or `class` types.

It essentially help in visualizing complex data structures more easily and is particularly helpful for debugging and displaying hierarchical data types.

## Data Arrays - Fixed-size Arrays (1/4)

```verilog
type array_name[size] = [=initial_value];
```

```verilog
interger numbers[5];                       // arrays of 5 integers, indexed 0 - 4
int b[2] = '{3,7};                         // b[0] = 3, b[1] = 7

bit[31:0] c[2][3] = '{{3,7,1},{5,1,9}};    // Multidimensional
byte d[7][2] = '{default:-1};              // all elements set = -1

bit[31:0] a[2][3] = c;                     // array copy - types and sizes must be same
for (int i=0; i<$dimensions(a), i++) begin
  $display($size(a, i+1));                 // 2 3 32
end
```

`$size` returns size of particular dimension

`$dimensions` returns number of dimensions

## Data Arrays - Dynamic Arrays (2/4)

```verilog
type array_name[size] = [=initial_value];
```

Array size allocated at runtime with constructor

```verilog
logic[7:0] ID[], array1[] = new[16];
logic[7:0] data_array[], mdim[][];

ID = new[100];                     // allocate memory

data_array = new[ID.size()] (ID);  // copy types must match, constructor and copy
data_array = ID                    // Just copy

ID = new[ID.size() * 2] (ID);      // double the size of ID
ID = data_array;                   // ID resized to match data_array
data_array.delete();               // de-allocate memory
```

## Data Arrays - Queues (3/4)

```verilog
type array_name[$[:bound]] = [=initial_value];
```

You do not have to specify the size

Array memory allocated and de-allocated at runtime with

- `push_back()`, `push_front()`, `intert()`
- `pop_back()`, `pop_front()`, `delete()`

Can not be allocated with `new[]`

- `bit[7:0] ID[$] = new[16];  // Compilation error`

Index `0` refers to lower (first) index in queue

Index `$` refers to upper (last) index in queue

Can be operated on as an array, FIFO or stack

Optional bound in declaration is last index

```verilog
int j = 2;
int q[$] = {0,1,3,6};     // note no '
int b[$] = {4,5};         // note no '
q.insert(2,j);            // {0,1,2,3,6}
q.insert(4, b);           // {0,1,2,3,4,5,6}
q.delete(1);              // (0,2,3,4,5,6}
q.push_front(7);          // (7,0,2,3,4,5,6}
j = q.pop_back();         // (7,0,2,3,4,5}   j = 6
q.push_back(8);           // {17,0,2,3,4,5,8}
$display(q.size());       // 7
$display("%p", q);        // '{17,0,2,3,4,5,8}
q.delete();               // delete all elements
$display(q.size());       // 0
```

## Data Arrays - Associative Arrays (4/4)

```verilog
type array_name[index_type];   // indexed by specific type
```

Similar to a hash table in another languages

Index type can be any numerical, string or class type

Dynamically allocates and de-allocated

```verilog
integer ID_array[bit[15:0]];
ID_array[71] = 99;            // allocate memory
ID_array.detele(71);          // de-allocate one element
ID_array.detele();            // de-allocate all elements
```

Array can be traversed with

- `first()`, `next()`, `prev()`, `last()`

Number of allocated elements can be determined with call to `num()`

Existence of a valid index can be determined with call to `exits()`

```verilog
byte opcode [string], t[int], a[int]; int index;

opcode["ADD"] = -8;                             // create index "ADD" memory
for(int i=0; i<10; i++) begin
  t[1<<i] = i;                                  // create 10 array elements
end

a = t;                                          // array copy

$display ("num of elements in t is: 80d", t.num());

// process each element
if (t.first (index)) begin                      // locate first valid index
  $display("t[%0d] = %0d", index, t[index]);
  while(t.next(index)) begin                    // locate next valid index
    $display("t[%0d] = %0d", index, t[index]);
  end
end  // better to use `foreach` loop
```

## Array Loop Support and Reduction Operator

Loop: `foreach`

Support all array types

```verilog
int data[] = '{1,2,3,4,5,6,7}, qd[$][];
qd.push_back(data);
foreach(data[i]) begin
  $display("data[%0d] = %0d", i, data[i]);
end
// foreach(qd[i,j])  // to loop through 2-dimensional array
```

Reduction operators

```verilog
$display("sum of array content = %0d", data.sum());
$display("product value is %0d", data.product());
$display("and'ed value is = %0d", data.and());
$display("or'ed value is = %0d", data.or());
$display("xor'ed value is = %0d", data.xor());
```

## Array Methods (1/4)

```verilog
function array_type[$] array.find() with (expression)
```

- Finds all the elements satisfying the `with` expression
- Matching elements are returned as a queue

```verilog
function int_or_index_type[$] array.find_index() with (expression)
```

- Finds all indices satisfying the `with` expression
- Matching indices are returned as a queue

`item` references the array element during search

Empty queue is returned when match fails

## Array Methods (2/4)

Example: `find()` and `find_index()`

```verilog
module test;
  bit[7:0] SQ_array[$] = {2,1,8,3,5};
  bit[7:0] SQ[$];
  int idx[$];

  initial begin
    SQ = SQ_array.find() with ( item > 3 );            // item is default iterator variable
                                                       // SQ[$] contains 8,5
    idx = SQ_array.find_index(addr) with ( addr > 3 ); // addr is user defined iterator variable
                                                       // idx[$] contains 2,4
  end
endmodule
```

## Array Methods (3/4)

```verilog
function array_type[$] array.find_first() with ([expr]|1)
```

- First index satisfying the `with` expression is returned in `array_type[0]`

```verilog
function int_or_index_type[$] array.find_first_index() with ([expr]|1)
```

- First index satisfying the `with` expression is returned in `int_or_index_type[0]`

Always returns a queue of one or zero elements

- Empty queue is returned when match fails

If `with` expression is 1, first element or index is returned

`with` is mandatory for both methods

- `item` in expression references array element during search

## Array Methods (4/4)

Example: `find_first()` and `find_first_index()`

```verilog
module test;
  int array[] = new[5];
  int idx[$], val[$], dyn_2d[][], mixed_2d[$][];

  initial begin
    foreach(array[i]) begin
      array[i] = 4 - 1;
      val = array.find_first() with (item > 3);         // val[0] == 4
      idx = array.find_first_index() with (item < 0);   // idx == {}
    end
  end
endmodule
```

More array methods available - check LRM

## Data Arrays - Out-of-Bounds Access

Multiple dimensions are supported for all unpacked array types

- Can be heterogenous
  - eg. `int data[][]`, `bit[3:0] q_aa[$][string]`

For all unpacked array types - in their first (lowest) dimension

- Out-of-bounds write is ignored except for

```verilog
int addr[$:4] = {0,1,2,3,4}; addr.push_back(10); addr[0] = addr[5];
```

- Associative arrays (which cannot be bounded)
- Bounded queues - warning issued for out-of-bound write
- Out-of-bound read returns `'0` for 2-state, `'x` for 4-state arrays

## Array Summary

| Type        | Memory                                             | Index     | Example (performance)         |
| ----------- | -------------------------------------------------- | --------- | ----------------------------- |
| Fixed Size  | Allocated at compile time, unchangeable afterwards | Numerical | `int addr[5];     (fast)`     |
| Dynamic     | Allocated at run time, changeable at run-time      | Numerical | `logic flags[];   (fast)`     |
| Queue       | Push/pop/copy at run-time to change size           | Numerical | `int in_use[$];   (fast)`     |
| Associative | Write at run-time to allocate memory               | Typed\*   | `state d[string]; (moderate)` |

> Note: The index of associative arrays should always be typed

Standard array - All memory elements allocated, even if unused

Associative array - Unused elementes do not use memory

## `struct` - Data Structure

Defines a wrapper for a set of variables

- Similar to C `struct` of VHDL `record`

- Integral variables can be attributed for randomization using `rand` or `randc`

```verilog
typedef struct {
  data_type variable0;
  data_type variable1;
} struct_type;
```

```verilog
typedef struct {
  rand int my_int;
  real my_real;             // Can not randomize `real` variables
} my_struct;

my_struct var0, var1;
var0 = {32, 100.2};
var1 = {default:0};        // Both fields set to 0
var1.my_int = var0.my_int;
```

## `union` - Data Union

Overloading variable definition similar to C `union`

- `packed` and unpacked unions supported in VCS
  - All members of packed must be of same size unless `tagged`
  - VCS can not randomize unions

`union packed`

```verilog
typedef union packed {
  data_type variable0;
  data_type variable1;
} union_type;
```

Example:

```verilog
typedef union packed {
  int my_int;              // All members must have same size
  bit [2][15:0] my_val;
} my_union;

my_union var1, var1;
var0.my_int = 32;
var1.my_val = 100;
var1.my_int = var0.my_int; // Different view of same data
```

`union tagged packed`

```verilog
union tagged packed {
  data_type0 variable0;
  data_type1 variable1;
} union_variable;
```

Example:

```verilog
union tagged packed {
  int my_i;
  bit my_r;                  // tagged union members may have different size
} my_var0, my_var1;

my_var0.my_i = 32;
my_var1.my_r = '1;
my_var1.my_i = my_var0.my_i; // Wrong
```

For union tagged packed once you have use one variable you can not use the other.

## System Functions: Randomization

`$urandom`: Return a 32-bit unsigned random number

- Initial seed can be set with run-time switch: `+ntb_random _seed=seed_value`
- Object/Thread/Scope level seed can be set with `srandom(seed)`
- `$random` Verilog function gives poor distribution and repetability (**DO NOT USE**)

`urandom_range(max, [min])`: Return a 32-bit unsigned ranfom number in specified range

- `min` is 0 if not specified

`randcase`: Select a weighted executable statement

```verilog
randcase
  10 : f1();
  20 : f2();                 // f2() is twice as likely to be executed as f1()
  50 : x = 100;
  30 : randcase ... endcase; // randcase can be nested
endcase
```

## User Defined Types and Type Cast

Use `typedef` to create an alias for another type

```verilog
typedef bit[31:0] uint;
typedef bit[5:0]  bsix_t;   // Define a new type
bsix_t my_var;              // Create 6-bit variable
```

Use `<type>'(value|variable)` to convert data types (static cast - checks done at compile-time)

```verilog
bit[7:0]  payload[];
// int is a sindned type. Use cara when randomizing
int temp = $urandom();                     // temp can be negative
payload = new[(temp % 3) + 2];             // (temp % 3) can be -2
payload = new[(uint'(temp) % 3) = 2];      // temp cast to uint
payload = new[(unsigned'(temp) % 3) = 2];  // can also cast to unsigned
```

## Operators

| Operator    | Description              |
| ----------- | ------------------------ |
| `+ - * /`   | arithmetic               |
| `%`         | modulus div ision        |
| `++ --`     | increment, decrement     |
| `> >= < <=` | relational               |
| `!`         | logical negation         |
| `&&`        | logical and              |
| `\|\|`      | logicar or               |
| `==`        | logical equiality        |
| `!=`        | logical inequality       |
| `===`       | case equality            |
| `!==`       | case inequality          |
| `==?`       | wildcard case equality   |
| `!=?`       | wildcard case inequality |
| `<<`        | logical shift left       |
| `>>`        | logical shift right      |
| `<<<`       | arithmetic shift left    |
| `>>>`       | arithmetic shift right   |
| `~`         | bitwise negation         |
| `&`         | bitwise and              |
| `&~`        | bitwise nand             |
| `\|~`       | bitwise nor              |
| `\|`        | bitwise inclusive or     |
| `^`         | bitwise exclusive or     |
| `^~`        | bitwise exclusive nor    |
| `{}`        | concatenation            |
| `&`         | unary and                |
| `~&`        | unary nand               |
| `\|`        | unary or                 |
| `~\|`       | unary nor                |
| `^`         | unary exlusive           |
| `~^`        | unary exlusive nor       |
| `?:`        | conditional (ternary)    |
| `inside`    | set membership           |
| `iff`       | qualifier                |

Assignment:

```verilog
= += -+ *= /= %= <<= >>= <<<= >>>= &= |= ^= ~&= ~|= ~^=
```

## `inside` Operator

Use `inside` operator to find an expression within a set of values

```verilog
bit[31:0] smpl, r1, r2; int golden[$] = {3,4,5};
if (smpl inside {r1, r2}) ...           // (smpl == r1 || smpl == r2)
if (smpl inside {[r1, r2]}) ...         // (smpl inside range r1 to r2)
if (result inside {1, 2, golden}) ...   // sample as {1,2,3,4,5 }
```

`inside` operator uses

- `==` operator on non-integral expressions
- `==?` on integral expression
  - `x` and `z` are ignored in set of values
  - wildcard (`?`) preferred instead of `x` and `z`

Example:

```verilog
if (result inside {3b'1?1, 3'b00?} ) // {3'b101, 3'b111, 3'b000, 3'b001}
```

## `iff` Operator

Use `iff` operator to qualify

- event controls
  - `@(vif.cb iff(vif.cb.frame[prt_id]) !== 0)`
- property execution
- coverage elements
  - cover points
  - bin of cover points
  - cross coverage
  - cross coverage bins

## Know Your Operators

What is printed to console with following code?

```verilog
logic[3:0] sample, ref_data;
sample = dut.cb.dout[3:0];
if (sample != ref_data) begin
  $display("Error!");
end else begin
  $display("Pass!");
end
```

- When `sample = 4'b1011 & ref_data = 4'b1010`
- When `sample = 4'b101x & ref_data = 4'b1010`
- When `sample = 4'b101x & ref_data = 4'b101x`

Avoid false positives by checking for pass condition

```verilog
sample = dut.cb.dout[3:0];
if (sample == ref_data) begin
  $display("Pass!");
end else begin
  $display("Error!");
end
```

## Sequential Flow Control

Conditionals

- `if (x == 7) a = 7; else a = 8;`
- `a = (x == y) ? 7 : 8;`
- `assert(true condition);`
- `case(expr) 0: ...; 1: ...; default: ...; endcase`

Loops

- `repeat(expr) begin ... end`
- `for(expr; expr; expr;) begin ... end`
- `forarch(array[index]) begin  ... end`
- `forever begin ... end`
- `while(expr) begin ... end`
- `do begin ... end while (expr);`
- `break` to terminate loop
- `continue` to terminate current loop iteration

## Subroutines (`task` and `function`)

Tasks can block

Functions can not block

Subroutine lifetime

- Default to `static` in `program`, `module`, `package`, `interface`
- Default to `automatic` in `class`
- Can be made `automatic`

Subroutine variables

- Default to subroutine scope and lifetime
- Can be made `automatic` or `static`

```verilog
task print_sum(ref int a[], intput int start = 0);   // Pass by value, Default value
  automatic int sum = 0;
  for (int j = start; j < a.size(); j++>) begin
    sum += a[j];
  end
  $display("Sum of array is %0d", sum);
endtask // task does not return value

print_sum(my_array)
```

```verilog
function automatic int factorial(int n);   // Pass by value
  static int shared_value = 0;
  if (n < 2) begin
    return 1;
  end else begin
    return (n * factorial(n-1) );
  end
endfunction // function return value

result = factorial(my_val);
```

Tasks are `static` by default, while functions are `automatic` by default.

The qualifier goes on the right of the `task` of `function` keyword.

## Subroutine Argument Binding and Skipping

Argument can be bounde (passed) to the subroutine by

- Position
- Name

Arguments can be skipped if they have default values

```verilog
module test;
  task tally(ref byte a[], input logic[15:0], b, c = 0, u, v);
  ...
  endtask

  initial begin
    logic[15:0] B = 100, C = 0, D = 0, E = 0;
    byte A[] = {1,3,5,8,13};                     // Skipped arguments use default value
    tally(A, B, ,D, E);                          // Arguments passed by position
    tally(.c(C), .b(B), .a(A), .u(D), .v(E) );   // Arguments passed by name
  end
endmodule
```

## Subroutine Arguments

Type and direction are both sticky

- Any following arguments default to that type and direction

| Direction   | Effect                                                                                                                                            |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `input`     | copy value in at beginning - default                                                                                                              |
| `output`    | copy value out at end                                                                                                                             |
| `inout`     | copy in at beginning and copy out at return                                                                                                       |
| `ref`       | pass by reference, makes argument variable the same as the calling variable. Change to argument variable will change calling variable immediately |
| `const ref` | pass by reference but read only. Saves time and memory for passing arrays to task and functions                                                   |

Default direction is `input`, default type is `logic`

```verilog
task T3(a, b, output bit [15:0], u, v, const ref byte c[]);
// Default direction is input, default type is logic
// a, b: input logic
// u, v: output bit [15:0]
// Read-only pass via reference
```

## Output Mechanism in Tasks

`tasks` in SystemVerilog do not "return" values in the same way functions do. However, tasks can modify the variables passed to them through `output`, `inout`, or `ref` arguments, which allows the caller to receive values after the task completes.

The difference lies in how tasks and functions are designed:

- Functions return a single value and are used in expressions (e.g., `y = f(x)`).
- Tasks do not return values directly, but can modify the arguments passed to them, including multiple variables, through their `output` or `inout` arguments.

When using `output` the `task` does not "return" a value per se, but it a assigns a value to the argument. This assignment is simulat to how variables are modified by reference.

```verilog
module tb;
   int x = 10;
   int result;

   // Define a task with an output argument
   task add_one(input int a, output int b);
      b = a + 1;  // Task modifies 'b', which reflects back to the caller
   endtask

   initial begin
      // Call the task
      add_one(x, result);
      $display("Result: %0d", result);  // Displays 11
   end
endmodule
```

What Happens Here:

- The task `add_one` is called with `x` as an input (which is 10).
- The task calculates `x + 1` and assigns this value to `b`, which is an `output`.
- The caller (testbench) receives this value in the result variable.
- So, although the task doesn’t "return" a value like a function, it modifies result using the output mechanism.

Why Use output in Tasks?

You use output when:

- You want to pass a result back to the calling code without using a function (since tasks can have more than one output).
- The task is too complex to be implemented as a function, like when it requires delays (#), waits, or multiple outputs.

Differences between `output`, `inout`, and `ref`

- `output`: Used for returning a value. The value is assigned at the end of the task and passed back to the caller.
- `inout`: Used when a variable is both read and written inside the task. The argument is passed in, modified, and then passed back out. -`ref`: Direct reference to the original variable, allowing changes inside the task to immediately affect the variable in the caller's scope.

When to Use Tasks Instead of Functions:

- Tasks allow multiple outputs.
- Tasks can perform sequential operations with delays (`#`, `@`).
- Tasks can modify external states through `output` or `inout`.

Tasks do not have a return value but instead modify arguments using the `output` direction to pass values back.

## Test for Understanding

What is the direction and data type of each argument?

```verilog

task T3(ref byte a[], logic[15:0] b, c, output u, v);
  b = c;
  foreach(a[i]) begin
    a[i] = i;
  end
endtask

initial begin
  logic[15:0] B = 100, C = 0, D = 0, E = 0;
  byte A[] = {1,3,5,8,13};
  T3(A,B,C,D,E);
  foreach(A[i]) begin
    $display(A[i]);
  end
  $display(B,C,D,E);
end
```

Output:

```plain
0
1
2
3
4
0    0    X    X
```

> Note: If the output is not assign inside the `task` it becomes `X`.

## Code block Lifetime Controls

Simulation ends when all programs/modules end

- Execution of a `program` ends when
  - All `initial` blocks in `program`/`module` reach end of code block, or `$finish` is executed

Execition of a subroutine ends when one of

- `endtask`, `endfunction` is encountered
- `return` is executed

Execution of a loop ends when one of

- `end` (of loop `begin`) is encountered
- `break` is executed

Execution of loop immediately advances to next iteration when

- `continue` is executed

## Helpful Debuggin Features

What to print for debugging?

- Use `%t` and `%m` to print the simulation time and location of call
- Indicate severity of message

```verilog
function void check();
  static int cnt = 0;
  string message;
  if (!compare(message)) begin
    // %m hierarchical path to check()
    // Indicate message severity (ERROR, DEBUG, etc.)
    // $realtime Simulation time
    $display("%m\n[ERROR]%t: %s," $realtime, message);
    $finish;
  end
  $display("[NOTE]%t: %0d Packets passed\n" $realtime, ++cnt);
endfunction : check
```

- Use `$timeformat` to set the format to `%t`

```verilog
$timeformat( units, precision, suffix_string, minimum_field_width)
```

`$time` returns time as a 64-bit integer

`$realtime` return time as a real value

Most common timeformat is

```verilog
$timeformat(-9, 0, "ns", 10);
```

## Testbenchs Require Concurrency

Components of the testbench run concurrently

- Concurrent components run as separate threads
- The Generator and Driver are concurrent components

<div style="text-align: center;">
  <img src="img/test_env_concurrency.svg" alt="test_env_concurrency" width=90%"/>
</div>

## Concurrency in Simulator

A simulator can only execute one thread at a time in a single-core CPU

- Multiple thread waiting to execute at one simulation time point are scheduled in queues to run one-at-a-time

<div style="text-align: center;">
  <img src="img/concurrency.svg" alt="concurrency" width=90%"/>
</div>

## Creating Concurrent Threads

Concurrent threads are created in a `fork-join` block

```verilog
int a, b, c;                 // parent variables
fork
  [fork local declarations]  // visible to all child threads
  statement0;                // child thread 1
  begin                      // child thread 2
    statement1;
    statement2;              // statement1 and statement2 execute sequentially
  end
join | join_any | join_none
statement3;
```

- Statements enclose in `begin-end` in a `fork-join` block are executed sequentially as a single concurrent child thread
- No predetermined execution order for concurrent threads

## How Many Child Threads?

A:

```verilog
fork
  begin
    recv();
  end
  begin
    send();
  end
join
```

Answer: Two child threads, one for each `begin`, `end` block

B:

```verilog
fork
  recv();
  send();
join
```

Answer: Two child threads, one each task

C:

```verilog
fork
  begin
    recv();
    send();
  end
join
```

Answer: One child threads, `recv()` and `send()` operate sequentially

D:

```verilog
fork
  begin
    begin
      recv();
      send();
    end
    check();
  end
join
```

Answer: One child threads, the outer `begin`, `end`, all tasks inside operate sequentially

## Join Options

```verilog
fork
  statement1;
  statement2;
  statement3;
join | join_any | join_none
statement4;
```

- `join`: Child threads execute and all child threads must complete before `statement4` is executed

- `join_any`: Child threads execute and one child threads must complete before `statement4` is executed. Other child threads continue to run

- `join_none`: Child threads are queued, `statement4` executes. Child threads not executed until parent thread encounter a blocking statement or completes

## Thread Execution

Once a thread executes

- It continues to execute until finished or a blocking statement is encountered
- Child threads generated by it are queued

When executing threads encounter a blocking statement

- It is queued and a queued ready thread executes

Time advances when all threads are blocked

Examples of blocking statements:

```verilog
@(vif.cb);
wait(var_a == 1);
#10;
join_any
join
```

## Thread Execution Model

One execution thread, all other threads reside on queues

- READY - to be executed ar current simulation time
- WAIT - blocked from execution until wait condition is met

When the executing thread is blocked, it moves to the WAIT queue

- The next READY thread then executes

Simulation time advances when all threads are in WAIT

## Thread Design (1/2)

Will this work?

```verilog
a = 0;
fork

  begin : thread_1
    while(a != 5) begin
      if($time > MAX_TIME) begin
        $finish;
      end
    end
  end

  begin : thread_2
    repeat(5) @(vif.cb);
    bus.cb.reg <= 1'b1;
    a = 5;
  end

join
```

Answer: No, because there is no blocking statement in `thread_1`

## Thread Design (2/2)

In multi-threaded programs, all threads must be finite or advance the clock!

```verilog
a = 0;
fork

  begin : thread_1
    while(a != 5) begin
      if($time > MAX_TIME) begin
        $finish;
      end else begin
        @(bus.cb);
      end
    end
  end

  begin : thread_2
    repeat(5) @(vif.cb);
    bus.cb.reg <= 1'b1;
    a = 5;
  end

join
```

## Thread vs Program Completion

```verilog
module test;
  initial begin
    for(int i = 0; i < 16; i++>) begin
      send(i);
    end
  end

  task send(int j);
    fork
      begin
        $display("Driving port %0d", j);
        #1ns;
      end
    join_none
  endtask : send
endmodule
```

Simulation ends at time 0, Why?

With the `fork`, `join_none`, child thread are queued, this happens 16 times, and they are expected to run at time `1ns` but because there is no blocking statement after the `for` loop then the `initial` block ends at time zero and the threads are never executed. There is nothing preventing the `initial` block from ending.

## Waiting for Child Threads to Finish

To prevent improper early termination of simulation, use `wait fork`

- Suspends parent thread until all children threads have completed execution

```verilog
module test;
  initial begin
    for(int i = 0; i < 16; i++) begin
      send(i);
    end
    wait fork;  // Blocking statement to control proper termination
  end           // of simulation

  task send(int j);
    fork
      begin
        $display("Driving port %0d", j);
        #1ns;
      end
    join_none
  endtask : send
endmodule
```

## Thread Execution Issues

```verilog
module test;
  initial begin
    for(int i = 0; i < 16; i++) begin
      fork
        send(i);
      join_none
    end
    wait fork;
  end

  task send(int j);
    $display("Driving port %0d", j);
    #1ns;
  endtask : send
endmodule
```

Output:

```plain
Driving port 16
Driving port 16
Driving port 16
Driving port 16
...
Driving port 16
Driving port 16
Driving port 16
```

Why?

Answer:

When the for `loop` is unrolled, all the threads are queued one after the other, but they do not execute immediately. Instead, all 16 threads are queued in the READY state. In this queue, 16 `send(i)` calls are waiting to execute, but none have started yet. Once the last thread is queued, all of them execute at the same time. However, by the time this happens, `i` has already reached 16. As a result, all the threads use the same value of `i`.

Threads scheduled for execution at current simulation time, but `i == 16` before they execute.

## Thread Execution Issues: Local Variable

Local variables once created are local to the child context

- Can copy parent variable in `fork` declarative space

```verilog
module test;
  initial begin
    for(int i = 0; i < 16; i++) begin
      fork
        int index = i;   // local fork variable
        send(index);
      join_none
    end
    wait fork;
  end

  task send(int j);
    $display("Driving port %0d", j);
    #1ns;
  endtask : send
endmodule
```

Output:

```plain
Driving port 0
Driving port 1
Driving port 2
...
Driving port 15
```

Variables are created in the declarative space of each `fork`, `join_none`

## Implement Watch-Dog Timer with `join_any`

Typically used in conjunction with `disable fork`

```verilog
task recv();
  fork
    begin : frameo_n_neg
      wait(vif.cb.frameo_n[7] !== 1'b0);
      @(vif.cb iff(vif.cb.frameo_n[7] === 1'b0) );
    end
    begin : timer
      repeat(1000) @(vif.cb);
      $display("Timed out!");
      $finish;
    end
  join_any
  disable fork;  // Kills all child threads!
  get_payload();
endtask
```

<div style="text-align: center;">
  <img src="img/watchdog.svg" alt="watchdog" width=90%"/>
</div>

## Avoid `disable fork` problems

Use enclosing `fork join` to localize `disable fork`

```verilog
task recv();
  fork begin // enclosing fork-join
    fork        // You can use : revc_wd_timer
      begin : frameo_n_neg
        wait(vif.cb.frameo_n[7] !== 1'b0);
        @(vif.cb iff(vif.cb.frameo_n[7] === 1'b0) );
      end

      begin : timer
        repeat(1000) @(vif.cb);
        $display("Timed out!");
        $finish;
      end
    join_any

    disable fork;  // Kills all child threads
    // disable recv_wd_timer;          this is legal but NOT RECOMMENDED
  end join
  get_payload();
endtask
```

One thing you have to be aware is that `disable fork` works differently for `forks` issued inside classes vs outside classes.

The rule for `disable fork` is that it is going to disable all child processes including any child processes that where created by the original caller.

So if this task was called from another place where they were others threads running we are going to disable those threads as well. The solution is to put a `fork join` around the entire task.

So now the `disable fork` will only work within this two threads and not any threads outside of this.

You can also `disable fork` by level, but in classes if you have multiple objects of the same class all objects will be disable, not just the one you called.

## Abstraction Enhances Re-Usability of Code

Some common objects that you can reuse across multiple projects are:

- Generator
- Transactor
- Driver
- Monitor

and so on

## SystemVerilog OOP Program Constructs

Building SystemVerilog OOP structure is similar to building Verilog RTL structure

|                  | RTL                                                         | OOP                              |
| ---------------- | ----------------------------------------------------------- | -------------------------------- |
| Block definition | `module`                                                    | `class`                          |
| Block instance   | instance                                                    | object                           |
| Block name       | instance name                                               | object handle                    |
| Data types       | registers and wires                                         | variables                        |
| Functionality    | `task`, `function`, behavioral blocks (`always`, `initial`) | subroutines (`task`, `function`) |

Unlike in a `module`, nothing executes automatically in an object. Some subroutine in the object mst be called to perform an action.

## OOP Encapsulation (OOP Class)

Similar to a `module`, an OOP `class` encapsulates:

- Variables (properties) used to model a system
- Subroutines (methods) to manipulate the data
- Properties and methods are called members of class
- Class properties and methods are visible inside the class

```verilog
class Packet;
  // Packet properties
  string   name;
  bit[3:0] sa, da;
  bit[7:0] payload[];

  // Packet methods
  task send();
    send_addrs();
    send_pad();
    send_payload();
  endtask : send

  task send_addrs();   ... endtask
  task send_pad();     ... endtask
  task send_payload(); ... endtask
endclass : Packet
```

## `module` vs `class`

Why use `class`?

- Objects are dynamic, modules are static
  - Objects are created and destroyed as needed
- Instances of modules can not be passed, copied or compared
  - Instances of classes are objects
  - A handle points to an object (class instance)
  - Object handles can be passed as arguments
  - Objects memory can be copied or compared
- Classes can be inherited, modules can not
  - Classes can be modified via inheritance without impacting existing users
  - Modifications to modules will impact all existing users

## Constructing OOP Objects

OOP objects are constructed from `class` definitions

- Similar to instance creation from `module` definition

Object memory is constructed by calling `new()`

- Handle used to refer to object

```verilog
class Packet;
  bit[3:0] sa, da;
  byte payload[];
  task send();
endclass : Packet
```

```verilog
module test;
  Packet pkt1 = new();
  Packet pkt2;       // This is a handle
  Packet pkt3;
  initial begin
    pkt3 = new();
    pkt2.sa = 3;      // Runtime Error
  end
endmodule
```

<div style="text-align: center;">
  <img src="img/handle.svg" alt="handle" width=90%"/>
</div>

## Accessing Object Members

Object members are accessed using the object handle

- Similar to accessing RTL instance signals and subroutines
- Accessed via dot (.) notation

```verilog
module test;
  class Packet;
    bit[3:0] sa, da;
    byte payload[];
    task send();
  endclass : Packet

  Packet pkt;
  initial begin
    pkt = new();
    pkt.sa = 3;  // access property
    pkt.da = 7;  // access property
    pkt.send();  // access method
  end
endmodule
```

## Initialization of Object Properties

Define constructor `new()` in class to initialize properties

- No return type in declaration
- Executes immediately after object memory is allocated
- Not accessible via dot (.) notation

The constructor should

- Allocate memory
- Initialize variables
- Nothing else!

If constructor `new()` is not defined a default is provided

```verilog
module test;

  class Packet;
    bit[3:0] sa, da;
    bit[7:0] payload[];
    function new(bit[3:0] init_sa, init_da, int init_payload_size);
      sa = init_sa;
      da = init_da;
      payload = new[init_payload_size];
    endfunction : new
  endclass : Packet

  initial begin
    Packet pkt1 = new(3, 7, 2);
    pkt1.new(5, 8, 3);          // Syntax error!
  end

endmodule
```

## Initialization of Object Properties: `this`

`this` keyword

- An object's handle to itself
- Unambiguously refer to `class` members of the current instance (object)
  - More readable - allows method arguments to have same name as `class` variables

```verilog
class Packet;
  bit[3:0] sa, da;
  bit[7:0] payload[];
  function new(bit[3:0] sa, da, int payload_size);
    this.sa = sa;
    this.da = da;
    this.payload = new[payload_size];
  endfunction : new

endclass : Packet
```

## OOP Data Hiding (Integrity of Data) (1/3)

Unrestricted access to object properties can cause unintentional data corruption

```verilog
class driver;
  int max_err_cnt = 0, err_cnt = 0;
  task run();
  ...
    if (error_cond()) begin
      err_cnt++;
    end
    if ( (max_err_cnt != 0) && (err_cnt >= max_err_cnt) ) begin
      $finish;
    end
  endtask
  function new();  .... endfunction
endclass : driver
```

```verilog
module test();
  initial begin
    driver drv = new();
    drv.max_err_cnt = -1;  // directly set max_err_cnt
    drv.run();             // Will this work?
  end
endmodule
```

`max_err_cnt` should not be able to be `-1`;

## OOP Data Hiding (Integrity of Data) (2/3)

Properties and methods can be protected using `local` or `protected`

- Object members are `public` by default
- `local` members of object can be accessed only in the class (base), like routines, they can not be access externally or by an extended class
- `protected` members can be access by subclasses (extended from base) and also by base class

```verilog
module test;
  class driver;
    local int max_err_cnt = 0;
    protected err_cnt = 0;
    task run(); ... endtask
  endclass : driver

  initial begin
    driver drv = new();
    drv.max_err_cnt = -1;    // Compile error!
    drv.run();
  end
endmodule
```

## OOP Data Hiding (Integrity of Data) (3/3)

Create public `class` method to allow users to access `local` members

- Ensure data integrity within the method

```verilog
class driver;
  local int max_err_cnt = 0, err_cnt = ;
  task run(); ... endtask
  function set_max_error_cnt(int max_err_cnt);
    if(max_err_cnt < 0>) begin  // Ensure integrity of object data
      this.max_err_cnt = 0;
      return;
    end else begin
      this.max_err_cnt = max_err_cnt;
    end
  endfunction
endclass : driver
```

```verilog
module test;
  initial begin
    driver drv = new();
    drv.set_max_err_cnt(-1);    // No Compile error!
    drv.run();
  end
endmodule
```

## Working with Objects - Handle Assignment

What happens when one object handle is assigned to another?

Like any variable, the target takes on the value of the source.

```verilog
class Packet;
  int payload_size;
  ...
endclass : Packet

Packet pkt1 = new();
Packet pkt2 = new();

pkt1 = pkt2;             // handle copy, not object copy
pkt1.payload_size = 5;   // whose payload_size is set?
```

What happens to the `pkt1` object memory?

<div style="text-align: center;">
  <img src="img/handle2.svg" alt="handle2" width=90%"/>
</div>

Object handles are similar to pointers. The handle points to a specific space in memory. So the answer is that `pkt1` memory is gets clean up by the simulator and that memory is free to be use for something else, this is the garbage collector

## Working with Objects - Garbage Collection

VCS garbage collector reclaims memory automatically

- When an object memory is no longer accessible
- Object has no schedule event

Object can be manually dereference using

```verilog
pkt1 = null;
```

Making an exact duplicate of object memory:

```verilog
class Packet;
  int count;
  Payload p:             // Encapsulated object
endclass: Packet
...
Packet pkt1 = new();
Packet pkt1_copy;        // handle only
pkt1.p = new();

// construct pk1_copy and
// copy contents of pkt1 to pkt1_copy

pkt1_copy = new pkt1;     // Do not do this
// shallow copy
// (encapsulated objects not copied)
// They both have the same point to Payload p
// object pkt1 must exist
```

This method of copying is not recommended.
Normally every class that needs it should provide a `copy()` method

```verilog
pkt1_copy = pkt1.copy();
```

## Working with Objects - `static` Members

Variables and subroutines can be defines using `static` keyword

- Associated with the class, not object
- Shared by all objects of that class
- Can be accessed using `class_name::`
- Can be accessed also using `handle.<static_variable>`

Static subroutines

- Can only access `static` members
- Can not be `virtual`

Static members are allocated and initialized at compile

```verilog
module test;
  initial begin
    Packet pkt0 = new();
    Packet pkt1 = new();
    $display("pkt0 id is: %0d", pkt0.id);
    $display("pkt1 id is: %0d", pkt1.id);
    $display("count: %0d", Packet::count);
  end
endmodule
```

```verilog
class Packet;
  static int count = 0;
  int id;

  static function int get_count();
    return count;
  endfunction

  function new();
    this.id = count++;
  endfunction
endclass : Packet
```

## Working with Objects - `const` Properties

Use `const` keyword to define constant properties that can not be modified

- Global constant - typically also declared `static`
- Instance constant - can not be `static`

```verilog
class Packet;
  static int count = 0;
  const int id;                             // Instance constant

  static const string type_name = "Packet"; // Global constant

  function new();
    this.id = count++;                      // Instance constant can only be assigned in new()
  endfunction
endclass : Packet
```

```verilog
module test;
  initial begin
    Packet pkt0 = new();
    pkt0.id = 0;                   // Compile error - can not change const property
    pkt0.type_name = "newPacket";  // Compile error
  end
endmodule
```

## Working with Objects - Array Methods

```verilog
class Packet;
  rand bit [7:0] payload[];   // Data
  rand bit [2:0] pr;          // User-defined Priority 0-7
  rand bit [2:0] addr;        // Address
endclass : Packet

Packet pq[$];                 // Queue of packet handles
initial begin
  int len;

  generate_packet_queue(pq);  // Some user-defined method
  // Sort objects using user-defined priority property in class
  pq.sort(pkt) with (pkt.pr); // pkt is user-defined, auto-declared iterator
  // Find total length of all payloads - item is default iterator
  len = pq.sum() with (item.payload.size());
end
```

## Working with Objects - Concurrency

Classes can not have initial or `always` blocks

Spawn a process similar to an `always` block with `fork-join_none`

Standard methodology

- Test call `run()` method of the various OOP testbench components
  - Generator, Monitor, Driver, Scoreboard, etc

```verilog
class Driver;
...
task run();       // Thread start method
  fork
    forever begin
      send();
    end
  join_none
endtask : run

endclass : Driver
```

## Parameterized Classes

Written for generic types and/or values

- Parameters passed at instantiation, just like parameterized modules
- Allows reuse of common code

```verilog
module test;
  int_stack addr_stack;
  Packet_stack data_stack;

  initial begin
  ...
    repeat(addr_stack.size()) begin
      Packet pkt = new();
      if (!pkt.randomize()) begin
        $finish;
      end
      pkt.addr = addr_stack.pop();
      data_stack.push(pkt);
    end
  end
endmodule
```

```verilog
class int_stack;
  protected int items[$];
  function void push(int a);
  ...
  function int pop();
  function int size();
endclass : stack
```

```verilog
class stack #(type T = int, bit[11:0] depth = 1024);
  protected T items[$:depth];
  function void push(T a);
  ...
  function T pop();
  function int size();
endclass : stack
```

```verilog
module test;
  stack addr_stack;  // Default type
  stack #(Packet, 128);

  initial begin
  ...
    repeat(addr_stack.size()) begin
      Packet pkt = new();
      if (!pkt.randomize()) begin
        $finish;
      end
      pkt.addr = addr_stack.pop();
      data_stack.push(pkt);
    end
  end
endmodule
```

`type` is a keyword and `T` is the placeholder name of the type of variable.

## Forward `typedef`

A forward `typedef`

- Is needed to use a class before declaration
  - e.g. two classes need handle to each other
    Can be used for many data typeCan be used for many data types

Use a `typedef` to make a forward reference, the problem we are trying to solve is what happens when two classes reference each other? Which one do we declare first?

With `typedef` we are telling the compiler that while at the time of compiling `Packet` seems to be undefined it is going to be define it before leaving the file. This solves the problem of circular reference.

```verilog
typedef class Packet;
class Generator;
  Packet p1;            // This is a compile error is typedef is missing
  function new();
    p1 = new();
    p1.mygen = this;
  endfunction
endclass : Generator

class Packet;
  bit[7:0] sa, da, payload[$];
  Generator mygen;
endclass : Packet
```

## Best Practices (1/2)

Placed class methods outside of the `class` definition

- Inside `class` block, associate the method with its class
- Outside `class` block, associate the method with its class
  - Use double-colon :: (a scope/name resolution operator)

```verilog
class node;
  static int count = 0;
  string str;
  node next;
  ...
  task ping();
  ...
  endtask : ping
endclass : node
```

```verilog
class node;
  static int count = 0;
  string str;
  node next;
  ...
  extern task ping();  // Prototype
endclass : node

task node::ping();     // Place class name and double-colon before method name
...
endtask : ping
```

## Best Practices (2/2)

Create useful methods for data classes (user defined)

- `display()`

  - Print object variables to console - helpful for debugging

- `compare()`

  - Return match, mismatch, other status based by comparing object variables to variables of another object
  - Simplifies self-check

- `copy()`
  - Copy selected variables or nested objects
  - Allows you to do deep copy if required

Use `typedef` to create shortcuts

- `typedef stack#(Packet) pkt_stack`
  - Now use `pkt_stack` instead of `stack#(Packet)`

## Virtual Interfaces

Classes need to drive/sample signals of interface

- Interfaces can not be created at object construction. Need to create a `virtual` reference to interface

```verilog
class Driver;
  virtual router_if.TB vif;              // Create virtual reference to interface
  ...
  function new(virtual router_if.TB vif) // Pass virtual connections via constructor argument
    this.vif = vif;
  endfunction : new

  task send_addr();
    this.vif.cb.frame_n[sa] <= 1'b0;    // Drive/Sample signals using virtual interface
    for (int i = 0; i < 4; i++) begin
      this.vif.cb.din[sa] <= da[i];
      @(this.vif.cb);
    end
  endtask: send_addr
endclass : Driver
```

## SystemVerilog Packages

Package is a mechanism for sharing among modules, programs, interfaces and other packages:

- Parameters
- Data - variables and nets
- Type definitions
- Tasks and functions
- Sequence and property declarations
- Classes

Declarations may be referenced within modules, interfaces, programs and other packages

## Packages: Example

```verilog
package ComplexPkg:
  class Complex;
    float i, r;
    extern virtual task display();
    ...
  endclass : Complex

  function automatic Complex add(Complex a, Complex b);
    add = new();
    add.r = a.r + b.r;
    add.i = a.i + b.i;
  endfunction : add

  function automatic Complex mul(Complex a, Complex b);
    mul = new();
    mul.r = (a.r * b.r) - (a.i * b.i);
    mul.i = (a.r * b.i) + (a.i * b.r);
  endfunction : mul
endpackage : ComplexPkg
```

Task and Functions inside a package are `static` by default, for that reason the `automatic` keyword is necessary

## Rules Governing Packages

Packages are explicitly named scopes appearing at the outermost level of the source text (at the same level as top-level modules as primitives)

Packages must not contain any processes

- Wire declarations with implicit continuous assignments are not allowed

Packages can not gave hierarchical references

> Note: Subroutines defined in a `package` are `static` unless explicitly made `automatic`. Classes are always `automatic`

## Using Packages

Directly reference package member using class scop resolution operator `::`

```verilog
ComplexPkg::Complex cout = ComplexPkg::mul(a,b);
```

`import` package into appropriate scope

- Explicit import of specific symbols
  - `import ComplexPkg::Complex;`
  - `import ComplexPkg::add;`
- Implicit import of all symbols in package
  - `import ComplexPkg::*`
  - Now all symbols in `ComplexPkg` are visible
- OK to import same package in multiple locations
  - `include` cannot be used in multiple places

## Using Packages: Example (1/2)

```verilog
// Implicit import all symbols
module dut(if.dut_port dut_io);
  import ComplexPkg::*;         // Import whole package
  Complex l,m,n;
endmodule : dut
```

```verilog
// Import of specific symbol
module test(if.tb_port tb_io);
  import ComplexPkg::Complex;  // Import specific symbols
  ...
endmodule : test
```

```verilog
// Direct reference
class harmonix;
  ComplexPkg::Complex i,j;    // Direct reference using ::
  ...
endclass : harmonix
```

## Using Packages: Example (2/2)

Packages can be imported by other packages

`export` allows a package imported by one package to be imported along with the importing package

- `export` follows same syntax as `import`

```verilog
package signal_analysis;
  import ComplexPkg::*;
  // Export with signal_analysis
  export ComplexPkg::*;
  class harmonix;
    Complex alpha, beta, gamma;
  endclass : harmonix
endpackage: signal_analysis
```

## Alternatives to Exhaustive Testing?

32-bit adder example: Assume one set of input and output ca be verifies every 1ns.
How long will exhaustive testing take?

What if exhaustive testing is unachievable?

- Answer: Verify design with a sufficient set of vectors to gain a level of confidence that product will ship with a tolerable field-failure rate

Best known mechanism is randomization of data combined with functional coverage

## Process of Reaching Verification Goals

<div style="text-align: center;">
  <img src="img/verification_goals.svg" alt="verification_goals" width=90%"/>
</div>

## OOP Based Randomization

In SystemVerilog, randomization is achieved via classes

- `randomize()` function is built into every class

Two types of random properties are supported:

- `rand` - Values can repeat without exhausting all possible values
  - Think "rolling dice"
- `randc` Exhaust all values before repeating any value
  - Think "picking a card from a deck of cards"
  - Can be as large as 32-bits in VCS

When the class function `randomize()` is called:

- Randomizes each `rand` and `randc` property value
  - To full range of its data type if no constraints specified

When the class `randomize()` function is called, if there are no constrains in the variables it will produce a random answer all equally possible.

`rand` and `randc` are not solve at the same time together, all `rand` variables are solve together and all `randc` variables are solve together.

## Randomization Example

```verilog
class Packet;
  randc bit[3:0] sa, da;           // Declare random properties in class
  rand  bit[7:0] payload[];

  function Packet copy(...);
  ...
  endfunction : copy
endclass: Packet
```

```verilog
module test;
  int run_for_n_pkts = 100;
  Packet pkt = new();              // Construct an object to be randomized
  initial begin
    ...
    repeat(run_for_n_pkts) begin
      if (!pkt.randomize()) begin  // Randomize content of object
        fork
          send();
          secv();
        join
        check();
      end
    end
  end
endmodule : test
```

It is always a good idea to check if the `randomize()` function was successful

## Controlling Random Variables (1/2)

How do you control the value range for `sa` and `da`?

How do you control the size of `payload[]`

```verilog
class Packet;
  randc bit[3:0] sa, da;
  rand  bit[7:0] payload[];
  function void display();
    $display("sa = %0d, da = %0d", sa, da);
    $display("size of payload array = %0d", payload.size());
    $display("payload[]", payload);
  endfunction : display
endclass : Packet
```

```verilog
module test;
  Packet pkt = new();
  if (!pkt.randomize()) begin
    $finish;
  end
  pkt.display();
endmodule : test
```

## Controlling Random Variables (2/2)

Randomization can be controlled using `constraint` block

```verilog
class Packet;
  randc bit[3:0] sa, da;
  rand  bit[7:0] payload[];
  constraint corner_test {
    sa == 12;                    // Equality operator, not assignment
    da inside {2,4,[16:10]};     // Set membership
    payload.size() >= 2;         // Array aggregate
    payload.size() <= 4;
  }
endclass : Packet
constraint valid {...};
```

- Constraint support only 2-state values;
- Multiple `constraint` blocks may be defined is same class
- Constraint expressions are describing a relationship not an assignment

```verilog
constraint single_sa { sa = 12;}      // Syntax error
```

## SystemVerilog Constraints

Relational Operators

```verilog
constraint single_sa {
  sa == 12;
  da < sa;
}
```

Set Membership

- Select from a list or set with keyword inside

```verilog
constraint Limit1 {
  sa inside {[5:7], 10, 15};  // 5,6,7,10,15 equally weighted probability
}
```

- Exclude from a specified set with `!`

```verilog
constraint Limit2 {
  !( sa inside {[1:10], 15} );  // 0,11,12,13,14 equally weighted probability
}
```

## Weighted Constraints

Constraint values can also be weighted over a specified range using keyword `dist` and:

- `:=` (apply the same wight to all values in range)

```verilog
constraint Limit {                 // equal weights
  sa dist {[5:7] := 30, 9 := 20};  // 5,6,7 equally weight of 30 each, 9 has a weight of 20
}
```

- `:/` (divide the wight among all values in range)

```verilog
constraint Limit {                 // divided weights
  sa dist {[5:7] :/ 30, 9 := 20};  // 5,6,7 equally weight of 10 each, 9 has a weight of 20
}
```

## Array Constraint Support

Members can be constrained within `foreach` loop

Aggregates can be used to constrain arrays

- `size()`, `sum()` and more

Set membership can be used to reference content

```verilog
class Config:
  rand bit[7:0] addrs[10];
  rand bit drivers_in_use[16];
  rand int num_of_drivers, one_addr;

  constraint limit {
    num_of_drivers inside { [1:16] };
    drivers_in_use.sum() with (int'(item)) == num_of_drivers;
    foreach (addrs[idx]) (idx > 0) -> addrs[idx] > addrs[idx-1]
    one_addr inside addrs;
  }
endclass : Config
```

## Implication and Order Constraints

`->` (Implication Operator)

- `if (...) [else ...]` also available
- Caution: does not imp0ly solving order

```verilog
typedef enum {low, mid, high, any} AddrTyp_e;
class MyBus;
  rand bit[7:0]  addr;
  rand AddrTyp_e atype;
  constraint addr_range {
    (atype == low)  -> addr inside { [0:15] };
    (atype == mid)  -> addr inside { [16:127] };
    (atype == high) -> addr inside { [128:255] };
  //  if     (atype == low)  addr inside { [0:15] };
  //  elseif (atype == mid)  addr inside { [16:127] };
  //  elseif (atype == high)  addr inside { [128:255] };
  }
endclass : MyBus
```

## Equivalence Constraints

Use `<->` (Equivalence operator) to define a true bidirectional constraint

- `A <-> B` means if A is true B must be true and if B is true A must be true
- Caution: does not imply solving order

```verilog
typedef enum {low, mid, high, any} AddrTyp_e;
class MyBus;
  rand bit[7:0]  addr;
  rand AddrTyp_e atype;
  constraint addr_range {
    (atype == low)  <-> addr inside { [0:15] };
    (atype == mid)  <-> addr inside { [16:127] };
    (atype == high) <-> addr inside { [128:255] };
  }
endclass : MyBus
```

## Uniqueness Constraints

Constraint each variable in a group to be `unique` after randomization

```verilog
class C;
  rand bit [2:0] a [7];
  rand bit [2:0] b;
  constraint cst1 {
    unique { a[0:2], a[6], b}     // Array slices allowed
  }
endclass : C

C c_obj = new();
if (!c_obj.randomize()) begin
  $finish;
end

$display("a = ", c_obj.a);     // a = {h5, h0, h3, h1, h7, h2, h2}
$display("b = ", c_obj.b);     // b = 6
```

## System Functions

Bit-Vector system functions can be used in constraint (VCS only)

- Treated as an operator/expression instead of a function
  - `$countbits`
  - `$countones`
  - `$onehot`
  - `$onehot0`
  - `$bits`

```verilog
rand bit[3:0] vector;
constraint cst { $countones(vector) == 2;}

// same as
constraint cst {
  (vector[0] + vector[1] + vector[2] + vector[3] ) == 2;
}
```

## User-defined Functions in Constraints

User-defined functions can be used to constrain variables

- See LRM for rules and limitations on functions and randomization order
- Can also use C functions using DPI

```verilog
class D;
  rand bit [6:0]  a,b;
  rand bit [7:0]  c;
  constraint c0 { c == add(a,b); }

  function bit[7:0] add (input bit[6:0] i1, i2);
    return (i1 + i2);
  endfunction : add
endclass : D
```

## Randomizing Real numbers

Limited support for randomization of ral variables (VCS only)

- Starting with the VCS 2017.12 release you can randomize variables of type
  `real`, `shortreat`, `realtime`
- Requires the `-xlrm floating_pnt_constraint` compiler switch
- Only one constraint per real variable allowed
- Only one real variable per constraint allowed
- Can only be constrained by constants or non-random state variables

```verilog
class cls;
  rand int       ix;
  rand real      rx;
  rand shortreal sx;
  rand shortreal tx;

  constraint t { tx dist { [0.02:0.20] :/30, [0.1:1.0] :/ 70 }; }
  constraint s { sx dist { [0.04:0.40] :/50, [0.1:1.0] :/ 50 }; }
  constraint s { rx dist { [0.01:0.10] :/10, [0.1:1.0] :/ 90 };
                 ix inside {[5:10]}; }

endclass : cls
```

## Constraint Solver Order

By default the simulator randomizes variables in any order it can in order to get a valid solution. To address this we can use:

`solve-before` construct set solving order for `rand` properties

- `randc` properties are always solved before `rand properties

  - Can not force `rand` to be randomized before `randc` properties

- `$void` (rand_property) solves `rand_property` first (VCS only)
- If the randomize function can not come up with a valid solution then if will solve with in another way.

```verilog
class MyBus;
  rand bit flag;
  rand bit[11:0] addr;
  constraint addr_range {
    if (flag == 0) begin
      addr = 0;
    end else begin
      addr inside { [1:1024] };
    end
    solve flag before addr;     // Guidance only
  }
endclass :
```

## Inline Constraints

Individual invocations of `randomize()` can be customized using

```verilog
obj.randomize() with { <additional constraints> }
```

```verilog
module test;
  class demo;
    rand int x, y, z;
    constraint Limit1 { x > 0; x <= 5; }
    ...
  endclass : demo

  initial begin
    demo obj_a = new();
    // ADD another constraint. Does NOT override Limit1
    if (!obj_a.randomize() with { x > 3 && x < 10;} ) begin
      $display("ERROR while randomize()");
    end
  end
endmodule : test
```

All constraints are merged.

## Soft Constraints

Use keyword `soft` when defining soft constraints

- Only for `rand` variables
- Not for `randc` variables

```verilog
class A;
  rand bit [7:0] x;
  constraint A1 { soft x == 6;}
endclass
```

Soft constraints are satisfied unless contradicted

- By a hard constraint
- By a soft constraint with higher priority

```verilog
A a = new();
initial begin
  a.randomize() with { x inside {[0:7]}; }   // x = 6
  a.randomize() with { x inside {[0:4]}; }   // 0 <= x <= 4
end
```

## Where are Soft Constraints Used?

In environment classes: to specify default ranges of random variables

In test program: to bias ranges in test

```verilog
class Packet;
  rand bit[11:0] len;
  rand int       min, max;
  constraint len_c { soft len inside {[min:max]} }
  constraint range { soft min == 0; soft max = 10; }
endclass

Packet p, q;
int tmin, tmax
// Override class constraints with higher priority constraints
stat = p.randomize() with {
  soft len inside {[tmin:tmax]}
}
// or change the object's min and max with hard constraints
stat = q.randomize() with {min==tmin; max==tmax;}
```

## Mutually Constrained Random Variables

Constraint limits can be random variables

```verilog
class demo:
  rand bit[7:0] high;
  rand int unsigned x;
  constraint Limit {
    x > 1;
    x < high;
  }
endclass : demo
```

What random values are generated for variable `high`?

- `randomize()` will eliminate values `{0,1,2}` for possible values for high
- If there is no legal value for high, then `randomize()` function prints warning and returns a 0. The properties are left unchanged
- Caution: does not imply solve order

## Inconsistent Constraints

What if the constraints cannot be solved by `randomize()`?

- It leaves the object unchanged and return a status value of 0
  - Simulation does not stop
- It produces this simulation error

```plain
Solver failed when solving following set of constraints
rand bit[31:0] x;       // rand_mode = ON
rand bit[7:0]  high;    // rand_mode = ON
constraint Limit{       // (from this) (constraint_mode = ON) (demo.sv:4)
  (x > 1000);
  (x <= high);
}
```

```verilog
class demo:
  rand bit[7:0] high;
  rand int unsigned x;
  constraint Limit {
    x > 1000;
    x <= high;
  }
endclass : demo
```

## Effects of Calling `randomize()`

When `randomize()` executes, three events occur:

- `pre_randomize()` is called
- Variables are randomizes
- `post_randomize()` is called

`pre_randomize()` (Optional)

- Set/Correct constraints
  - Example: `rand_mode(0|1)`

`post_randomize()` (Optional)

- Make changes after randomization
  - Example: `CRC

```verilog
class Packet;
  int test_mode;
  rand bit[3:0]  sa, da;
  rand bit[7:0]  payload[];
       bit[15:0] crc[];

  constraint LimitA {
    sa inside { [0:7] };
    da inside { [0:7] };
    payload.size() inside { [2:4] };
  };

  function void pre_randomize();
    if(test_mode) begin
      sa.rand_mode(0);
    end
  endfunction

  function void post_randomize();
    gen_crc();  // User method
  endfunction
endclass : Packet
```

## Controlling Randomization at Runtime

Turn randomization for properties on or off with:

```verilog
task/function int object_name.property.rand_mode( 1 | 0 );
```

- `1` - enable randomization (default)
- `0` - disable randomization
- If called as function, returns `rand_mode` state of property (0 or 1)

```verilog
class Node;
  rand int x, y, z;
  constraint Limit1 {
    x inside {[0:16]};
    y inside {[23:41]};
    z < y; z > x;
  }
endclass : Node
```

```verilog
module test;
  initial begin
    Node obj1 = new();
    obj1.x = 0;
    obj1.x.rand_mode(0);      // Solver still checks x satisfies its constraints
    if (!obj.randomize()) begin
    ...
    end
  end
endmodule : test
```

## Controlling Constraint at Runtime

Turn constraint blocks on and off with:

```verilog
task/function int object_name.constraint_block_name.constraint_mode( 1 | 0 );
```

- `1` - enable constraint (default)
- `0` - disable constraint
- If called as function, return state of constraint (0 or 1)

```verilog
class demo;
  rand int x, y, z;
  constraint no_error { x > 0; x <= 5; }
  static constraint with_err { x > 0; x <= 32;}
endclass : demo
```

```verilog
module test;
  initial begin
    demo obj_a = new();
    obj_a.no_error.constraint_mode(0);    // Test with errors
    if (!obj.randomize()) begin
    ...
    end
  end
endmodule : test
```

## Constraint Prototypes

Can define constraint prototypes in class using `extern`

- Define the constraint in same scope

```verilog
class demo;
  rand int x, y, z;
  extern constraint valid;      // must define
endclass : demo

// extern constraint must be defined later in same scope as class
constraint demo::valid { x > 0; y >= 0; z % x == 0; }
```

```verilog
module test_corner_case;
  `include "demo.sv"
  initial begin
    demo obj_a = new();
    if (!obj_a.randomize()) begin
    ...
    end
  end
endmodule : test_corner_case
```

## Nested Objects with Random Variables

`randomize()` follows a linked list of objects handles, randomizing each linked object to the end of the list

```verilog
class color;
  rand int hue, saturation, luminosity;
endclass : color

class pixel;
  rand color r, g, b
  ...
endclass : pixel
```

```verilog
module test;
  initial begin
    pixel px1 = new();
    px1.r = new();
    px1.g = new();
    px1.b = new();
    ...
    if (!px1.randomize()) begin // This will randomize objects px1 and px1.r, px1.g, px1.b
    ...
    end

  end
endmodule : test
```

## `std::randomize()`

`std::randomize()` for variables outside classes

- Very fast performance in VCS
- `std::` is optional

Available in `program`, `module`, `function` `task`, and `class`

- Randomization using `obj.randomize()` is still preferred

```verilog
module test;
  bit [11:0] addr;
  bit [5:0]  offset;
  function bit genConstrainAddrOffset();
    // Constraints using with keyword
    return std::randomize() with { addr > 1000; addr + offset < 2000; };
  endfunction
endmodule : test
```

## Changing the Random Seed at Simulation

Provide an initial seed for simulator with the following options (VCS)

- `ntb_random_seed = <initial_seed>`
  - `simv <other_opts> +ntb_random_seed = 123`


- `ntb_random_seed_automatic`
  - Unique initial seed, combining the time of day, hostname and process id
  - `simv <other_opts> +ntb_random_seed_automatic`

Seed appears in simulation log and coverage report

To query for the initial simulation seed use

- `$get_initial_random_seed();`

To save simulation log messages to a file use

- `simv <other_opts> -l simv.log`


## Operators and system task and functions

| Type           | Description                                                    |
| -------------- | -------------------------------------------------------------- |
| `$isunknown()` | Returns 1 if any bit of the expression is X or Z               |
| `$clog2()`     | Computes the ceiling of the logarithm base 2 of a given valueZ |


