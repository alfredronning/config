#!/bin/bash

declare -a configs=(".bashrc" ".config/nvim" ".tmux.conf" ".vimrc" ".Xmodmap" ".zshrc")

for config in ${configs[@]}; do
    FILE=${HOME}/$config
    TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
    if test -f "$FILE" || test -d "$FILE"; then
        mkdir -p backup/$TIMESTAMP
        cp -r $FILE ${PWD}/backup/$FILE_$TIMESTAMP
        echo $FILE alredy exist. Saved backup of file in ${PWD}/backup
    fi
    rm -rf $FILE
    ln -s ${PWD}/$config $FILE
done

