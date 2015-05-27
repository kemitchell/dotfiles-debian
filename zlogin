# Antigen
# =======
source $HOME/.zsh/antigen/antigen.zsh
antigen bundles <<EOBUNDLES
	colored-man
	command-not-found
	rupa/z
	ssh-agent
	gpg-agent
	zsh-users/zsh-history-substring-search
	zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen apply

# Prompt
# ======
PROMPT='%m :: %2~ %B%b%# '

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
