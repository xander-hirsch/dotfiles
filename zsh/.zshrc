# Changing Directories
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# History
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE

# Prompt
setopt PROMPT_SUBST
PS1='%B%F{green}%m%f %F{blue}%c%f %(0?..%F{red}%? %f)%% %b'
export PS1_NO_HOSTNAME=$(echo $PS1 | sed 's/%F{green}%m%f //')
fpath=($ZDOTDIR $fpath)
autoload -Uz git-prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM=auto
precmd () { git-prompt }

# Keybindings
bindkey -v
export KEYTIMEOUT=1

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
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

ALIASES_DIR="$ZDOTDIR/aliases"
source "$ALIASES_DIR/universal"
OS=$(uname)
case "$(uname)" in
    'Darwin')
        source "$ALIASES_DIR/macos"
        if type brew &>/dev/null; then
            fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
        fi
        ;;
    'Linux')
        eval "$(cat /etc/os-release | grep 'ID_LIKE=')"
        case "$ID_LIKE" in
            'debian')
                source "$ALIASES_DIR/debian"
                ;;
        esac
	;;
esac

source "$ZDOTDIR/completion.zsh"

ZSHRC_LOCAL="$HOME/.zshrc_local"
test -r $ZSHRC_LOCAL && source $ZSHRC_LOCAL || true
