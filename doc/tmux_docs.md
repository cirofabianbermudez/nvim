# Tmux notes

## Commands

| Commands          | Description                |
| ----------------- | -------------------------- |
| `tmux ls`         | List all the sessions open |
| `tmux attach`     | Attach to previous session |
| `tmux at -t nvim` | Attach to target nvim      |

## Shortcuts

Leader Button is `Ctrl + b`

| Shortcut                 | Description                              |
| ------------------------ | ---------------------------------------- |
| `<leader> + c`           | Create a new windows                     |
| `<leader> + n`           | Move to next windows                     |
| `<leader> + d`           | Detach from Tmux session                 |
| `<leader> + 1`           | Move to window 1, you can use any number |
| `<leader> + %`           | Split vertical                           |
| `<leader> + "`           | Split horizontal                         |
| `<leader> + <arrow-key>` | Move through panels                      |
| `<leader> + :`           | Enter to command mode                    |
| `<leader> + s`           | List sessions                            |

## Commands

`:rename-window <somename>`
`:rename-session <somename>`
