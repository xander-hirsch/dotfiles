#!/usr/bin/env bash

echo 'Updating Tmux plugins...'
$HOME/.tmux/plugins/tpm/bin/update_plugins all > /dev/null

echo 'Updating Vim plugins...'
vim -Ec 'PlugUpdate|qa' > /dev/null

echo 'Updating Zsh plugins...'
zsh -c 'source "${ZDOTDIR}/.zplug/init.zsh" && zplug update' > /dev/null