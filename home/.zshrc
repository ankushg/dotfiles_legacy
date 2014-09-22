export ZSH=$HOME/.oh-my-zsh

plugins=(git brew ankushg)

export PATH="/usr/local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='subl'
fi