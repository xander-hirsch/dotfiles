zmodload -i zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect ';' accept-and-infer-next-history
bindkey -M menuselect 'u' undo

zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*:approximate:*' max-errors 2
zstyle ':completion:*' menu select=8
zstyle ':completion:*:descriptions' format '%F{cyan}-----  %d  -----%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''

setopt NO_LIST_BEEP

SSH_CMDS='(ssh|ssh-copy-id|scp|sftp|rsync)'
zstyle ":completion:*:${SSH_CMDS}:*" users root xh $(whoami)

function trim_whitespace {
	echo -n "$1" | sed -E 's/^[[:space:]]*//' | sed -E 's/[[:space:]]*$//'
}

USER_SSH_CONFIG="${HOME}/.ssh/config"
if [[ -a $USER_SSH_CONFIG ]]; then
	HOST_PREFIX='^[[:space:]]*Host([[:space:]]+|[[:space:]]*=[[:space:]]*)'
	set -a ssh_hosts
	typeset -U ssh_hosts
	for SSH_HOST in \
		$(grep -Ei $HOST_PREFIX $USER_SSH_CONFIG | sed -E "s/${HOST_PREFIX}//i")
	do
		if [[ ! $SSH_HOST =~ '\*' ]]; then
			ssh_hosts+=("$(trim_whitespace "@${SSH_HOST}")")
		fi
	done
	zstyle ":completion:*:${SSH_CMDS}:*:my-accounts" users-hosts $ssh_hosts

	USER_PREFIX="$(echo -n "$HOST_PREFIX" | sed 's/Host/User/')"
	ssh_users=("$(whoami)" 'root')
	typeset -U ssh_users
	for SSH_USER in \
		$(grep -Ei $USER_PREFIX $USER_SSH_CONFIG | sed -E "s/${USER_PREFIX}//i")
	do
		ssh_users+="$(trim_whitespace "${SSH_USER}")"
	done
	zstyle ":completion:*:${SSH_CMDS}:*" users $ssh_users
fi
