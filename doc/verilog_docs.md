# Verilog notes

## History

1. IEEE Std 1364-1995: First Standard
2. IEEE Std 1364-2001: Major Update
3. IEEE Std 1364-2005: Further enhancements
4. IEEE Std 1800-2005: SystemVerilog introduced
5. IEEE Std 1800-2009: SystemVerilog and Verilog standards merged
6. IEEE Std 1800-2012: SystemVerilog enhancements
7. IEEE Std 1800-2017: Latest refinement

## Data types

They can be divided into three groups:
- Nets
  - Represent physical connection between structures and objects.
  -  `wire`, `tri`, `supply0`, `supply1`,`triand`, `wand`, `trior`, `wor`, `trireg`, `tri1`, `tri0`, `uwire`
- Variable
  - Represent abstract storage elements.
    - `reg`, `integer`, `real`, `time`, `realtime`
- Parameters
  - Run-time constants
    - `localparam`, `parameter`, `specparam`

Verilog supports 4 types of logic values as:

| Logic values | Description                 |
| ------------ | --------------------------- |
| 1            | Logic one, true condition   |
| 0            | Logic zero, false condition |
| x            | Unknown value               |
| z            | High impedance              |

Defining literal values

```verilog
<size>'<base><value>
```
- If unsized is at least 32 bits.
- Optionally preceded by an `s` character to indicate a signed value.
- The default behavior is unsigned

| Base | Meaning     |
| ---- | ----------- |
| `b`  | Binary      |
| `o`  | Octal       |
| `d`  | Decimal     |
| `h`  | Hexadecimal |

```verilog
a = 8'hff
a = 4'd1
a = 4'b0001
```

Scalars: Nets and reg are one-bit wide unless you also specify their range.

```verilog
wire a;         // single bit net
reg a;          // single bit register
```

Vectors: A vector is a net or reg with a range specification.

```verilog
wire [7:0] a;   // 8 bit net
reg [7:0] a;    // 8 bit register
```

```verilog
integer a;      // 32 bit register signed
reg [8*11:0] name = "Hello World"; // String
```

```verilog
integer sum; // is equivalent to 
reg signed [31:0] sum;
```

Indexing

Verilog requires that both bounds of the range are constants or constant expressions.

```verilog
identifier [msb_constant_expression:lsb_constant_expression]
identifier [base_expression +: width_constant_expression]
identifier [base_expression -: width_constant_expression]
```

Arrays: collection of multiple elements of `integer`, `real`, `realtime`, `reg`, `time` and nets

```verilog
integer arr [0:99];       // 100 element integer array
reg [7:0] array [0:255];  // 256 element 8 bit array
reg [7:0] word;
reg bit;
word = array[5];          // access address 5
word = array[10];         // access address 10
bit = word[7];            // access bit 7 of extracted word
```

Memories

```verilog
reg mem [0:511];            // 512 1-bit array
reg [7:0] memory [0:255];   // 8 bits vector with a depth of 256
memory[0] <= 0;
```

Multidimensional arrays

```verilog
reg matrix [0:99][0:7];   // 100x8 array of 1 bit elements
reg bit;
bit = matrix[0][0];
```


```verilog
reg [7:0] matrix [0:99][0:7];   // 100x8 array of 8 bit vector
reg [7:0] word;
word = matrix[0][0];
```


Time

Verilog provides a time register to store simulation time. A time register is declared using the ‘time’ keyword and it has a width of at least 64 bits depending on the simulator and machine used.

```verilog
time curr_time;  // Time variable
```
Real

The real data types can be constants or real register data types. The real value is rounded off if they are assigned to integer data type,

```verilog
real a = 3.14;  // Real value
```

Operators

| Category      | Symbol              |
| ------------- | ------------------- |
| Bit-wise      | `~ & \|^ ~^`        |
| Reduction     | `& ~& \|~\|^ ~^ ^~` |
| Logical       | ` ! && \|\| `       |
| Arithmetic    | `** * / % + -`      |
| Shift         | `<< >> <<< >>>`     |
| Relational    | `< > <= >=`         |
| Equality      | `== != === !==`     |
| Conditional   | `?:`                |
| Concatenation | `{}`                |
| Replication   | `{{}}`              |

Bit-Wise Operators


