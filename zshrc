export EDITOR=vim

export ZSH=$HOME/.zsh/oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git node debian)
source $ZSH/oh-my-zsh.sh

export PATH=~/.bin:$PATH:~/local/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
 
source $HOME/.zshaliases
source $HOME/.apikeys
source $HOME/.zsh/z/z.sh
