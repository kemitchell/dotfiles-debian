local env="$HOME/.ssh-agent.env"

function read_agent_env () {
  source "$env" > /dev/null
}

function start_agent () {
  ssh-agent >! "$env"
  chmod 600 "$env"
  read_agent_env
  ssh-add
}

if [[ -f "$env" ]]; then
  read_agent_env
else
  start_agent
fi

unfunction start_agent
unfunction read_agent_env
