#!/usr/bin/env bash

SSH_CONFIG="$HOME/.ssh/config"
SSH_CONTROL_DIR="$HOME/.ssh/control"

if ! [[ -f $SSH_CONFIG ]]; then
    cat << EOF > $SSH_CONFIG
Host *
    Include config.defaults
EOF
    chmod 600 $SSH_CONFIG
fi

if ! [[ -d $SSH_CONTROL_DIR ]]; then
    mkdir $SSH_CONTROL_DIR
    chmod -R 700 $SSH_CONTROL_DIR
fi