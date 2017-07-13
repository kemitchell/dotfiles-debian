local env="$HOME/.ssh-agent.env"

function source_env {
  source "$env" > /dev/null
}

function start_agent {
  ssh-agent >! "$env"
  chmod 600 "$env"
  source_env
  ssh-add
}

if [[ -f "$env" ]]; then
  source_env
  ps x | grep ssh-agent | grep -q $SSH_AGENT_PID || start_agent
else
  start_agent
fi

unfunction start_agent
unfunction source_env
