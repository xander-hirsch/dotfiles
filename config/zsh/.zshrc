ZSHRC_LOCAL_PRE="${HOME}/.zshrc_pre"
[[ -a $ZSHRC_LOCAL_PRE ]] && source $ZSHRC_LOCAL_PRE

#####  Keybindings  #####
export KEYTIMEOUT='1'
setopt VI
bindkey -M vicmd '^[k' history-beginning-search-backward
bindkey -M viins '^[k' history-beginning-search-backward
bindkey -M vicmd '^[j' history-beginning-search-forward
bindkey -M viins '^[j' history-beginning-search-forward
bindkey -M viins '^[q' push-input
bindkey -M viins '^[.' insert-last-word
bindkey -M viins '^[h' run-help
bindkey -M viins '^[w' which-command
bindkey -M viins '^[u' undo
bindkey -M viins '^[r' redo

#####  Completion  #####
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

#####  Prompt  #####
setopt PROMPT_SUBST
PS1='%B%F{green}%m%f %F{blue}%c%f %(0?..%F{red}%? %f)%% %b'
export PS1_NO_HOSTNAME=$(echo $PS1 | sed 's/%F{green}%m%f //')
export GIT_PS1_SHOWDIRTYSTATE='1'
export GIT_PS1_SHOWCOLORHINTS='1'
export GIT_PS1_SHOWUPSTREAM=auto
autoload -U "${ZDOTDIR}/git-prompt"
precmd () { git-prompt }

#####  Environment Variables  #####
export LESS='-FRSx4'

if type nvim &> /dev/null ; then
	export EDITOR='nvim'
elif type vim &> /dev/null ; then
	export EDITOR='vim'
else
	export EDITOR='vi'
fi
export VISUAL="$EDITOR"

if [[ $OS_CATEGORY = 'macos' ]]; then
	unset SHELL_SESSIONS_DISABLE
	path=("$(brew --prefix)/opt/coreutils/libexec/gnubin" $path)
	fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

#####  Changing Directories  #####
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

#####  History  #####
export HISTFILE="${ZDOTDIR}/.zsh_history"
export HISTSIZE=12000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE
setopt INC_APPEND_HISTORY_TIME

cursor_mode() {
	# See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
	cursor_block='\e[2 q'
	cursor_beam='\e[6 q'

	function zle-keymap-select {
		if [[ $KEYMAP == vicmd || $1 == block ]]; then
			echo -ne $cursor_block
		elif [[ ${KEYMAP} == main || ${KEYMAP} == viins
			|| ${KEYMAP} == '' ]] || $1 == 'beam' ]]; then
			echo -ne $cursor_beam
		fi
	}

	zle-line-init() {
		echo -ne $cursor_beam
	}

	zle -N zle-keymap-select
	zle -N zle-line-init
}

cursor_mode

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

autoload -U compinit && compinit

source "${ZDOTDIR}/aliases"

ZSHRC_LOCAL="${HOME}/.zshrc"
[[ -a $ZSHRC_LOCAL ]] && source $ZSHRC_LOCAL || true
