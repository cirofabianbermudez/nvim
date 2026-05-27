# Regex Quick Tutorial

A regular expression is a pattern for matching text. You use it with tools like
`grep`, `sed`, Bash, Python, editors, and test parsers.

Think of regex as “describe the shape of the text” instead of hardcoding one
exact string.

## 1. Literal text

This matches exact text:

```regex
UVM_ERROR
```

It matches:

```
UVM_ERROR
```

## 2. Character classes: `[]`

Square brackets mean "matck one character from this set"

```regex
[ABC]
```

Matches one of: `A`, `B`, `C`

```regex
[0-9]

Matches one digit

```regex
[a-z]
```

Matches one lowercase letter

Important: `[]` is not a group. It is one-character choice.

## 3. POSIX character classes

These are common in `grep` and shell tools:

```regex
[[:space:]]
[[:digit:]]
[[:alpha:]]
[[:alnum:]]
```

Examples:

- `[[:space:]]` = space, tab, etc.
- `[[:digit:]]` = `0` to `9`
- `[[:alpha:]]` = letters
- `[[:alnum:]]` = letters or digits

So:

```regex
[[:space:]]*
```

means “zero or more whitespace characters”.

## 4. Quantifiers: `*`, `+`, `?`

These say how many times something may repeat.

- `*` = zero or more
- `+` = one or more
- `?` = zero or one

Examples:

```regex
[0-9]+
```

One or more digits: `3`, `12`, `999`

```regex
[[:space:]]*
```

Zero or more spaces/tabs

```regex
colou?r
```

Matches `color` or `colour`

## 5. Anchors: `^` and `$`

These tie the pattern to the start or end of the line.

- `^` = start of line
- `$` = end of line

Example:

```regex
^UVM_ERROR
```

Matches only if the line starts with `UVM_ERROR`

```regex
0$
```

Matches only if the line ends with `0`

Full-line example:

```regex
^UVM_ERROR[[:space:]]*:[[:space:]]*[0-9]+$
```

This means:
- line starts
- `UVM_ERROR`
- optional spaces
- `:`
- optional spaces
- one or more digits
- line ends

## 6. Groups: `()`

Parentheses create a group.

```regex
(ERROR|FATAL)
```

Matches either `ERROR` or `FATAL`

Example:

```regex
UVM_(ERROR|FATAL)
```

Matches:
- `UVM_ERROR`
- `UVM_FATAL`

This is different from:

```regex
[ERRORFATAL]
```

That would mean one character chosen from those letters, which is not what you want.

## 7. Alternation: `|`

The `|` means “or”.

```regex
cat|dog
```

Matches `cat` or `dog`

Usually use it inside a group:

```regex
UVM_(ERROR|FATAL)
```

## 8. Dot: `.`

A dot means “any single character”.

```regex
a.b
```

Matches:
- `acb`
- `a-b`
- `a b`

Be careful: `.` is broad.

## 9. Escaping special characters

Some characters have special meaning and must be escaped with `\` if you want them literal.

Example:

```regex
\.
```

means a real dot, not “any character”.

```regex
\(
\)
\[
\]
```

literal parentheses or brackets

In `grep -E`, `+`, `?`, `|`, `()` are regex operators already, so you usually do not escape them unless you want them literal.

## 10. `grep -E`

`grep -E` uses extended regex, which is easier to read.

Example:

```bash
grep -E 'UVM_(ERROR|FATAL)'
```

Without `-E`, some operators behave differently and may need backslashes.

## 11. `grep -o`

`-o` means “print only the matched part”.

Example line:

```text
UVM_ERROR : 12
```

Command:

```bash
grep -oE '[0-9]+'
```

Output:

```text
12
```

## 12. Real examples for your case

Match a UVM summary line:

```regex
^[[:space:]]*UVM_ERROR[[:space:]]*:[[:space:]]*[0-9]+[[:space:]]*$
```

Match either error or fatal:

```regex
^[[:space:]]*UVM_(ERROR|FATAL)[[:space:]]*:[[:space:]]*[0-9]+[[:space:]]*$
```

Match a failing summary count:

```regex
FAILED:[[:space:]]*[1-9][0-9]*
```

This avoids matching `FAILED: 0`.

## 13. Good habits

- Use `^` and `$` when you mean a full line
- Avoid loose patterns like `ERROR` or `FAILED`
- Prefer specific patterns over broad ones
- Test patterns on real log lines
- For numeric summaries, match the line first, then extract the number

## 14. Mini cheat sheet

```regex
abc           exact text
[abc]         one char: a or b or c
[a-z]         one lowercase letter
[0-9]         one digit
[[:space:]]   one whitespace char
*             zero or more
+             one or more
?             zero or one
^             start of line
$             end of line
.             any one char
(...)         group
a|b           a or b
```

## 15. Practice examples

Try to read these in English:

```regex
^TEST PASSED$
```
Exact line `TEST PASSED`

```regex
^UVM_FATAL[[:space:]]*:[[:space:]]*0$
```
Line starts with `UVM_FATAL`, then `:`, then `0`

```regex
Assertion.*failed
```
`Assertion`, then anything, then `failed`

```regex
FAILED:[[:space:]]*[1-9][0-9]*
```
`FAILED:` followed by a non-zero integer

If you want, next I can give you a regex tutorial specifically for `grep` and Bash with 10 commands you can run directly on your logs.
