#!/bin/bash

declare -a configs=(".bashrc" ".config/nvim" ".tmux.conf" ".vimrc" ".Xmodmap" ".zshrc")

# create symlinks to configs in home
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
for config in ${configs[@]}; do
    FILE=${HOME}/$config
    if test ! -L "$FILE"; then
        if test -f "$FILE" || test -d "$FILE"; then
            mkdir -p backup/$TIMESTAMP
            cp -r $FILE backup/$TIMESTAMP
            echo $FILE alredy exist. Saved backup of file in ./backup
        fi
    fi
    rm -rf $FILE
    ln -s ${PWD}/$config $FILE
done

# install pyright
if [ `npm list -g | grep -c pyright` -eq 0 ]; then
    sudo npm install -g pyright
fi

# install ripgrep
if [ $(dpkg-query -W -f='${Status}' ripgrep 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    sudo apt install ripgrep
fi

# install and sync nvim packer
if test ! -d ~/.local/share/nvim/site/pack/packer; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
