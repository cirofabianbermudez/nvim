# Tcl notes


## Install tcl

```bash
sudo apt-get install tcl tcllib
which tclsh
```

## Call a tcl script

```bash
tclsh script_name.tcl
```

## `puts`

The puts command sends text to a specified channel (output stream), most 
commonly standard output, making it essential for printing messages, debugging,
or writing to files.

```tcl
puts "Hello"
```

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

## Lists

In Tcl, a list is simply a string of zero or more words (elements), typically 
separated by spaces, that the interpreter treats as a single data structure. 
Lists can be nested and may contain embedded spaces or special characters when 
properly quoted.


```tcl
# An empty list
set myList {}

# A three-element list
set myList2 {apple banana cherry}
```

## List functions

```tcl
# Length of the list
llenght $myList

# Index the 1 element
lindex $myList 1

# Append one element
lappend $myList avocado

# Split a comma-separated string into a list
split $myList ,

# Convert list to a single string using commas
join $myList ,
```

## Control Structures

| Command                           | Purpose                                                                                         | Example                                                               |
|-----------------------------------|-------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| **`if`**                          | Conditional execution                                                                           | `if { $x > 0 } { puts "positive" } elseif { $x == 0 } { puts "zero" }`   |
| **`switch`**                      | Multi‑way branch based on string or pattern matching                                           | `switch -- $ext { .vhd {doVHDL} .v {doVerilog} default {error} }`      |
| **`while`**                       | Repeatedly execute as long as the test is true                                                  | `while { [gets stdin line] >= 0 } { puts $line }`                     |
| **`for`**                         | C‑style loop with explicit init/test/next expressions                                           | `for { set i 0 } { $i < 10 } { incr i } { puts $i }`                  |
| **`foreach`**                     | Iterate over each element of a list                                                             | `foreach f $fileList { process_file $f }`                             |
| **`break`**, **`continue`**       | Within loops, `break` exits the loop early; `continue` skips to the next iteration              | (used inside `for`/`while`/`foreach` bodies)                          |
| **`catch`**                       | Trap errors: run a script and capture any error code/message instead of aborting                | `if {[catch {open $fname r} fh]} { puts "Can't open $fname" }`        |
| **`return`**                      | Exit a proc and pass a return value                                                             | `proc foo {} { return "done" }`                                       |

## `argc` and `argv`

When you run a Tcl script under `tclsh` (or any Tcl interpreter), any arguments
you pass on the command line become available inside the script via three 
built‑in variables:

- **`argc`**  
  An integer count of how many arguments were passed to the script.  

- **`argv`**  
  A Tcl list containing each argument string in order.  

- **`argv0`**  
  The first element on the command line—typically the script’s filename (or the interpreter name if you used `-e`).

## `catch`

Safely evaluates a script fragment, trapping any errors so your program can continue running.


## `eval`

Is the primitive that takes its arguments, joins them together (inserting 
spaces), and then hands the resulting string back to the Tcl interpreter to be 
parsed and executed as if you had typed it in directly. In effect, it lets 
you build up a command or script at runtime and then run it.

## `exec`

The `exec` command is a linux command that executes a Shell command without 
creating a new process. Instead, it preleaces the current open Shell operation.
Depending on the command usage, `exec` has different behaviours and use cases.

## `tee`

The `tee` commad is a linux command, used with a pipe, read standard input, 
then writes the output of program to standard output and simultaneosly copies 
it into the specified file of files. Use the `tee` command to view your output 
immediately and at the same time, store it for future use. Use the `-a` flag.

## Useful fuctions

`info script`

This command returns the file name (or full path) of the script that is
currently being executed.

If you run a script using tclsh, it gives you the path to that script file.
When run interactively, it returns an empty string.

`file normalize pathName`

This command takes a file path as input and returns its canonical, absolute form.

It resolves any relative path elements like . (current directory) and .. 
(parent directory) and removes redundant separators.

`file extension filename`

Returns the "tail" from the last `.` in the basename throught to the end.

`file exist pathName`

Returns 1 (true) if `pathName` names an existing file or directory on disk.

`file mkdir dirName`

Creates one or more directories in the filesystem.

`file delete fileName`

Removes files and directories from the filesystem.

`info exist varName`

Ruturns true if the Tcl variable named `varNamed` is defined

`::env`

Is the built‑in array that Tcl uses to mirror your process’s environment variables.


`source`

```plain
Description: 
Add tracing of commands

Syntax: 
source  [-encoding <arg>] [-notrace] [-quiet] [-verbose] <file>

Usage: 
  Name         Description
  ------------------------
  [-encoding]  specify the encoding of the data stored in filename
  [-notrace]   disable tracing of sourced commands
  [-quiet]     Ignore command errors
  [-verbose]   Suspend message limits during command execution
  <file>       script to source
```
