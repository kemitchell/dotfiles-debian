# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# If running BASH...
if [ -n "$BASH_VERSION" ]; then
    # ... include .bashrc if it exists.
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi

setpath="$HOME/.local/bin/setsearchpath"
if [ -x "$setpath" ]; then
  . "$setpath"
fi

setpath="$HOME/.local/bin/setsearchpath"
[ -f "$setpath" ] && source "$setpath"
