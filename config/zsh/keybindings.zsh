export KEYTIMEOUT='1'
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
bindkey -M viins '^[r' redo
