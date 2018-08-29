export TZ='America/Los_Angeles'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export EDITOR=vim
export PREFIX="$HOME/.local"
export PATH="$PREFIX/bin:$PATH"
export MANPATH="$PREFIX/share/man:$MANPATH"

export TRAVEL_FILE="$HOME/.traveling"

for i in $HOME/.zsh/*.zshenv(N); do source "$i" ; done
for i in $HOME/.zsh/*.apikeys(N); do source "$i" ; done

# Load nvm
export NVM_DIR="/home/kyle/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
