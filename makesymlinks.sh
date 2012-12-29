#!/bin/bash
#
# Creates symlinks to dot files
#

display_status () { echo "::::: $1 :::::"; }

# locations
dir=~/dotfiles
olddir=~/dotfiles_old
files="tmux.conf tmux Xdefaults"


# Xdefaults - solarized dark
cat $dir/Xdefaults-millar > $dir/Xdefaults
cat $dir/xresources/solarized >> $dir/Xdefaults


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


