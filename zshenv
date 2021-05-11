[ -f ~/.environment ] && source ~/.environment
for i in $HOME/.zsh/*.zshenv(N); do source "$i" ; done
for i in $HOME/.zsh/*.apikeys(N); do source "$i" ; done
