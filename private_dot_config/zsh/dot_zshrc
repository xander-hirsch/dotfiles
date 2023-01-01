ZSHRC_LOCAL_PRE="${HOME}/.zshrc_pre"
[[ -a $ZSHRC_LOCAL_PRE ]] && source $ZSHRC_LOCAL_PRE

LOCAL_BIN="${HOME}/.local/bin"
if [[ -d $LOCAL_BIN ]]; then
	path=($LOCAL_BIN $path)
fi

SOURCES=(
	options
	keybindings
	environment
	completion
	tools
)
for SOURCE in $SOURCES
do
	source "${ZDOTDIR}/${SOURCE}.zsh"
done

DOT_DIR="${HOME}/.dotfiles"
source "${DOT_DIR}/aliases"
source "${DOT_DIR}/functions"

autoload -U compinit && compinit

ZSHRC_LOCAL="${HOME}/.zshrc"
[[ -a $ZSHRC_LOCAL ]] && source $ZSHRC_LOCAL || true
