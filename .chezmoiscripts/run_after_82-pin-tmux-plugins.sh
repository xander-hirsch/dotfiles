#!/usr/bin/env bash

TMUX_PLUGINS_DIR=$HOME/.config/tmux/plugins

cd $TMUX_PLUGINS_DIR/tmux-menus
git switch --quiet main && git merge --quiet --ff-only @{upstream}