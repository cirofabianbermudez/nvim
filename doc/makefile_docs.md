
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

## Automatic variables

| Variable | Description                                  |
| -------- | -------------------------------------------- |
| `$<`     | Represents the first prerequisite of a rule. |
| `$@`     | Represents the target of the rule.           |
|          |                                              |
|          |                                              |

- `$<`: Represents the first prerequisite of a rule. It refers to the name of the first prerequisite (usually a source file) of the target being built. This is particularly useful in compilation rules when there's only one source file involved.
- `$@`: Represents the target of the rule. It refers to the name of the target being built. This variable is helpful when you want to refer to the target name in the recipe.

## Operators

| Operator       | Description                    |
| -------------- | ------------------------------ |
| `?=`           | Conditional assignment.        |
| `+=`           | Appends to the existing value. |
| `$()` or `${}` |                                |
|                |                                |

- `?=` is used for conditional assignment. It only assigns the value to the variable if the variable is currently undefined. If the variable is already defined, `?=` does not change its value.
- `+=` is used for appending values to existing variables. It adds the specified value to the end of the current value of the variable.

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

ROOT_DIR = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
