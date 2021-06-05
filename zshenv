# ZSH loads this file for all shells.
#
source $HOME/.zsh/zgen/zgen.zsh
if ! zgen saved; then
  zgen load "zsh-users/zsh-syntax-highlighting"
  zgen load "zsh-users/zsh-history-substring-search"
  zgen save
fi

[ -f $HOME/.environment ] && source $HOME/.environment

for i in $HOME/.zsh/*.aliases(N); do source "$i" ; done
for i in $HOME/.zsh/*.zsh(N); do source "$i" ; done
