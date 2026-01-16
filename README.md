# nvim_setup

## Gettting started

This is my personal [Neovim](https://neovim.io/) configuration, it can be used in Windows and Linux, it uses the [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager with following plugins:

- Colorscheme ([nord.nvim](https://github.com/gbprod/nord.nvim))
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Oil](https://github.com/stevearc/oil.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

I think these are the bare minimum plugins need it to have a very nice
experience using Neovim, other functionally can be accomplish setting up
internal variables or writing remaps.

After installation, press the `<space>` key to access the **Which-key** menu:

## Installation

### Windows

The installation is strait forward, all the dependencies can be installed manually but it is recommended to use [Scoop](https://scoop.sh/) because it is easier to manage.

Install Scoop:

```bash
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

Install Neovim:

```bash
scoop install neovim
```

Install [Telescope](https://github.com/nvim-telescope/telescope.nvim) dependencies [fd](https://github.com/sharkdp/fd) and [ripgrep](https://github.com/BurntSushi/ripgrep):

```bash
scoop install fd
sccop install ripgrep
```

Install [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) dependencies, a C compiler is required:

```bash
scoop install mingw-winlibs-llvm
```

or

```bash
scoop install gcc
```

### Linux

Install Neovim:

```bash
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz
mkdir -p ~/bin
mv nvim-linux64 ~/bin
rm -rf nvim-linux64.tar.gz
```

add Neovim to the PATH in `~/.bashrc`:

```bash
export PATH=~/bin/nvim-linux64/bin:$PATH
```

Reload `~/.bashrc`

```bash
source .bashrc
```

Install [Telescope](https://github.com/nvim-telescope/telescope.nvim) dependencies [fd](https://github.com/sharkdp/fd) and [ripgrep](https://github.com/BurntSushi/ripgrep):

```bash
sudo apt-get install ripgrep
sudo apt-get install fd-find
```

in `~/.bashrc` paste the following line to avoid problems in case you have other program using the `fd` alias:

```bash
alias fd='fdfind'
```

Install [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) dependencies, a C compiler is required:

```bash
sudo apt install -y build-essential
sudo apt install -y clang llvm libclang-dev
```

Usually this step is optional because most Linux distributions already comes with a C compiler.

If you are using WSL, sometimes it does not come with a clipboard manager installed, you can install one with:

```bash
sudo apt-get install xclip
```

this allows to copy and paste outside Neovim.

## Fonts

For Windows you can install the font with the following command:

```bash
scoop bucket add nerd-fonts
scoop install nerd-fonts/Hack-NF-Mono
```

For Linux you can do the following:

```bash
cd ~
mkdir .fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip -O ~/.fonts
unzip ~/.fonts/Hack.zip -d ~/.fonts
rm ~/.fonts/Hack.zip
```

In both cases you have to to select the font Hack Nerd Font Mono in the Terminal settings.

> [!NOTE]  
> If you want to install the fonts manually there is a `fonts` directory in this repository containing a `Hack.zip` file. For Windows you can decompress and install the font as any other. For Linux you have to create a `~/.fonts` directory and put the fonts there and restart the terminal.

Finally clone the repository in `C:\Users\username\AppData\Local\nvim` for Windows or in `/home/username/.config/nvim` for Linux:

```bash
git clone https://github.com/cirofabianbermudez/nvim.git
```

Open Neovim and let lazy.nvim install all the plugins:

```bash
nvim
```

## Lockfile

After every **update**, the local lockfile is updated with the installed revisions. It is recommended to have this file under version control.

If you use your Neovim config on multiple machines, using the lockfile, you can ensure that the same version of every plugin is installed.

If you are on another machine, you can do `:Lazy restore`, to update all your plugins to the version from the lockfile.

## Spell check

Inside this repository there is a `spell` directory that contains the `*.spl` and `.sug` files for English and Spanish in case you experience some problems while running the `setlocal spell spelllang=es` vim command.

## Extras

### Installing and Upgrading Powershell

Search for the latest version of [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4)
```powershell
winget search Microsoft.PowerShell
```

Install PowerShell
```powershell
winget install --id Microsoft.Powershell --source winget
```

Upgrading an existing installation
```powershell
winget list --name PowerShell --upgrade-available
```

## Project status

- [x] This configuration was tested on a Windows 10/11 machine using [Powershell](https://github.com/PowerShell/PowerShell) and [Terminal](https://github.com/microsoft/terminal).

- [x] This configuration was tested on a WSL Ubuntu 22.04.4 LTS using [Terminal](https://github.com/microsoft/terminal).
