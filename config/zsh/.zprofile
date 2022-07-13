BREW='/opt/homebrew/bin/brew'
if [[ -a $BREW ]]; then
	eval "$($BREW shellenv)"
fi

ZPROFILE_LOCAL="${HOME}/.zprofile"
[[ -a $ZPROFILE_LOCAL ]] && source $ZPROFILE_LOCAL || true
