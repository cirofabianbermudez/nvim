# Ubuntu notes


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

sudo apt update
sudo apt install ripgrep
sudo apt install fd-find
sudo apt install xclip
sudo apt install build-essential
sudo apt install git


## Install go

```bash
cd ~/Downloads
wget https://go.dev/dl/go1.25.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz

```

in your ~/.bashrc

```bash
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

go version
go env

go build hello.go
go install hello.go
go run hello.go
``

