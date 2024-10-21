# SystemVerilog notes

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
module test(router_if.TB vif);
  initial begin
    vif.reset_n = 'd0;
    vif.cb.frame_n <= '1;
    vif.cb.valid_n <= '1;
  end
endmodule : test
```

```verilog
module router(router_if.DUT vif, input logic clock);
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
- `Active`   Design simulation (`modules`), including NBA (Non-Blocking Assignments)
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

Driving of input siggnals is not allowed

## Sampling Synchronous Signals

```verilog
variable = interface.cb.signal;
```

Variable is assigned the sampled value

- Value that the clocking clock sampled at the most recent clocking event

Avoid non-blocking assignment

Sampling of output signal is not allowed

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

### 2-State (1|0) Data Types

```plain
bit [msb:lsb] var_name [=initial_value]
```

Better compiler optimizations for better performance

Variable initialized to `'0` if `initial_value` is not specified

- `'0` is unsized literal, it will expand the variable name to the number of bits automatically

Assigned 0 for x or z value assignments

- Sized as specified
- Defaults to unsigned

```verilog
bit flag;
bit[15:0] sample, temp;
bit[7:0] a = 8'b1;         //  8'b0000_0001
bit[7:0] b =  'b1;         //  8'b0000_0001
bit[7:0] c =  '1;          //  8'b1111_1111
bit[32:0] signed ref_data = -155;
```

```plain
2-state-type variable_name [=initial_value];
```

Sized integral 2-state data types:

- `byte`     - 8-bit signed data type
- `shortint` - 16-bit signed data type
- `int`      - 32-bit signed data type
- `longint`  - 64-bit signed data type

```verilog
shortint temp = 256;
int sample, ref_data = -9876;
longint a, b;
longint unsigned testdata;
```

Real 2-state data types:

- `real`      - Equivalent to `double` in C
- `shortreal` - Equivalent to `float` in C
- `realtime`
  - 64-bit real variable for use with `$realtime`
  - Can be used interchangeably with `$real` variables

```verilog
real alpha = 100.3, cov_result;
realtime t64;
t64 = $realtime;
cov_result = $get_coverage();
if (cov_result == 100.0)
```

### 4-State (1|0|X|Z) Data Types

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

Sized 4-state data types

```verilog
integer variable_name [=initial_value]
```

- 32-bit signed data type

```verilog
time variable_name [=initial_value]
```

= 64-bit unsigned data type

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
string veriable_name [=initial_value]
```

Default to empty string `""`

Can be created with `$sformatf` system function

Built-in operator and methods:

- `==`, `!=`, `compare()`, and `icompare()`
- `itoa()`, `atoi()`, `atohex`, `toupper()`, `tolower()`, etc
- `len()`, `getc()`, `putc()`, `substr()`, (See SystemVerilog LRM for more)

LRM -> Language Reference Manual

```verilog
string name, s = "Now is the time";
for (int i=0; i<4; i++) begin
  name = $sformatf("string%0d", i);
  $display("%s, upper: %s", name, name.toupper());
end
s.put(s.len()-1, s.getc(5))
$display(s.substr(s.len()-4, s.len()-1))
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
- Variable initialized to `'0` if initial_value is not specified (x for a 4 state data_type)
- `enum` can be displayed as ASCII or value

```verilog
typedef enum bit[2:0] {IDLE=1, TEST, START} state_e;
state_e current, next = IDLE;
$display("current = %0d, next = %s", current, next);
$display("next = %p", next);
```

## Data Arrays - Fixed-size Arrays

```verilog
type array_name[size] = [=initial_value];
```

```verilog
interger numbers[5];                       // arrays of 5 integers, indexed 0 - 4
int b[2] = '{3,7};                         // b[0] = 3, b[1] = 7

bit[31:0] c[2][3] = '{{3,7,1},{5,1,9}};    // Multidimensional
byte d[7][2] = '{default:-1};              // all elements set = -1

bit[31:0] a[2][3] = c;                     // array copy - types and sizes must be sema
for (int i=0; i<$dimensions(a), i++) begin
  $display($size(a, i+1));                 // 2 3 32
end
```

## Data Arrays - Dynamic Arrays

```verilog
type array_name[size] = [=initial_value];
```

Array size allocated at runtime with constructor

