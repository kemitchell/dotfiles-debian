export PREFIX="$HOME/.local"
export PATH="$PREFIX/bin:$PATH"
export MANPATH="$PREFIX/share/man:$MANPATH"

for i in $HOME/.zsh/*.zshenv(N) ; do source $i ; done
