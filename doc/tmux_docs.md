# Tmux notes

## Warnings

If you want to exit the prefix mode use `Ctrl + c`, otherwise it will
crash all you sessions

## Terminal Commands

| Commands                     | Description                |
| ---------------------------- | -------------------------- |
| `tmux ls`                    | List all the sessions open |
| `tmux attach`                | Attach to previous session |
| `tmux at -t nvim`            | Attach to target nvim      |
| `tmux new-session -s <name>` | Create a new session       |
| `tmux kil-session -t <name>` | Kill the session           |
| `tmux kil-server`            | Kill all sessions          |

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
| `<leader> + !`           | Open pane in new window                  |
| `<leader> + <space>`     | Change different layouts                 |
| `<leader> + w`           | List windows                             |
| `<leader> + ,`           | Rename the window                        |
| `<leader> + $`           | Rename the session                       |
| `<leader> + {`           | Move the current pane left               |
| `<leader> + }`           | Move the current pane right              |
| `<leader> + (`           | Switch to previous session               |
| `<leader> + )`           | Switch to next session                   |
| `<leader> + q`           | List the number of the panes             |
| `<leader> + &`           | Kill window                              |
| `<leader> + x`           | Kill pane                                |


To reload configuration
```bash
tmux source-file ~/.tmux.conf
```

## Change size

```plain
<leader> + Ctrl + <arrow-key>
<leader> + Alt + <arrow-key>
```

## Change layout

```plain
<leader> + Alt + 1|2|3|4|5
<leader> + Alt + <space>
```

## Copy mode

```plain
<leader>  [  go into copy mode
<leader>  ]  paste into the current window
```

## Commands

`:rename-window <somename>`
`:rename-session <somename>`
`:rotate-window <somename>`
`:join-pane <somename>`
`:swap-pane <somename> -U`


## Example of `.tmux.conf`

```plain
# Terminal colors
set -g default-terminal "screen-256color"
set -ga terminal-overrides ',xterm-256color:Tc'

# Basic configs
set -g base-index 1
set -s escape-time 10

# Reload config
unbind r
bind r {
  source-file ~/.tmux.conf
  display 'config reloaded'
}

# Change default <leader> key, so called prefix
set -g prefix C-Space

# Enable mouse mode
set -g mouse on

# Vim copy mode
setw -g mode-keys vi

# Fix garbage when copyng
#set-option -s set-clipboard off

# Use Shift (Visual) or Ctrl + Shift (Block) to select the
# text in the terminal
# Use Ctrl + Shift + c to copy
# Use Ctrl + Shift + v to paste

# Vim motions
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# Home and End keys compatibility (Tmux/Neovim)
bind-key -n Home send Escape "OH"
bind-key -n End send Escape "OF"

# Easy move windows
bind i previous-window
bind o next-window

# Status bar
set -g status-interval 60
set -g status-left-length 100
set -g status-right-length 100

set -g status-style bg=default
set -g status-left-style fg=colour0,bg=colour183
set -g status-left '#[bold] #S #[nobold]│ #h │ %H:%M '
set -g status-right-style fg=colour231,bg=default,bold
set -g status-right ' #{?client_prefix,#[bg=colour240] <Prefix>,} '

set -g message-style bg=default

set -g window-status-separator ''
set -g window-status-format ' #I │ #W '
set -g window-status-style fg=colour245,bg=default
set -g window-status-activity-style fg=colour183,bg=default,bold
set -g window-status-bell-style fg=colour0,bg=colour183,bold
set -g window-status-current-format ' #I │ #W '
set -g window-status-current-style fg=colour231,bg=colour240,bold
```

## References

https://willhbr.net/2024/03/06/tmux-conf-with-commentary/
https://github.com/tmux/tmux
https://github.com/gpakosz/.tmux/blob/master/.tmux.conf
