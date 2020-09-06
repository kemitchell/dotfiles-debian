export TZ='America/Los_Angeles'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export EDITOR=vim
export BROWSER="/usr/bin/google-chrome"
export PREFIX="$HOME/.local"
export PATH="$PREFIX/bin:$PREFIX/firefox:$PATH"
export MANPATH="$PREFIX/share/man:$MANPATH"

export TRAVEL_FILE="$HOME/.traveling"

export WORKSPACE="$HOME"

for i in $HOME/.zsh/*.zshenv(N); do source "$i" ; done
for i in $HOME/.zsh/*.apikeys(N); do source "$i" ; done