```verilog
logic[7:0] ID[], array1[] = new[16];
logic[7:0] data_array[], mdim[][];

ID = new[100];                     // allocate memory

data_array = new[ID.size()] (ID);  // copy types must match
data_array = ID

ID = new[ID.size() * 2] (ID);      // double the size of ID
ID = data_array;                   // ID resized to match data_array
data_array.delete();               // de-allocate memory
```

## Data Arrays - Queues

```verilog
type array_name[$[:bound]] = [=initial_value];
```

Array memory allocated and de-allocated at runtime with

- `push_back()`, `push_front()`, `intert()`
- `pop_back()`, `pop_front()`, `delete()`

Can not be allocated with `new[]`

- `bit[7:0] ID[$] = new[16];  // Compilation error`

Index 0 refers to lower (first) index in queue

Index $ refers to upper (last) index in queue

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
q.push_back(8);           // 17,0,2,3,4,5,8} 
$display(q.size());       // 7
$display("%p", q);        // '{17,0,2,3,4,5,8}
q.delete();               // delete all elements
$display(q.size());       // 0
```

## Data Arrays - Associative Arrays

```verilog
type array_name[index_type];
```

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
end
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

## Array Methods

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

```verilog
module test;
  bit[7:0] SQ_array[$] = {2,1,8,3,5};
  bit[7:0] SQ[$];
  int idx[$];

  initial begin
    SQ = SQ_array.find() with ( item > 3 );            // item is default iterator variable

    idx = SQ_array.find_index(addr) with ( addr > 3 ); // addr is user defined iterator variable
  end
endmodule
```

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

## Array Summary

| Type        | Memory                                             | Index     | Example (performance)         |
| ----------- | -------------------------------------------------- | --------- | ----------------------------- |
| Fixed Size  | Allocated at compile time, unchangeable afterwards | Numerical | `int addr[5];     (fast)`     |
| Dynamic     | Allocated at run time, changeable at run-time      | Numerical | `logic flags[];   (fast)`     |
| Queue       | Push/pop/copy at run-time to change size           | Numerical | `int in_use[$];   (fast)`     |
| Associative | Write at run-time to allocate memory               | Typed*    | `state d[string]; (moderate)` |

> Note: The index of associative arrays should always be typed

## `struct` - Data Structure

Defines a wrapper for a set of veriables

- Similar to C `struct` of VHDL `record`

- Integral variables can be attributed for randomization using `rand` or `randc`

```verilog
typedef struct {
  data_type variable0;
  data_type variable1;
} struct_type;
``

```verilog
typedef struct {
  rand int my_int;
  real my_real;
} my_struct;

my_struct var0, var1;
var0 = {32, 100.2};
var1 = {default:0};
var1.my_int = var0.my_int;
```

## System Functions: Randomization

`$urandom`: Return a 32-bit unsigned random number

- Initial seed can be set with run-time switch: `+ntb_random _seed=seed_value`
- Object/Thread/Scope level seed can be set with `srandom(seed)`
- `$random` Verilog function gives poor distribution and repetability (don't use)

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
typedef bit[5:0]  bsix_t;
bsix_t my_var;
```

Use `<type>'(value|variable)` to convert data types (static cast - checks done at compile-time)

```verilog
 bit[7:0]  payload[];

 int temp = $urandom();
 payload = new[(temp % 3) + 2];
 payload = new[(uint'(temp) % 3) = 2];
 payload = new[(unsigned'(temp) % 3) = 2];
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
  - wildcard (?) preferred istead of `x` and `z`

Example

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

## Sequential Flow Control

Conditionals

- `if (x == 7) a=7; else a = 8;`
- `a = (x == y) ? 7 : 8;`
- `assert( true condition);`
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

The qualifier goes on the right of the `task` of `function` keyword

## Subroutine Argument Binding and Skipping

Argument can be bounde (passed) to the subroutine by

- Position
- Name

Arguments can be skipped if they have default values

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

## Operators and system task and functions

| Type           | Description                                                    |
| -------------- | -------------------------------------------------------------- |
| `$isunknown()` | Returns 1 if any bit of the expression is X or Z               |
| `$clog2()`     | Computes the ceiling of the logarithm base 2 of a given valueZ |

Functions and tasks are static by default

## Clocking blocks and modports

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
  endclocking: cb

  modport TB(clocking cb, output reset_n);
```

## Constraint Blocks

> **Reference**: IEEE Std 1800-2017 18.5

Constraints can be embedded in classes using constraint blocks.

```systemverilog
constraint <const_name> { expression; expression;}
```
