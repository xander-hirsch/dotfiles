if [[ $OS_CATEGORY == 'macos' ]]; then
	if [[ $(uname -m) == 'arm64' ]]; then
		export HOMEBREW_PREFIX='/opt/homebrew'
	else
		export HOMEBREW_PREFIX='/usr/local'
	fi
	eval $(${HOMEBREW_PREFIX}/bin/brew shellenv)
fi

ZPROFILE_LOCAL="${HOME}/.zprofile"
[[ -a $ZPROFILE_LOCAL ]] && source $ZPROFILE_LOCAL || true
