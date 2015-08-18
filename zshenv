export PREFIX="$HOME/.local"

export GOROOT=$PREFIX/go
export GOPATH=$GOROOT/path

export PATH="$PREFIX/bin:$GOROOT/bin:$GOPATH/bin:$PATH"
export MANPATH="$PREFIX/share/man:$MANPATH"

for i in $HOME/.zsh/*.zshenv(N) ; do source $i ; done
