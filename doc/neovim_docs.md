# Neovim notes

|     |     |
| --- | --- |
|     |     |

## Lua

### `vim.opt` - Set Vim Options (Lua-native)

`vim.opt` is the **Lua interface to Vim options** (what you'd normally set with
`:set`)

For example:

```vim
set number
set tabstop=2
```

is equivalent to 

```lua
vim.opt.number = true
vim.opt.tabstop = 2
```

### `vim.cmd` - Execute raw Vimscript

`vim.cmd()` executes **literal Vimscript commands** from Lua. It is a command
bridge between Lua and Vimscript. Tuns exactly what you wuold type after `:`

Example:

```vim
:syntax enable
```

```lua
vim.cmd("syntax enable")
```

| Category          | Command                                                     | Description                        | Typical Effect                         |
| ----------------- | ----------------------------------------------------------- | ---------------------------------- | -------------------------------------- |
| **UI**            | `vim.opt.number = true`                                     | Enables absolute line numbers      | Shows line numbers in the gutter       |
| **UI**            | `vim.opt.relativenumber = false`                            | Disables relative line numbers     | Cursor line shows absolute number only |
| **UI**            | `vim.opt.cursorline = true`                                 | Highlights the current line        | Easier cursor tracking                 |
| **UI**            | `vim.opt.showmatch = true`                                  | Highlights matching brackets       | Helps with parentheses/braces          |
| **UI**            | `vim.opt.ruler = true`                                      | Shows cursor position              | Displays line/column in status area    |
| **UI**            | `vim.opt.showcmd = true`                                    | Displays partial commands          | Shows keystrokes in bottom-right       |
| **UI**            | `vim.opt.laststatus = 2`                                    | Always show status line            | Status bar visible in all windows      |
| **UI**            | `vim.opt.colorcolumn = "80"`                                | Draws a vertical guide column      | Visual 80-char limit                   |
| **UI**            | `vim.opt.termguicolors = true`                              | Enables true color support         | Better color schemes                   |
| **UI**            | `vim.opt.wrap = false`                                      | Disables line wrapping             | Long lines stay on one row             |
| **UI**            | `vim.opt.textwidth = 80`                                    | Sets max text width for formatting | Auto-wrap at 80 when formatting        |
| **Mouse**         | `vim.opt.mouse = "a"`                                       | Enables mouse support              | Mouse works in all modes               |
| **Encoding**      | `vim.opt.encoding = "utf-8"`                                | Sets internal encoding             | UTF-8 text handling                    |
| **Search**        | `vim.opt.ignorecase = true`                                 | Case-insensitive search            | `foo` matches `Foo`                    |
| **Search**        | `vim.opt.hlsearch = true`                                   | Highlights search matches          | All matches stay highlighted           |
| **Search**        | `vim.opt.incsearch = true`                                  | Incremental search                 | Matches shown while typing             |
| **Splits**        | `vim.opt.splitbelow = true`                                 | Horizontal splits open below       | `:split` opens downwards               |
| **Splits**        | `vim.opt.splitright = true`                                 | Vertical splits open right         | `:vsplit` opens to the right           |
| **Tabs**          | `vim.opt.tabstop = 2`                                       | Width of a hard tab                | Tab = 2 spaces                         |
| **Tabs**          | `vim.opt.shiftwidth = 2`                                    | Indent width                       | `>>` shifts by 2 spaces                |
| **Tabs**          | `vim.opt.softtabstop = 2`                                   | Editing tab width                  | Backspace behaves like 2 spaces        |
| **Tabs**          | `vim.opt.expandtab = true`                                  | Converts tabs to spaces            | No literal tab characters              |
| **Performance**   | `vim.opt.updatetime = 50`                                   | Faster CursorHold events           | Snappier UI & LSP feedback             |
| **Compatibility** | `vim.opt.compatible = false`                                | Disables Vi compatibility mode     | Enables modern Vim features            |
| **Syntax**        | `vim.cmd("syntax enable")`                                  | Enables syntax highlighting        | Filetype-based coloring                |
| **Formatting**    | `vim.cmd("autocmd FileType * setlocal formatoptions-=cro")` | Disables auto-comment continuation | No auto `//` or `*` on new lines       |
| **Macros**        | `vim.opt.nrformats:append("alpha")`                         | Allows `<C-a>/<C-x>` on letters    | `a → b`, `z → aa`                      |
| **Clipboard**     | `vim.opt.clipboard = 'unnamedplus'`                         | Uses system clipboard (Win/macOS)  | Yank/paste integrates with OS          |
| **Clipboard**     | `vim.opt.clipboard = 'unnamed'`                             | Uses primary clipboard (Linux/X11) | Middle-click paste support             |
| **Shell**         | `vim.opt.shell = "pwsh"`                                    | Sets PowerShell as shell           | Useful on Windows                      |


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
