# Makefile notes

## Introduction

Makefiles are used to help decide which parts of a large program need to be recompiled. In the vast majority of cases, C or C++ files are compiled. Make can also be used beyond compilation too, when you need a series of instructions to run depending on what files have changed.

In the root of a directory create an empty file called `Makefile`.

To run this file use the `make` command follow by the target.

If no target is given in the Makefile the first target is the default.

> Note: Makefiles must be indented using TABs and not spaces or make will fail.

## Makefile syntax

A Makefile consists of a set of **rules**. A rule generally looks like this:

```make
targets: prerequisites
	command
	command
	command
```

The **targets** are file names, or just names separated by spaces. Typically, there is only one per rule.

The **commands** are a series of steps typically used to make the target(s). These need to start with a tab character, not spaces.

The **prerequisites** are also file names, or other targets separated by spaces. These files need to exist before the commands for the target are run. These are also called dependencies,

## Make clean

`clean` is often used as a target that removes the output of other targets, but it is not a special word in Make. You can run `make clean`. It's not intended to be a filename. It's recommended to put it in the `.PHONY` target.

```make
clean:
	rm -rf some_file
```

## Make all

If you have multiple targets and you want all of them to run, nake an `all` target. Since this is the first rule listed, it will run by default if make is called without specifying a target.

```plain
all: one two
```

## Variables

Variables can only be strings. You'll typically want to use `:=`, but `=` also works.

Reference variables using either `${}` or `$()`

```make
files := file1 file2

some_file: $(files)
	echo "Look at this variable: " $(files)
```

Single or double quotes have no meaning to Make. They are simply characters that are assigned to the variable. Quotes are useful to shell/bash, and you need them in commands.

| Assignment Operators | Description              |
| -------------------- | ------------------------ |
| `=`                  | Simple Assignment (Lazy) |
| `:=`                 | Immediate Assignment     |
| `=?`                 | Conditional Assignment   |
| `+=`                 | Append Assignment        |

`=`  is used when you want to define a variable whose value is computed when the variable is referenced, rather than when it is declared. This is called "lazy" or "deferred" evaluation.

`:=` is used to assign a value to a variable immediately at the point where the assignment occurs. Unlike `=` (which performs "lazy" evaluation), `:=` performs immediate evaluation, meaning the value is computed and stored as soon as the line is executed.

`?=` is used for conditional assignment. It only assigns the value to the variable if the variable is currently undefined. If the variable is already defined, `?=` does not change its value.

`+=` is used for appending values to existing variables. It adds the specified value to the end of the current value of the variable.

## Automatic variables

| Variable | Description                                                 |
| -------- | ----------------------------------------------------------- |
| `$<`     | Represents the first prerequisite of a rule                 |
| `$@`     | Represents the target of the rule                           |
| `$?`     | Represents the prerequisites that are newer than the target |
| `$^`     | Represents all the prerequites                              |

`$<` represents the first prerequisite of a rule. It refers to the name of the first prerequisite (usually a source file) of the target being built. This is particularly useful in compilation rules when there's only one source file involved.

`$@` represents the target of the rule. It refers to the name of the target being built. This variable is helpful when you want to refer to the target name in the recipe.

`$?` represents the list of prerequisites (dependencies) that are newer than the target.
This variable expands to these newer prerequisites, which helps the Makefile determine what files need to be recompiled or rebuilt.

`$^` refers to all the prerequisites of a target. When you define a rule, the prerequisites are the files or dependencies that must exist or be up-to-date before the target can be rebuilt.

## Multile targets

When there are multiple targets for a rule, the commands will be run for each target. `$@` is an automatic variable that contains the target name.

```make
all: f1.o f2.o

f1.o f2.o:
	echo $@
# Equivalent to:
# f1.o:
#	 echo f1.o
# f2.o:
#	 echo f2.o
```

## Automatic Variables and Wildcard

Both `*` and `%` are called wildcards in Make, but they mean entirely different things.

`*` searches your filesystem for matching filenames. Use in combination with the `wildcard` function to avoid pitfalls.

```make
print: $(wildcard *.c)
	ls -la $?
```

`*` may be used in the target, prerequisites, or in the wildcard function.

`%` is really useful, but is somewhat confusing because of the variety of situations it can be used in.

- When used in "matching" mode, it matches one or more characters in a string. This match is called the stem.

- When used in "replacing" mode, it takes the stem that was matched and replaces that in a string.

- `%` is most often used in rule definitions and in some specific functions.

## Commands and execution

Add an `@` before a command to stop it from being printed. You can also run make with `-s` to add an `@` before each line.

```make
all:
	@echo "This make lie eill not be printed"
```

## Default Shell

The default shell is `/bin/sh`. You can change this by changing the variable `SHELL`:

```make
SHELL=/bin/bash

cool:
	echo "Hello from bash"
```

## Double dolar sign

If you want a string to have a dollar sign, you can use $$. This is how to use a shell variable in bash or sh.

Note the differences between Makefile variables and Shell variables in this next example.

```make
make_var = I am a make variable
all:
	# Same as running "sh_var='I am a shell variable'; echo $sh_var" in the shell
	sh_var='I am a shell variable'; echo $$sh_var

	# Same as running "echo I am a make variable" in the shell
	echo $(make_var)
```

## Error Handling

Add `-k` when running make to continue running even in the face of errors. Helpful if you want to see all the errors of Make at once.

Add a `-` before a command to suppress the error

Add `-`i to make to have this happen for every command.

## C/C++ usage

This is a real example on how to use make for compilig C++ code.

```make
#Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -g -std=c++23 -Wall

# Source code
SRCS = $(wildcard *.cpp)

# Generate object file list
OBJS = $(SRCS:.cpp=.o)

TARGET = project_name

all: $(TARGET)

# Rule to compile every .cpp to a .o
%.o: %.cpp
	@echo "> Compiling $<"
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Link object files
$(TARGET): $(OBJS)
	@echo "> Linking object files"
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET) 
```

## Call Makefile with different name

To select a different Makefile you can run

```bash
make -f <filename>
```


## Common variables for C/C++

| Variable               | Description                           |
| ---------------------- | ------------------------------------- |
| `CC` or `CXX`          | Variables for the C and C++ compilers |
| `CFLAGS` or `CXXFLAGS` | For compiler flags for the C and C++  |

## Command line Flags

| Option    | Description                                       |
| --------- | ------------------------------------------------- |
| `-j [N]`  | Allows N jobs at once; infinite jobs with no arg. |
| `-f FILE` | Read FILE as a makefile.                          |
| `-k`      | Keep going when some targets can't be made.       |
| `-h`      | Print help and exit.                              |
| `-i`      | Adds a `-` to every command                       |
| `-C`      | Change to the directory before doing anything     |

## Common Targets

| Option   | Description                                                                                                                             |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `.PHONY` | Used to declare targets that don't represent output files, ensuring they're always executed regardless of file existence or timestamps. |
| `all`    | Typically used to specify the default target                                                                                            |
| `clean`  | Conventionally used to define rules for cleaning up the project directory by removing generated files or artifacts.                     |

<https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile>
<https://makefiletutorial.com/>

ROOT_DIR = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
