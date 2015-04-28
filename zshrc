export EDITOR=vim
bindkey -e
setopt auto_cd
setopt share_history
setopt append_history

export ZSH=$HOME/.zsh/
source $ZSH/aliases

# Antigen Packages

source $ZSH/antigen/antigen.zsh
antigen bundles <<EOBUNDLES
	bower
	cabal
	colored-man
	command-not-found
	debian
	gem
	git
	git-extras
	github
	grunt
	heroku
	lein
	node
	npm
	pip
	rupa/z
	rvm
	ssh-agent
	tmux
	zsh-users/zsh-history-substring-search
	zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply

# Prompt
PROMPT='%m :: %2~ %B%b%# '

# Go Development Environment
export GOROOT=$HOME/local/go
export GOPATH=$GOROOT/path
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# Python
export PYTHONPATH="$PYTHONPATH:$HOME/local/lib/python"

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# PATH 
export PATH="$HOME/.bin:$HOME/local/bin:$HOME/.rvm/bin:$PATH"
export MANPATH="$HOME/local/share/man:$MANPATH"

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

# GPG
export GPG_TTY=$(tty)

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
