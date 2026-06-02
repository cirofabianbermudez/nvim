#!/usr/bin/env bash

##==============================================================================
## [Filename]       install_ide.sh
## [Project]        -
## [Author]         Ciro Bermudez - cirofabian.bermudez@gmail.com
## [Language]       Bash scripting
## [Created]        -
## [Modified]       -
## [Description]    -
## [Notes]          -
## [Status]         stable
## [Revisions]      -
##==============================================================================

# Exit on errors, undefined variables, and pipeline failures
set -euo pipefail

# --------------------------------- VERSIONS -----------------------------------

NEOVIM_VERSION="0.12.2"
RG_VERSION="15.1.0"
FZF_VERSION="0.73.1"
FD_VERSION="10.4.2"

# --------------------------------- FUNCTIONS ----------------------------------

info() {
    printf '[INFO] %s\n' "$1"
}

install_dependencies() {
  sudo apt install git curl wget build-essential make g++ gcc -y
  info "Dependencies installed"
}

install_neovim() {
  # Install Neovim
  # https://github.com/neovim/neovim
  local version="$1"
  local install_dir="$HOME/.local/bin"
  mkdir -p "$install_dir"
  wget -P "$install_dir" https://github.com/neovim/neovim/releases/download/v${version}/nvim-linux-x86_64.tar.gz
  tar -xzf "$install_dir/nvim-linux-x86_64.tar.gz" -C "$install_dir"
  mv "$install_dir/nvim-linux-x86_64" "$install_dir/nvim"
  rm -f "$install_dir/nvim-linux-x86_64.tar.gz"
  grep -qxF "export PATH=\"\$HOME/.local/bin/nvim/bin:\$PATH\"" ~/.bashrc \
    || echo "export PATH=\"\$HOME/.local/bin/nvim/bin:\$PATH\"" >> ~/.bashrc
  info "neovim installed"
}

install_ripgrep() {
  # Install ripgrep
  # https://github.com/burntsushi/ripgrep
  local version="$1"
  local install_dir="$HOME/.local/bin"
  mkdir -p "$install_dir"
  wget -P "$install_dir" https://github.com/BurntSushi/ripgrep/releases/download/${version}/ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz
  tar -xzf "$install_dir/ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz" -C "$install_dir"
  mv "$install_dir/ripgrep-${version}-x86_64-unknown-linux-musl" "$install_dir/ripgrep"
  rm -f "$install_dir/ripgrep-${version}-x86_64-unknown-linux-musl.tar.gz"
  grep -qxF "export PATH=\"\$HOME/.local/bin/ripgrep:\$PATH\"" ~/.bashrc \
    || echo "export PATH=\"\$HOME/.local/bin/ripgrep:\$PATH\"" >> ~/.bashrc
  info "ripgrep installed"
}

install_fzf() {
  # Install fzf
  # https://github.com/junegunn/fzf
  local version="$1"
  local install_dir="$HOME/.local/bin"
  mkdir -p "$install_dir"
  wget -P "$install_dir" "https://github.com/junegunn/fzf/releases/download/v${version}/fzf-${version}-linux_amd64.tar.gz"
  tar -xzf "$install_dir/fzf-${version}-linux_amd64.tar.gz" -C "$install_dir"
  rm -f "$install_dir/fzf-${version}-linux_amd64.tar.gz"
  grep -qxF "export PATH=\"\$HOME/.local/bin:\$PATH\"" ~/.bashrc \
    || echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> ~/.bashrc
  info "fzf installed"
}

install_fd() {
  # Install fd
  # https://github.com/sharkdp/fd
  local version="$1"
  local install_dir="$HOME/.local/bin"
  mkdir -p "$install_dir"
  wget -P "$install_dir" https://github.com/sharkdp/fd/releases/download/v${version}/fd-v${version}-x86_64-unknown-linux-gnu.tar.gz
  tar -xzf "$install_dir/fd-v${version}-x86_64-unknown-linux-gnu.tar.gz" -C "$install_dir"
  mv "$install_dir/fd-v${version}-x86_64-unknown-linux-gnu" "$install_dir/fd"
  rm -f "$install_dir/fd-v${version}-x86_64-unknown-linux-gnu.tar.gz"
  grep -qxF "export PATH=\"\$HOME/.local/bin/fd:\$PATH\"" ~/.bashrc \
    || echo "export PATH=\"\$HOME/.local/bin/fd:\$PATH\"" >> ~/.bashrc
  info "fd installed"
}

install_uv() {
  # Install uv
  # https://docs.astral.sh/uv/
  curl -LsSf https://astral.sh/uv/install.sh -o /tmp/uv_install.sh
  sh /tmp/uv_install.sh
  rm -f /tmp/uv_install.sh
}

install_starship() {
  # Install starship
  # https://starship.rs/
  curl -sS https://starship.rs/install.sh -o /tmp/starship_install.sh
  sh /tmp/starship_install.sh
  rm -f /tmp/starship_install.sh
  starship preset plain-text-symbols -o ~/.config/starship.toml
}

download_fonts() {
  # Download Fonts
  # https://www.nerdfonts.com/font-downloads
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/UbuntuMono.zip
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip
}

clone_nvim_repo() {
  # Get Neovim configuration ($HOME/.local/share/nvim is where Neovim stores its data)
  # https://github.com/cirofabianbermudez/nvim
  if [[ ! -d "$HOME/.config/nvim" ]]; then
    git clone https://github.com/cirofabianbermudez/nvim.git "$HOME/.config/nvim"
  else
    info "Neovim config already exists, skipping clone"
  fi
}


main() {
  info "Installing development environment.."

  # install_dependencies

  install_neovim "$NEOVIM_VERSION"
  install_ripgrep "$RG_VERSION"
  install_fzf "$FZF_VERSION"
  install_fd "$FD_VERSION"

  # install_uv
  # install_starship
  # download_fonts
  # clone_nvim_repo

  info "Setup complete!"
}

# ------------------------------------ MAIN ------------------------------------

main "$@"

