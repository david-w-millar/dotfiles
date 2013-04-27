#!/bin/bash
#
# Creates symlinks to dot files
#

display_status () { echo "::::: $1 :::::"; }

# locations
dir=~/dotfiles
olddir=~/dotfiles_old
files="tmux.conf tmux conkyrc ackrc xinitrc Xdefaults zshrc zsh xmodmaprc cdmrc vimrc.local vimrc.bundles.local vim gitconfig muttrc gemrc vimsauce"

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

### One-Offs
display_status "Creating Grails scripts symlink link"
mkdir -p ~/.grails
ln -s $dir/grails/scripts ~/grails/scripts

# spf13 (vim)
#curl http://j.mp/spf13-vim3 -L -o - | sh

# mutt dirs
#mkdir -p ~/.mutt/cache/headers mkdir ~/.mutt/cache/bodies touch ~/.mutt/certificates


