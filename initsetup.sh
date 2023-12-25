#!/bin/bash

declare -a configs=(".bashrc" ".config/nvim" ".tmux.conf" ".vimrc" ".Xmodmap" ".zshrc")
declare -a apt_packages=("git" "python3-dev" "pip" "npm" "cmake" "thefuck" "ripgrep" "vim" "zsh")

# install latest apt packages
for apt_package in ${apt_packages[@]}; do
    if [ $(dpkg-query -W -f='${Status}' ${apt_package} 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
        sudo apt install ${apt_package}
    fi
done
# install neovim unstable
if [ $(dpkg-query -W -f='${Status}' neovim 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt update
    sudo apt install neovim
fi

# set zsh as default shell
chsh -s $(which zsh)

# install pyright
if [ `npm list -g | grep -c pyright` -eq 0 ]; then
    sudo npm install -g pyright
fi
# install pynvim for vimspector to work on newer versions
pip install pynvim

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

# install vim plug
if test ! -f ~/.vim/autoload/plug.vim; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs\
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim +'PlugInstall --sync' +qa

# install and sync nvim packer
if test ! -d ~/.local/share/nvim/site/pack/packer; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

#set git global vars
git config --global core.editor "vim"
git config --global user.email "alfredronning@gmail.com"
git config --global user.name "alfred"
