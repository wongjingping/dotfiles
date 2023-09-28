#!/bin/sh
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# Check if the <WORKSPACE> argument is provided
if [ $# -eq 0 ]; then
  # If not provided, set a default value
  WORKSPACE="$HOME/workspace"
else
  # If provided, use the argument
  WORKSPACE="$1"
fi

########## Variables

dir="${WORKSPACE}/dotfiles"                    # dotfiles directory
olddir="${WORKSPACE}/dotfiles_old"             # old dotfiles backup directory
files="vimrc zshrc"        # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating ${olddir} for backup of any existing dotfiles in ${HOME}"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir || exit
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to ${olddir}"
for file in ${files}; do
    mv "${HOME}/.${file}" "$olddir"
    echo "Creating symlink to ${file} in home directory."
    ln -s "${dir}/${file}" "${HOME}/.${file}"
done
