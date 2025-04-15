# Tcl notes

## Functions

In Tcl, functions are created as procedures using the proc command. A
procedure in Tcl acts as a function that can take arguments, execute a block
of code, and return a result.

```tcl
proc functionName {arg1 arg2 ...} {
    # Code body goes here.
    # Optionally, use the 'return' command to return a value.
}
```

## `expr`

The `expr` command in Tcl is used to evaluate mathematical, logical, and
relational expressions. It computes the value of an expression and returns
the result, which can then be used in your Tcl scripts.

## `Command substitution`

In Tcl, square brackets `[]` are used for command substitution. This means that
any command placed inside square brackets is executed first, and its output
replaces the bracketed expression in the surrounding code.

## Curly braces

In Tcl, curly braces `{}` serve primarily to group text together and to prevent
substitution of variables or commands within the enclosed block.

## Variables

In Tcl, variables are a fundamental part of scripting and are treated as
strings by default.

### Creating and Setting Variables

Using `set`:
Variables are created and assigned a value with the `set` command.

### Accessing Variables

Variable Substitution:
Variables are accessed by prefixing the variable name with a dollar sign (`$`).



## Tricks

```tcl
[file normalize [info script]]
```

info script

This command returns the file name (or full path) of the script that is currently being executed.

If you run a script using tclsh, it gives you the path to that script file. When run interactively, it returns an empty string.

file normalize

This command takes a file path as input and returns its canonical, absolute form.

It resolves any relative path elements like . (current directory) and .. (parent directory) and removes redundant separators.
