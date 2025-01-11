#####  Changing Directories  #####
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

#####  Interactive Behavior  #####
setopt INTERACTIVE_COMMENTS

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
