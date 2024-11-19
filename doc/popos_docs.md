# PopOS notes


Install Neovim dependencies


```bash
sudo apt update
sudo apt upgrade -y
```


This command is to install Node.js that is commonly used to install Linters and Formaters

```bash
sudo apt install nodejs
sudo apt install npm
```

Problem very old version of Node.js

```bash
sudo apt install curl -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
command -v nvm
nvm install --lts
set alias default node
node -v npm -v
```

This command is to install lua and luarocks

```bash
sudo apt install lua5.4
sudo apt install luarocks
```

List intalled flask programs using PopOS shop

```bash
flatpak list
```


```bash
flatpak run com.google.Chrome 
```

