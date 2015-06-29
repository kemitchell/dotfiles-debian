# zgen
# ====
autoload -U compinit compdef
compinit
source "$HOME/.zsh/zgen/zgen.zsh"
if ! zgen saved; then
	echo "Saving zgen script"
	zgen oh-my-zsh plugins/colored-man
	zgen oh-my-zsh plugins/debian
	zgen oh-my-zsh plugins/command-not-found
	zgen oh-my-zsh plugins/gpg-agent
	zgen oh-my-zsh plugins/ssh-agent
	zgen load rupa/z
	# zgen load zsh-users/zsh-completions
	zgen load zsh-users/zsh-history-substring-search
	zgen load zsh-users/zsh-syntax-highlighting
	zgen save
fi

# Prompt
# ======
PROMPT='%m :: %2~ %B%b%1(j.+.)%# '

# Language
# ========
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Node
# ====
export NODE_REPL_HISTORY_FILE=$HOME/.node_history
export NODE_REPL_HISTORY_SIZE=10000
export NODE_REPL_MODE=strict
