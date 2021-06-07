#!/bin/sh
SSH_AGENT_ENV_FILE="$HOME/.ssh-agent.env"

source_ssh_agent_env () {
  . "$SSH_AGENT_ENV_FILE"
}

start_ssh_agent () {
  ssh-agent >! "$SSH_AGENT_ENV_FILE"
  chmod 600 "$SSH_AGENT_ENV_FILE"
  source_ssh_agent_env
  ssh-add
}

if [ -f "$SSH_AGENT_ENV_FILE" ]; then
  source_ssh_agent_env
  pgrep ssh-agent | grep -q "$SSH_AGENT_PID" || start_ssh_agent
else
  start_ssh_agent
fi
