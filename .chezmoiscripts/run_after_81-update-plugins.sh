#!/usr/bin/env bash

LAST_UPDATE_FILE=$HOME/.plugins-last-update

if [[ -f $LAST_UPDATE_FILE ]]; then
    LAST_UPDATE_DIFFERENCE=$(($(date +%s) - $(date -r $LAST_UPDATE_FILE +%s)))

    if [[ $LAST_UPDATE_DIFFERENCE -lt 86400 ]]; then
        echo 'Plugins updated in the past 24 hours. Skipping.'
        exit 0
    fi
fi
touch $LAST_UPDATE_FILE

if which tmux > /dev/null
then
    echo 'Updating Tmux plugins...'
    $HOME/.tmux/plugins/tpm/bin/update_plugins all > /dev/null
fi

if which vim > /dev/null
then
    echo 'Updating Vim plugins...'
    vim -Ec 'PlugUpdate|qa' > /dev/null
fi

if which zsh > /dev/null
then
    echo 'Updating Zsh plugins...'
    zsh -c 'source "${ZDOTDIR}/.zplug/init.zsh" && zplug update' > /dev/null
fi