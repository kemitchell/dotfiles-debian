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

PROMPT="%2~ %B%b%1(j.+.)%# "

autoload -U compinit compdef
compinit

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

for i in $HOME/.zsh/*.aliases(N); do source "$i" ; done
for i in $HOME/.zsh/*.zsh(N); do source "$i" ; done

export cf=commonform

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# added by travis gem
[ -f /home/kyle/.travis/travis.sh ] && source /home/kyle/.travis/travis.sh

PATH="/home/kyle/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/kyle/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/kyle/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/kyle/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/kyle/perl5"; export PERL_MM_OPT;
