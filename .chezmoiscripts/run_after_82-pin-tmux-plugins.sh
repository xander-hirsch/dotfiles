#!/usr/bin/env bash

cd $XDG_CONFIG_HOME/tmux/plugins/tmux-menus
git switch --quiet main && git merge --quiet --ff-only @{upstream}