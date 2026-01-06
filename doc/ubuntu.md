# Ubuntu notes

## Install a program


### Check if installation is possible

```bash
apt search <package-name>
apt show <package-name>
apt policy <package-name>
```

### Install

```bash
sudo apt update
sudo apt install <package-name>
```

### Uninstall

```bash
sudo apt remove <package-name>
sudo apt purge <package-name>
sudo apt autoremove
```



## Install VS Code

Download the installer from the official website and then run:

```bash
sudo apt install ./<file>.deb
```

## Install Neovim

```bash
mkdir -p ~/bin
cd ~/bin
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz
rm -rf nvim-linux64.tar.gz
mv nvim-linux64.tar.gz nvim
```

add to the `~/.bashrc`

```bash
export PATH=~/bin/nvim-linux64/bin:$PATH
```

## Install GNOME Tweaks

From the app center look for GNOME Tweaks, then open Tweaks.

```bash
sudo apt update
sudo apt install ripgrep
sudo apt install fd-find
sudo apt install xclip
sudo apt install build-essential
sudo apt install git
```


## Install go

```bash
cd ~/Downloads
sudo rm -rf /usr/local/go 
wget https://go.dev/dl/go1.25.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz

```

in your `~/.bashrc`

```bash
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

go version
g env
go build hello.go
go install hello.go
go run hello.go
```

## Install Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Check if this was added to your `~/.bashrc` and `~/.profile`

```bash
. "$HOME/.cargo/env"
```


This are the last versions of `fd`, `ripgrep`, and `fzf` for the IDE


```bash
git clone https://github.com/rupa/z.git
wget https://github.com/junegunn/fzf/releases/download/v0.67.0/fzf-0.67.0-linux_amd64.tar.gz
wget https://github.com/sharkdp/fd/releases/download/v10.3.0/fd-v10.3.0-x86_64-unknown-linux-gnu.tar.gz
wget https://github.com/BurntSushi/ripgrep/releases/download/15.1.0/ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz
wget https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz
```

## Install MEGA

```bash
wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb && sudo apt install "$PWD/megasync-xUbuntu_22.04_amd64.deb"
```

## 7z

```bash
sudo apt install p7zip-full
```
