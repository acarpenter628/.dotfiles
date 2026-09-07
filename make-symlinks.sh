#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/.dotfiles                    # dotfiles directory
olddir=$HOME/.backup_dotfiles             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="bashrc bash_aliases"
dirs="config/nvim config/ranger config/zellij config/wezterm"

##########

# create olddir in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in $HOME ..."
mkdir -p $olddir
echo "done" 

mkdir -p "$HOME/.config"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the $HOME/dotfiles directory specified in $files
for file in $files; do
   touch .$file
   echo "Moving .$file from $HOME to $olddir"
   #mkdir -p $HOME/.$file # only for directories, this breaks .bashrc.  split the files list
   mv $HOME/.$file $olddir
   echo "Creating symlink to $file in home directory."
   ln -s $dir/$file $HOME/.$file
done

for file in $dirs; do
   echo "Moving .$file from $HOME to $olddir"
   mkdir -p .$file
   mv $HOME/.$file $olddir
   echo "Creating symlink to $file in home directory."
   ln -s $dir/$file $HOME/.$file
done
