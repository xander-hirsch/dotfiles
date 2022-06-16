# Keybindings
export KEYTIMEOUT=1
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
bindkey -M viins '^[[Z' expand-or-complete-prefix  # Shift-Tab

# Completion
zmodload -i zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect '^[j' accept-and-infer-next-history
bindkey -M menuselect '^[u' undo

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZDOTDIR/.zcompcache"
zstyle ':completion:*' menu select=4

# Prompt
setopt PROMPT_SUBST
PS1='%B%F{green}%m%f %F{blue}%c%f %(0?..%F{red}%? %f)%% %b'
export PS1_NO_HOSTNAME=$(echo $PS1 | sed 's/%F{green}%m%f //')
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM=auto
autoload -U "$ZDOTDIR/git-prompt"
precmd () { git-prompt }

# Environment Variables
unset SHELL_SESSIONS_DISABLE
export EDITOR=nvim
export VISUAL=nvim

# Changing Directories
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# History
export HISTFILE="$ZDOTDIR/.zsh_history"
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
		if [[ ${KEYMAP} = vicmd || $1 = block ]]; then
			echo -ne $cursor_block
		elif [[ ${KEYMAP} = main || ${KEYMAP} = viins
			|| ${KEYMAP} = '' ]] || $1 = 'beam' ]]; then
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

if [[ $OS_CATEGORY = macos && $(type brew &> /dev/null) ]]
then
	fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

autoload -U compinit && compinit

source "$ZDOTDIR/aliases"

ZSHRC_LOCAL="$HOME/.zshrc"
[[ -a $ZSHRC_LOCAL ]] && source $ZSHRC_LOCAL || true
