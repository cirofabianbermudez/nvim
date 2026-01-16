## SystemVerilog Language Basics - 1

### SystemVerilog Testbench Code Structure: `module`

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

### Lexical Convention

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

### Data types

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

### 2-State (1|0) Data Types (1/3)

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

### 2-State (1|0) Data Types (2/3)

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

### 2-State (1|0) Data Types (3/3)

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

### 4-State (1|0|X|Z) Data Types (1/2)

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

### 4-State (1|0|X|Z) Data Types (2/2)

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

### String Data Type

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

### Enumerated Data Types

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

### Data Arrays - Fixed-size Arrays (1/4)

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

### Data Arrays - Dynamic Arrays (2/4)

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

### Data Arrays - Queues (3/4)

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

### Data Arrays - Associative Arrays (4/4)

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

### Array Loop Support and Reduction Operator

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

### Array Methods (1/4)

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

### Array Methods (2/4)

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

### Array Methods (3/4)

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

### Array Methods (4/4)

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

### Data Arrays - Out-of-Bounds Access

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

### Array Summary

| Type        | Memory                                             | Index     | Example (performance)         |
| ----------- | -------------------------------------------------- | --------- | ----------------------------- |
| Fixed Size  | Allocated at compile time, unchangeable afterwards | Numerical | `int addr[5];     (fast)`     |
| Dynamic     | Allocated at run time, changeable at run-time      | Numerical | `logic flags[];   (fast)`     |
| Queue       | Push/pop/copy at run-time to change size           | Numerical | `int in_use[$];   (fast)`     |
| Associative | Write at run-time to allocate memory               | Typed\*   | `state d[string]; (moderate)` |

> Note: The index of associative arrays should always be typed

Standard array - All memory elements allocated, even if unused

Associative array - Unused elementes do not use memory

### `struct` - Data Structure

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

### `union` - Data Union

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

### Quiz 1

Is the code below legal? Will it compile?

Answer: Yes

```verilog
module test;
  bit   [31:0] count;
  logic [31:0] Count = 'x;
  initial begin
    cout = Count;
    $display("Count = %0x count = %0d", Count, count);
  end
endmodule
```

What type is type `logic` a synonym of? What does the `'x` initialize `Count` to?

Answer: `reg`, all 32-bits get the value of `x`

What will the program display? Why is value of `count` different from `Count`?

Answer: It will display `Count = XXXXXXXX count = 0`, because `x` is converted to zero

### Quiz 2

Define three types of arrays

- Fixed array of size 1024     `int farray[1023];`
- Dynamic array of size 1024   `int farray[] = new[1024];`
- Associative array with an `int` type index    `int assoc_a[int]`

Write to three locations in each array

- 0, 500, 1023

```verilog
farray[0]    = 10;
farray[500]  = 20;
farray[1023] = 30;
```

How many elements has each of these allocated after the write operation?

- Fixed array             1024
- Dynamic array           1024
- Associative array uses  3
