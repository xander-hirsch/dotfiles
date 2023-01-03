export LESS='-RSx4'

if type nvim &> /dev/null ; then
	export EDITOR='nvim'
elif type vim &> /dev/null ; then
	export EDITOR='vim'
else
	export EDITOR='vi'
fi
export VISUAL="$EDITOR"

#####  prompt  #####
setopt PROMPT_SUBST
PS1='%B%F{green}%m%f %F{blue}%c%f %(0?..%F{red}%? %f)%% %b'
if [[ $(hostname -s) == 'Xanders-MacBook-Air' ]]; then
	PS1=$(echo $PS1 | sed 's/%F{green}%m%f //')
fi

#####  rhs git prompt  #####
export GIT_PS1_SHOWDIRTYSTATE='1'
export GIT_PS1_SHOWCOLORHINTS='1'
export GIT_PS1_SHOWUPSTREAM=auto
source "${ZDOTDIR}/git-prompt.zsh"
precmd () { __git_ps1 '' '' }

CHEZMOI=$(chezmoi source-path)
hash -d config="${HOME}/.config"
hash -d chezmoi="${CHEZMOI}"
hash -d nvim="${CHEZMOI}/private_dot_config/nvim"
hash -d zsh="${CHEZMOI}/private_dot_config/zsh"
