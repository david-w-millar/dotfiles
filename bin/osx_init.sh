#!/usr/bin/env bash
#
# Bootstrap osx environment with dotfiles, zsh, vim config and friends
#

#set +x
sudo -v

function status() {
  echo "----- [ $1 ] -----"
}

# Brew
function setup_brew() {
  status "Installing Brew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  status "Installing Brewfile Packages"
  . ../misc/Brewfile
}

# Casks
function setup_cask() {
  status "Installing Brew Cask and Packages"
  . ../misc/Casks
}

# Dotfiles
function dotfiles() {
  status "Installing dotfiles"
  sudo gem install homesick
  homesick clone david-w-millar/dotfiles
  homesick link dotfiles
}

# Zsh
function zsh_config() {
  status "Installing Zsh"
  curl -L http://install.ohmyz.sh | sh
}

# spf13 (vim)
function spf13() {
  status "Installing spf13"
  curl http://j.mp/spf13-vim3 -L -o - | sh
}

# Groovy Ecosystem
function groovy_ecosystem() {
  status "Installing Groovy and Friends"
  . groovy_ecosystem.sh
}

# Ruby Ecosystem
function groovy_ecosystem() {
  status "Installing Groovy and Friends"
  . ruby_ecosystem.sh
}


# Install Things
setup_brew
setup_cask
dotfiles
zsh_config
spf13
groovy_ecosystem
ruby_ecosystem

# Gui Configs ....
# Disable capslock in prefs
# seil
# onepassword
# dropbox
# total spaces
# spectacle