| Operations | Sign |
| ---------- | ---- |
| not        | `~`  |
| and        | `&`  |
| or         | `\|` |
| xor        | `^`  |
| xnor       | `~^` |
| xnor       | `^~` |


Unary reduction Operators


| Operations | Sign    |
| ---------- | ------- |
| not        | `&`     |
| or         | `\|`    |
| xor        | `^`     |
| nand       | `~&`    |
| nor        | `~\|`   |
| xnor       | `~^ ^~` |


Logical Operators

| Operations | Sign   |
| ---------- | ------ |
| not        | `!`    |
| and        | `&&`   |
| or         | `\|\|` |


Arithmetic Operators

| Operations  | Sign     |
| ----------- | -------- |
| Add         | ` +`     |
| Subtract    | ` -`     |
| Multiply    | ` *`     |
| Divide      | ` /`     |
| Modulus     | ` %`     |
| Power       | `**`     |
| Signed      | `signed` |


Shift Operators

| Operations  | Sign     |
| ----------- | -------- |
| Logical left-shift       | `<<`     |
| Logical right-shift      | `>>`     |
| Arithmetic left-shift    | `<<<`    |
| Arithmetic right-shift   | `>>>`    |


Relational Operators

| Operations  | Sign     |
| ----------- | -------- |
| Less than                | `<`     |
| Greater than             | `>`     |
| Less than or equal to    | `<=`    |
| Greater than or equal to | `>=`    |


Logical Operators

| Operations  | Sign     |
| ----------- | -------- |
| Logical equality         | `==`     |
| Logical inequality       | `!=`     |
| Case equality            | `===`    |
| Case inequality          | `!==`    |


Replication Operator

```verilog
{const_expr {sized_expr}}
```

Operator Precedence High to Low

| Category                    | Symbol(s)                     |
| --------------------------- | ----------------------------- |
| Unary                       | `+ - ! ~ & ~& \| ~\| ^ ~^ ^~` |
| Exponential                 | `**`                          |
| Arithmetic                  | `* / %`                       |
|                             | `+ -` (binary)                |
| Shift                       | `<< >> <<< >>>`               |
| Relational                  | `< <= > >=`                   |
| Equality                    | `== != === !==`               |
| Bit-wise                    | `& (binary)`                  |
|                             | `^ ^~ ~^` (binary)            |
|                             | `\|` (binary)                 |
| Logical                     | `&&`                          |
|                             | `\|\|`                        |
| Conditional                 | `? :`                         |
| Concatenation / Replication | `{ }` and `{{ }}`             |


## Messaging


Operators and system task and functions

