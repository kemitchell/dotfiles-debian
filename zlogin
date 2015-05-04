# Antigen
# =======

source $HOME/.zsh/antigen/antigen.zsh

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

# History
# =======
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history


# Prompt
# ======
PROMPT='%m :: %2~ %B%b%# '

# GPG
# ===
export GPG_TTY=$(tty)

# Language
# ========
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# API Keys
# ========
source .zapikeys
