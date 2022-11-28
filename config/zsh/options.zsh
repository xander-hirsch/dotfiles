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
