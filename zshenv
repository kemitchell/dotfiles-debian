# Search Path
# ===========

# Go
# --
export GOROOT=$HOME/local/go
export GOPATH=$GOROOT/path
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# Python
# -------
export PYTHONPATH="$PYTHONPATH:$HOME/local/lib/python"

# Ruby
# ----
source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"

# $HOME/local
# -----------
export PATH="$HOME/.local/bin:$HOME/.bin:$HOME/local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"

# Prefix
# ------
export PREFIX="$HOME/.local"
