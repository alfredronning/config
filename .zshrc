export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(
    git
    git-prompt
)

source $ZSH/oh-my-zsh.sh
eval "$(thefuck --alias)"
eval "$(starship init zsh)"

# bash default ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#tools aliases
alias rot13='python3 ~/Documents/repositories/tools/rot13.py'
alias caesar='python3 ~/Documents/repositories/tools/caesar.py'
alias hex2chr='python3 ~/Documents/repositories/tools/hex2chr.py'
alias morse='python3 ~/Documents/repositories/tools/morse.py'
alias vingenere='python3 ~/Documents/repositories/tools/vingenere.py'
alias tools='python3 ~/Documents/repositories/tools/tools.py'

#other aliases
alias ghidra='~/Documents/ghidra_10.3_PUBLIC/ghidraRun'
alias xclip='xclip -sel clip'
alias vim=nvim

xmodmap ~/.Xmodmap
