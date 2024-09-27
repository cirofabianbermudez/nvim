# Makefile notes

## Introduction

Makefiles are used to help decide which parts of a large program need to be recompiled. In the vast majority of cases, C or C++ files are compiled. Make can also be used beyond compilation too, when you need a series of instructions to run depending on what files have changed.

In the root of a directory create an empty file called `Makefile`.

To run this file use the `make` command follow by the target.

If no target is given in the Makefile the first target is the default.

> Note: Makefiles must be indented using TABs and not spaces or make will fail.

## Makefile syntax

A Makefile consists of a set of **rules**. A rule generally looks like this:

```plain
targets: prerequisites
	command
	command
	command
```

The **targets** are file names, or just names separated by spaces. Typically, there is only one per rule.

The **commands** are a series of steps typically used to make the target(s). These need to start with a tab character, not spaces.

The **prerequisites** are also file names, or other targets separated by spaces. These files need to exist before the commands for the target are run. These are also called dependencies,

## Make clean

`clean` is often used as a target that removes the output of other targets, but it is not a special word in Make. You can run `make clean`. It[s not intended to be a filename. It's recommended to put it in the `.PHONY` target.

```plain
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

```plain
files := file1 file2
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

| Variable | Description                                  |
| -------- | -------------------------------------------- |
| `$<`     | Represents the first prerequisite of a rule. |
| `$@`     | Represents the target of the rule.           |

`$<` represents the first prerequisite of a rule. It refers to the name of the first prerequisite (usually a source file) of the target being built. This is particularly useful in compilation rules when there's only one source file involved.

`$@` represents the target of the rule. It refers to the name of the target being built. This variable is helpful when you want to refer to the target name in the recipe.


## Multile targets

When there are multiple targets for a rule, the commands will be run for each target. `$@` is an automatic variable that contains the target name.

```plain
all: f1.o f2.o

f1.o f2.o:
	echo $@
# Equivalent to:
# f1.o:
#	 echo f1.o
# f2.o:
#	 echo f2.o
```

## Call Makefile with different name

To select a different Makefile you can run

```bash
make -f <filename>
```


When declaring a variable you can use `$()` to expand that variable:

```makefile
# Compiler flags
CXXFLAGS = -g -std=c++23 -Wall

# Rule to compile every .cpp to a .o
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@
```




## Variables

| Variable               | Description                           |
| ---------------------- | ------------------------------------- |
| `CC` or `CXX`          | Variables for the C and C++ compilers |
| `CFLAGS` or `CXXFLAGS` | For compiler flags for the C and C++  |
|                        |                                       |
|                        |                                       |

## Flags

| Option    | Description                                       |
| --------- | ------------------------------------------------- |
| `-j [N]`  | Allows N jobs at once; infinite jobs with no arg. |
| `-f FILE` | Read FILE as a makefile.                          |
| `-k`      | Keep going when some targets can't be made.       |
| `-h`      | Print help and exit.                              |

## Targets

| Option   | Description                                                                                                                             |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `.PHONY` | Used to declare targets that don't represent output files, ensuring they're always executed regardless of file existence or timestamps. |
| `all`    | Typically used to specify the default target                                                                                            |
| `clean`  | Conventionally used to define rules for cleaning up the project directory by removing generated files or artifacts.                     |

<https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile>
<https://makefiletutorial.com/>

ROOT_DIR = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
