export EDITOR=vim
bindkey -e

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

antigen theme evan
antigen apply

# Go Development Environment
export GOROOT=$HOME/local/go
export GOPATH=$GOROOT/path
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# PATH 
export PATH="$HOME/.bin:$HOME/local/bin:$HOME/.rvm/bin:$PATH"
export MANPATH="$HOME/local/share/man:$MANPATH"
