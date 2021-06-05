# ZSH loads this file for interactive shells.
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

PROMPT="%m %~ %1(j.+.)%# "

autoload -U compinit compdef
compinit

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

if command -v keychain >/dev/null; then
  keychain --quiet "$HOME/.ssh/id_ed25519"
  source "$HOME/.keychain/$HOST-sh"
fi
