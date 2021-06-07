GPG_TTY=$(tty)

GPG_AGENT_ENV_FILE="$HOME/.gnupg/gpg-agent.env"

start_gpg_agent () {
    eval "$(/usr/bin/env gpg-agent --quiet --daemon --write-env-file "$GPG_AGENT_ENV_FILE" 2> /dev/null)"
    chmod 600 "$GPG_AGENT_ENV_FILE"
    export GPG_AGENT_INFO
}

check_running_gpg_agent () {
  gpg-connect-agent --quiet /bye 2> /dev/null
}

if ! check_running_gpg_agent; then
  if [ -f "$GPG_AGENT_ENV_FILE" ]; then
    . "$GPG_AGENT_ENV_FILE" > /dev/null
    export GPG_AGENT_INFO
  fi

  if ! check_running_gpg_agent; then
    start_gpg_agent
  fi
fi
