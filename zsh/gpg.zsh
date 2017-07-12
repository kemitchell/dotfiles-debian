export GPG_TTY=$(tty)

local GPG_ENV="$HOME/.gnupg/gpg-agent.env"

function start_gpg_agent {
    eval $(/usr/bin/env gpg-agent --quiet --daemon --write-env-file ${GPG_ENV} 2> /dev/null)
    chmod 600 "$GPG_ENV"
    export GPG_AGENT_INFO
}

function check_running_agent {
  gpg-connect-agent --quiet /bye 2> /dev/null
}

if ! check_running_agent; then
  if [ -f "$GPG_ENV" ]; then
    . "$GPG_ENV" > /dev/null
    export GPG_AGENT_INFO
  fi

  if ! check_running_agent; then
    start_gpg_agent
  fi
fi

unfunction start_gpg_agent
unfunction check_running_agent
