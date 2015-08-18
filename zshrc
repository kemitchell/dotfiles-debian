export EDITOR=vim
bindkey -e

setopt auto_cd

setopt share_history
setopt append_history
HISTSIZE=50000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# zgen
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

PROMPT='%m :: %2~ %B%b%1(j.+.)%# '

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

for i in $HOME/.zsh/*.aliases(N); do source "$i" ; done
for i in $HOME/.zsh/*.apikeys(N); do source "$i" ; done
for i in $HOME/.zsh/*.zsh(N); do source "$i" ; done
