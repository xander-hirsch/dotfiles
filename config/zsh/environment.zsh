export LESS='-RSx4'

if type nvim &> /dev/null ; then
	export EDITOR='nvim'
elif type vim &> /dev/null ; then
	export EDITOR='vim'
else
	export EDITOR='vi'
fi
export VISUAL="$EDITOR"


setopt PROMPT_SUBST
PS1='%B%F{green}%m%f %F{blue}%c%f %(0?..%F{red}%? %f)%% %b'
export PS1_NO_HOSTNAME=$(echo $PS1 | sed 's/%F{green}%m%f //')
export GIT_PS1_SHOWDIRTYSTATE='1'
export GIT_PS1_SHOWCOLORHINTS='1'
export GIT_PS1_SHOWUPSTREAM=auto
autoload -U "${ZDOTDIR}/git-prompt"
precmd () { git-prompt }
