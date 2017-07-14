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

autoload -U colors && colors

if [[ -z "$SSH_CLIENT" ]]; then
	PROMPT="%2~ %B%b%1(j.+.)%# "
else
	PROMPT="%F{$((RANDOM % 8))}%m $reset_color :: %2~ %B%b%1(j.+.)%# "
fi

# source $HOME/.zsh/antigen/antigen.zsh
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-history-substring-search
# antigen apply

source $HOME/.zsh/zgen/zgen.zsh
if ! zgen saved; then
  zgen load "zsh-users/zsh-syntax-highlighting"
  zgen load "zsh-users/zsh-history-substring-search"
  zgen save
fi

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

autoload -U compinit compdef
compinit

for i in $HOME/.zsh/*.aliases(N); do source "$i" ; done
for i in $HOME/.zsh/*.zsh(N); do source "$i" ; done

export cf=commonform

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# added by travis gem
[ -f /home/kyle/.travis/travis.sh ] && source /home/kyle/.travis/travis.sh
