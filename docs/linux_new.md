

# Linux notes 

## `chown`

`chown` means **change owner**.

It changes who owns a file or directory.

Example:

```bash
sudo chown -R $(whoami) worldbanc
```

## `chmod`

`chmod` means **change mode**.

It changes file or directory permissions.

Example:

```bash
sudo chmod -R 755 worldbanc
```

## Permission Numbers

Permission numbers are built from these values:

| Number | Permission |
|---:|---|
| `4` | read |
| `2` | write |
| `1` | execute |

The numbers are added together.

| Number | Meaning |
|---:|---|
| `7` | read + write + execute |
| `6` | read + write |
| `5` | read + execute |
| `4` | read only |

A permission like `755` has three digits:

```text
755
```

Each digit applies to a different group:

| Digit | Applies to |
|---:|---|
| first digit | owner |
| second digit | group |
| third digit | others |

So:

```bash
chmod 755 worldbanc
```

Means:

| Who | Permission |
|---|---|
| Owner | read, write, execute |
| Group | read, execute |
| Others | read, execute |

In symbolic form:

```text
owner:  rwx
group:  r-x
others: r-x
```

## What Does `777` Mean?

```bash
chmod 777 worldbanc
```

Means:

| Who | Permission |
|---|---|
| Owner | read, write, execute |
| Group | read, write, execute |
| Others | read, write, execute |

In symbolic form:

```text
owner:  rwx
group:  rwx
others: rwx
```

`777` gives everyone full access.
