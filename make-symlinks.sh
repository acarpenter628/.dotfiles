#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/.dotfiles_backup             # old dotfiles backup directory
files="bashrc bash_aliases config/nvim config/ranger tmux.conf"    # list of files/folders to symlink in homedir

##########

# create olddir in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done" 

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
   echo "Moving .$file from ~ to $olddir"
   mv ~/.$file $olddir
   echo "Creating symlink to $file in home directory."
   ln -s $dir/.$file ~/.$file
done
