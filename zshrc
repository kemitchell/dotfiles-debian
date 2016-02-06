export EDITOR=vim
bindkey -e

setopt auto_cd
setopt auto_pushd
setopt auto_resume
setopt auto_list

setopt share_history
setopt append_history
setopt extended_history
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

autoload -U colors && colors
if [[ -z "$SSH_CLIENT" ]]; then
	PROMPT="%2~ %B%b%1(j.+.)%# "
else
	PROMPT="%F{$((RANDOM % 8))}%m $reset_color :: %2~ %B%b%1(j.+.)%# "
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

for i in $HOME/.zsh/*.aliases(N); do source "$i" ; done
for i in $HOME/.zsh/*.apikeys(N); do source "$i" ; done
for i in $HOME/.zsh/*.zsh(N); do source "$i" ; done

export cf=commonform

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
