# SystemVerilog notes

## Data types

A datatype is a set of values (2-state or 4-state) that can be used to declare data objects or to define user-defined data types
The Verilog datatypes have 4-state values: (`0`, `1`, `Z`, `X`).

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

Operators and system task and functions

| Type           | Description                                                    |
| -------------- | -------------------------------------------------------------- |
| `$isunknown()` | Returns 1 if any bit of the expression is X or Z               |
| `$clog2()`     | Computes the ceiling of the logarithm base 2 of a given valueZ |



functions and tasks are static by default


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


