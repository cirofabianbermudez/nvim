
## SystemVerilog Language Basics - 2

### System Functions: Randomization

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

### User Defined Types and Type Cast

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

What are the possible sizes of array `payload`? 

0,1,2 for the modulo operation, then +2, the values are 2,3,4

### Operators

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

### `inside` Operator

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

### `iff` Operator

Use `iff` operator to qualify

- event controls
  - `@(vif.cb iff(vif.cb.frame[prt_id]) !== 0)`
- property execution
- coverage elements
  - cover points
  - bin of cover points
  - cross coverage
  - cross coverage bins

### Know Your Operators

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

### Sequential Flow Control

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

### Subroutines (`task` and `function`)

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
task print_sum(ref int a[], input int start = 0);   // Pass by value, Default value
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

### Subroutine Argument Binding and Skipping

Argument can be bundle (passed) to the subroutine by

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

### Subroutine Arguments

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


### Output Mechanism in Tasks

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

### Test for Understanding

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

Answer:

- `a` has direction `ref` and type `byte`
- `b` has direction `ref` (sticky) and type `logic[15:0]`
- `c` the same as `b`
- `u` and `v` have direction `output` and type `logic[15:0]` (sticky)

> Note: If the output is not assign inside the `task` it becomes `X`.

### Code block Lifetime Controls

Simulation ends when all programs/modules end

- Execution of a `program` ends when
  - All `initial` blocks in `program`/`module` reach end of code block, or `$finish` is executed

Execution of a subroutine ends when one of

- `endtask`, `endfunction` is encountered
- `return` is executed

Execution of a loop ends when one of

- `end` (of loop `begin`) is encountered
- `break` is executed

Execution of loop immediately advances to next iteration when

- `continue` is executed

### Helpful Debugging Features

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
