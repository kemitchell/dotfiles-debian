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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# $HOME/local
# -----------
export PATH="$HOME/.bin:$HOME/local/bin:$PATH"
export MANPATH="$HOME/local/share/man:$MANPATH"
