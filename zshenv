export PREFIX="$HOME/.local"

export GOROOT=$PREFIX/go
export GOPATH=$GOROOT/path
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

export PATH="$HOME/.local/bin:$HOME/.bin:$HOME/local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

for i in $HOME/.zsh/*.zshenv(N) ; do source $i ; done
