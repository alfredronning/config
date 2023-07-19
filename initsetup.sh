#!/bin/bash

declare -a configs=(".bashrc" ".config/nvim" ".tmux.conf" ".vimrc" ".Xmodmap" ".zshrc")

for config in ${configs[@]}; do
    rm -rf ${HOME}/$config
    ln -s ${PWD}/$config ${HOME}/$config
done