| System task or function              | Description                                                                                                                                                                                                           |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `$display()`                         | System tasks print values to the standard output and appends a newline. Variations `$displayb()`,`$displayo()`, `$displayh()`                                                                                         |
| `$write()`                           | System tasks print values to the standard output. Variations `$writeb()`,`$writeo()`, `$writeh()`                                                                                                                     |
| `$strobe()`                          | System tasks print values to the standard output but execution is scheduled for the end of the current time slice                                                                                                     |
| `$monitor()`                         | System task continuously monitors nets and variables, It acts like $strobe when any argument changes value. `$monitoroff` and `$monitoron`                                                                            |
| `$timeformat()`                      | System task sets the display format for the `%t` formatter.                                                                                                                                                           |
| `$fopen()`                           | Returns a 32-bit unsigned integer multi-channel descriptor (MCD) with one bit set to 1.                                                                                                                               |
| `$fclose()`                          | Close the channel                                                                                                                                                                                                     |
| `$fdisplay()`                        | Counterpart that write to a specific set of channels rather than to just the standard output                                                                                                                          |
| `$fmonitor()`                        | Counterpart that write to a specific set of channels rather than to just the standard output                                                                                                                          |
| `$fstrobe()`                         | Counterpart that write to a specific set of channels rather than to just the standard output                                                                                                                          |
| `$fwrite()`                          | Counterpart that write to a specific set of channels rather than to just the standard output                                                                                                                          |
| `$readmemb()`                        | Counterpart that write to a specific set of channels rather than to just the standard output                                                                                                                          |
| `$readmemh()`                        | Counterpart that write to a specific set of channels rather than to just the standard output                                                                                                                          |
| `$stop`                              | System task interrupts simulation and enters the interactive mode.                                                                                                                                                    |
| `$finish`                            | System task terminates the simulation and exits the simulator                                                                                                                                                         |
| `$realtobits()`                      | Converts a real number to a 64-bit representation, so that a real number can be passed through the port of a module.                                                                                                  |
| `$bitstoreal()`                      | Converts the bit value to a real number.                                                                                                                                                                              |
| `$rtoi()`                            | Converts a real number to an integer. It truncates the real number to form the integer.                                                                                                                               |
| `$itor()`                            | Converts an integer to a real value.                                                                                                                                                                                  |
| `$test$plusargs(string)`             | This is a system function that searches the list of plusargs. If a string is found the function returns the value 1. If no string is found matching,  returns the value 0, and the variable provided is not modified. |
| `$value$plusargs (string, variable)` | This is a system function that searches the list of plusargs. If a string is found the function returns the value 1. If no string is found matching,  returns the value 0, and the variable provided is not modified. |
| `$dumpfile( "filename" )`            | Opens database. Optionally provides name. Standard default name is dump.vcd                                                                                                                                           |
| `$dumplimit( size )`                 | Stops recording after size bytes                                                                                                                                                                                      |
| `$dumpvars( ... )`                   | Selects signals for recording                                                                                                                                                                                         |
| `$dumpoff`                           | Stops recording                                                                                                                                                                                                       |
| `$dumpon`                            | Starts recording again                                                                                                                                                                                                |
| `$dumpall`                           | Checkpoint the values of all recorded signal s                                                                                                                                                                        |
| `$dumpflush`                         | Flushes database to disk                                                                                                                                                                                              |
| `$time`                              | Returns time as a 64-bit integer                                                                                                                                                                                      |
| `$stime`                             | Returns time as a 32-bit integer                                                                                                                                                                                      |
| `$realtime`                          | Returns time as a real number                                                                                                                                                                                         |



| System task or function         | Description                                    |
| ------------------------------- | ---------------------------------------------- |
| `$random(seed)`                 | Function to easily create random data patterns |
| `$dist_chi_square(seed,dgf)`    |                                                |
| `$dist_erlang(seed,k,mean)`     |                                                |
| `$dist_exponential(seed,mean)`  |                                                |
| `$dist_normal(seed,mean,std)`   |                                                |
| `$dist_poisson(seed,mean)`      |                                                |
| `$dist_t(seed,dgf)`             |                                                |
| `$dist_uniform(seed,start,end)` |                                                |


Format Specifications

| Format | Description                         | Example                                 |
| ------ | ----------------------------------- | --------------------------------------- |
| `%b %B`| Display in binary format            | `$display("%b",1'b1); // 1`             |
| `%o %O`| Display in octal format             | ` $display("%o",3'o7); // 7 `           |
| `%d %D`| Display in decimal format           | `$display("%0d",4'd9); // 9 `           |
| `%h %H`| Display in hexadecimal format       | `$display("%h",4'hF); // f`             |
| `%c %C`| Display in ASCII character format   | ` $display("%c",65); // A`              |
| `%s %S`| Display as a string                 | `$display("%s","foo"); // foo `         |
| `%e %E`| Display real in exponential format  | ` $display("%e",3.1); // 3.100000e+00 ` |
| `%f %F`| Display real in float format        | `$display("%f",3.1); // 3.100000 `      |
| `%g %G`| Display real using %e or %f         | `$display("%g",3.1); `                  |
| `%l %L`| Display library binding information | ` $display("%l"); // work.test `        |
| `%m %M`| Display hierarchical name           | ` $display("%m"); // top.test1 `        |
| `%t %T`| Display in current time format      | `$display("%t",$time); // 1.1 ns`       |
| `%v %V`| Display net signal strength         | `$display("%v",n1); // St1`             |
| `%u %U`| Unformatted 2 value binary data     |                                         |
| `%z %Z`| Unformatted 4 value binary data     |                                         |




Set the variable to a initial value, this is better or use else or default to prevent latch, 


Directives

Add this directive to not allow any implicit net declarations.
```verilog
 `default_nettype none
```

Add this directive to allow implicit net declarations.
```verilog
`default_nettype wire
```

