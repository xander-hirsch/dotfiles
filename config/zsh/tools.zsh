#####  macOS  #####
if [[ $OS_CATEGORY = 'macos' ]]; then
	unset SHELL_SESSIONS_DISABLE
	if type brew &>/dev/null; then
		fpath+=("$(brew --prefix)/share/zsh/site-functions")
	fi
fi

#####  pyenv  #####
PYENV_ROOT="${HOME}/.pyenv"
if [[ -d $PYENV_ROOT ]]; then
	export PYENV_ROOT
	path=("${PYENV_ROOT}/bin" $path)
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi
