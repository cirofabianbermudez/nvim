# C programming notes

## Compilation Flags

| Flag                       | Description                                                                                      |
| -------------------------- | ------------------------------------------------------------------------------------------------ |
| `-o <filename>`            | Specifies the output file name.                                                                  |
| `-Wall`                    | Enables almost all compiler warnings.                                                            |
| `-Wextra`                  | Enables more compiler warnings.                                                                  |
| `-std=c99`                 | Specifies the C language standard to use. `c89`, `c99`, `c11`, `c17`                             |
| `-Wno-missing-braces`      | Suppresses warnings related to missing braces in initializers.                                   |
| `-g`                       | Generates debug information to be used by debuggers like GDB.                                    |
| `-O0`, `-O1`, `-O2`, `-O3` | Disables almost all optimizations. Basic optimization. Moderate optimization. High optimization. |
| `-I <path>`                | Specifies an additional directory to search for header files.                                    |
| `-L <path>`                | Specifies an additional directory to search for library files.                                   |
| `-l <file>`                | Specifies the name of the library to link against.                                               |

> **Warning:**  for `-I`, `-L`, `-l` if an error occurs remove the blank.
