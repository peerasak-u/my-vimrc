#!/usr/bin/env bash

# check git, curl and npm
(command -v git >/dev/null 2>&1 && command -v curl >/dev/null 2>&1&& command -v npm >/dev/null 2>&1) || {
  echo >&2 "You first need to have git, curl and npm installed. Aborting.";
  exit 1;
}

bundle=$HOME/.vim/bundle
vundle=$bundle/Vundle.vim

repo=https://github.com/modood/vimrc/raw/master

# Download "VundleVim/Vundle.vim" Vim Plugin Manager
if [ ! -d $vundle ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $vundle
fi

# Copy dotfiles
dotfiles=(
  .vimrc
)
for i in ${dotfiles[@]}; do curl -L $repo/$i > $HOME/$i; done

# PluginInstall: "VundleVim/Vundle.vim" plugin's install command.
vim +PluginInstall +qall
