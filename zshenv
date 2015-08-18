export PREFIX="$HOME/.local"

export GOROOT=$PREFIX/go
export GOPATH=$GOROOT/path
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

export PYTHONPATH="$PYTHONPATH:$HOME/local/lib/python"

source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.local/bin:$HOME/.bin:$HOME/local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
