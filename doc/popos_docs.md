# PopOS notes

## Options to be aware

Show Windows Titles ON

## Install Tmux

```bash
sudo apt install tmux
```

## APT

In short, for regular users and system administrators, apt is the go-to choice,
while developers and script writers might prefer apt-get.

```bash
apt update
apt upgrade 
apt install <package>
apt search <package>
apt search <package>
apt show <package>
apt-cache policy <apt-name>
```

## Install Neovim dependencies

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
sudo apt install ./your-package.deb
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

## Configure VPN

1. Install OpenVPN Plugin for Network Manager

- Open a terminal and run:

```bash
Copy code
sudo apt update
sudo apt install network-manager-openvpn network-manager-openvpn-gnome
```

This ensures that Network Manager can handle `.ovpn` files.

2. Access Network Settings

- Click the network icon in the system tray (top-right corner of your desktop).
- Select **Settings > Network**.

3. Import the .ovpn File

- Scroll down to the **VPN** section and click the + button.
- Select **Import from file....**
- Browse to the location of your `.ovpn` file and select it.

4. Configure Authentication (if required)

- If your `.ovpn` file requires additional credentials (e.g., username and password), the GUI will prompt you to enter them.
- Save your changes.

5. Connect to the VPN

- After importing, toggle the VPN on from the same Network Settings menu or from the system tray.


## Install TeX Live

```bash
sudo apt-get install texlive-full
sudo apt-get install texmaker
```


## VSCode

https://askubuntu.com/questions/1093261/vs-code-not-showing-top-menu-bar-ubuntu-18-10

File/Preferences/Settings

window.titleBarStyle

custom

## Install TeXLive

```bash
sudo apt-get install texlive-full
sudo apt-get install texmaker
```

press enter like crazy if texlive installations gets stuck

https://superuser.com/questions/358749/how-to-disable-ctrlshiftu

## References

https://support.system76.com/articles/pop-keyboard-shortcuts/
