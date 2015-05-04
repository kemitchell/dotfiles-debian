# ssh-agent
# =========
env="$HOME/.ssh/agent.env"

agent_is_running() {
	if [ "$SSH_AUTH_SOCK" ]; then
		ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
	else
		false
	fi
}

agent_has_keys() {
	ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
	. "$env" >/dev/null
}

agent_start() {
	(umask 077; ssh-agent >"$env")
	. "$env" >/dev/null
}

if ! agent_is_running; then
	agent_load_env
fi

if ! agent_is_running; then
	agent_start
	ssh-add
elif ! agent_has_keys; then
	ssh-add
fi

unset env

# Fortune
# =======

fortune -a /usr/share/games/fortunes/ru/
