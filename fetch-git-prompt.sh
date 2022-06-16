#!/usr/bin/env bash

URL='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
curl $URL | sed 's/PS1=/RPS1=/' && echo "__git_ps1 '' ''"
