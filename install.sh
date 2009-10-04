#!/bin/bash

# Installs the dotfiles and helpers

[ ! -d ~/bin ] && ln -s ~/dotfiles/bin ~/bin
[ ! -f ~/.bash_aliases ] && ln -s ~/dotfiles/bash/.bash_aliases ~/.bash_aliases
[ ! -f ~/.bashrc ] && ln -s ~/dotfiles/bash/.bashrc ~/.bashrc

# Set git to use meld for diff
git config --global diff.external ~/bin/git-meld.py
