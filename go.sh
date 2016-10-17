#!/usr/bin/env bash
#
# Configure linux environment
#

### Utilities

BOLD=$(tput bold)
BLUE="\e[34m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NORMAL=$(tput sgr0)

error() {   echo -e "${RED}ERROR:   ${NORMAL} $*"; }
warning() { echo -e "${YELLOW}WARNING: ${NORMAL} $*"; }
info() {    echo -e "${GREEN}INFO:    ${NORMAL} $*"; }

link_dotfile() {
  [ -e "${HOME}/$1" ] && mv "${HOME}/$1" "${HOME}/${1}-$(date +%s)"
  ln -s "$(pwd)/home/$1" "${HOME}/$1";
}


### Deps
intall_deps() {
  apt-get install -y curl git zsh tmux xclip tmux tmuxinator
}


### User Config

misc_dot_config() {
  link_dotfile ".gemrc"
  link_dotfile ".gitconfig"
}

caps_lock_config() {
  info "Configuring Caps Lock"
  # Gnome
  dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
}


zsh_config() {
  info "Configuring Zsh"
  if [ ! -e "${HOME}/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    rm "${HOME}/.zshrc"
  fi
  link_dotfile ".zshrc"
  link_dotfile ".zsh"
}

tmux_config() {
  info "Configuring Tmux"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  link_dotfile ".tmux.conf"
}

vim_config() {
  info "Configuring Vim"
  link_dotfile ".vimrc.local"
  link_dotfile ".vimrc.bundles.local"
  curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
  rm spf13-vim.sh
}


### System Config




### Main

main() {
  # Deps
  install_deps

  # System Config

  # User Config
  caps_lock_config
  zsh_config
  tmux_config
  vim_config

}

main

