# Neovim notes

|     |     |
| --- | --- |
|     |     |

## Open Neovim with no plugins

```bash
nvim -u NONE
```

## Sessions

Create a session `mks session.vim`, this saves the current state of buffer open, use `mks!` instead to override.

Load a session `so session.vim`

## History

To open the history `q:`

## Telescope

| Shortcut   | Description           |
| ---------- | --------------------- |
| `Ctrl + v` | Open vertical split   |
| `Ctrl + x` | Open horizontal split |
| `Ctrl + q` | Open quick fix        |


Open Neovim in diff mode

```plain
nvim -d file1.txt file2.txt
```

Open vim in diff mode

```plain
vimdiff file1.txt file2.txt
```

Command line

```plain
sdiff file1.txt file2.txt
```
