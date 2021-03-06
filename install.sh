#!/bin/bash

# Installs dotfiles and helpers

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

safe_link(){
    local src="$1"
    local dest="$HOME/`basename $src`"
    [ ! -e "$dest" ] && ln -sf "$src" "$dest"
}

# Get root
SCRIPT_PATH=`realpath $0`
DOTFILES=`dirname $SCRIPT_PATH`

# Install bin scripts
safe_link "$DOTFILES/bin"
# Install other dotfiles
for f in `ls -A $DOTFILES/dotfiles`; do
    safe_link "$DOTFILES/dotfiles/$f"
done

# Updates vim help tags
vim "+helptags ~/.vim/doc" "+q"

# Initialize and update submodules (for vim plugins)
git submodule init
git submodule update

# Set git user
[ -z `git config --global user.name` ] && git config --global user.name "Enrico"
[ -z `git config --global user.email` ] && git config --global user.email "rico.bl@gmail.com"

# Configure diff / merge tool
if [ `uname` == "Darwin" ]; then
    git config --global merge.tool opendiff
    git config --global diff.tool opendiff
else
    git config --global merge.tool meld
    git config --global diff.tool meld
fi

# Global ignores
git config --global core.excludesfile '~/.gitignore_global'

# Disable ".orig" backups
git config --global mergetool.keepBackup false

# Automatically track new branches
git config --global push.default tracking
git config --global branch.autosetupmerge true

# Always rebase when pulling
git config --global branch.autosetuprebase always

# Colored output
git config --global color.ui auto

# Git aliases
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.lg "log --format='%Cgreen%h %Cred%cr %Creset%s %Cblue%cn%Cgreen%d'"
