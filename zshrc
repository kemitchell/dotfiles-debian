export EDITOR=vim

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git node debian)
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:~/local/bin:~/.bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
 
source $HOME/.zshaliases
source $HOME/.apikeys
