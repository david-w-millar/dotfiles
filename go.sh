#!/usr/bin/env bash
#
# Configure linux environment
#


### Config

NEW_USER_NAME=dave


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
  ln -s "$(pwd)/home/$1" "${HOME}/$1";
}



### System Config

configure_sudoers() {
  info "Configuring Sudoers"
  echo "%sudo   ALL= NOPASSWD: ALL" > /etc/sudoers.d/sudo
}

configure_apt() {
  info "Configuring Apt"
  sudo apt-get install -y apt-transport-https ca-certificates
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  echo "deb https://apt.dockerproject.org/repo debian-stretch main" > /etc/apt/sources.list.d/docker.list
  sudo apt-get update
}

install_deps() {
  info "Installing script dependencies"
  apt-get install -y curl git zsh tmux xclip tmux tmuxinator vim sudo
}

### System wide packages

useful_packages() {
  info "Installing useful packages"
  apt-get install -y silversearcher-ag thefuck unoconv urlscan urlview
  apt-get install -y surfraw surfraw-extras

  # da fuq? docker / docker.io not available?
  #apt-get install -y docker.io

  apt-get install -y docker-compse docker-registry ctop sen packer vagrant ansible

  apt-get install -y fruitywifi
  apt-get install -y android-sdk
  apt-get install -y gpsd gpsd-clients sqlite3 sqlitebrowser
  apt-get install -y sqlite3

  apt-get install -y xvfb
  apt-get install -y vlc
  apt-get install -y transmission transmission-cli
}

docker_config() {
  info "Configuring Docker"
  apt-get install -y docker-engine
  service docker start
  service docker restart
  systemctl enable docker
}

config_skel() {
  cp -R . "/etc/skel/.dotfiles"
}

add_user() {
  info "Creating user ${NEW_USER_NAME}"
  adduser --shell /usr/bin/zsh --disabled-login --gecos '' ${NEW_USER_NAME} 
  adduser ${NEW_USER_NAME} sudo
  adduser ${NEW_USER_NAME} docker
  warning "You will need to change the password manually for ${NEW_USER_NAME}"
}



### Current User Config

misc_dot_config() {
  info "Configuring Misc Dotfiles"
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


### Main

system_config() {
  configure_sudoers
  configure_apt
  install_deps
  useful_packages
  docker_config
  config_skel
  add_user
}

current_user_config() {
  caps_lock_config
  zsh_config
  tmux_config
  vim_config
  misc_dot_config
}

main() {
  [[ $EUID -eq 0 ]] && system_config
  current_user_config
}

main

