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

List installed flask programs using PopOS shop

```bash
flatpak list
```

```bash
flatpak run com.google.Chrome
```

To install a program from the command line it is recommended to use `apt install`
you can also use `apt-get install` but the first is more modern and easy to use


## Install a `.deb`

To install a `.deb` package use the following command

```bash
sudo dpkg -i your-packege.deb
```
but sometimes this command can fail because of missing dependencies then you have to run

```bash
sudo apt-get install -f
```

Another way is to use `apt install`, this method automatically resolves dependencies

```bash
sudo apt install your-package.deb
```

If for some reason there are missing dependencies after installation use:

```bash
sudo apt --fix-broken install
```

Finally to uninstall the program use:

```bash
sudo apt remove package-name
```

If you want to remove the package along with its configuration files use:

```bash
sudo apt purge package-name
```

After removing the package, you can clean up any left over dependencies with;

```bash
sudo apt autoremove
```

Which Should You Use?

Use `remove` if:

- You want to retain configuration files for later use or backup.
- You're troubleshooting an issue but may reinstall the package.

Use `purge` if:

- You want to completely remove the package and its settings.
- You're cleaning up your system and don’t need the configuration files.
