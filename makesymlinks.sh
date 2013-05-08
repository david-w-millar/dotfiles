#!/bin/bash
#
# Creates symlinks to dot files
#

display_status () { echo "::::: $1 :::::"; }

# locations
dir=~/dotfiles
olddir=~/dotfiles_old
files="tmux.conf Xdefaults zshrc zsh cdmrc vimrc.local vimrc.bundles.local gitconfig"

# backup
display_status "Backing up old configs" 
mkdir -p $olddir
for file in $files; do
   echo "  ~/.$file -> $olddir"
   mv ~/.$file $olddir
done

# symlink
display_status "Creating Symlinks"
for file in $files; do
  echo "  ~/.$file <- $dir/$file"
  ln -s $dir/$file ~/.$file
done

# spf13 (vim)
# curl http://j.mp/spf13-vim3 -L -o - | sh

# gvm
# curl -s get.gvmtool.net | bash

# oh-my-zsh
# curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

