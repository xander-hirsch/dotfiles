#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function link_dotfile {
    TARGET="$HOME/$2"
    if [ -f $TARGET ]
    then
        if [ -L $TARGET ]
        then
            rm $TARGET
        else
            mv $TARGET "${TARGET}.bak"
        fi
    fi
    ln -s "$BASEDIR/$1" "$TARGET"
}

function fetch_git_prompt {
    URL='https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh'
    PROMPT_PATH="$BASEDIR/zsh/git-prompt"
    curl $URL | sed 's/PS1=/RPS1=/' > $PROMPT_PATH \
        && echo "__git_ps1 '' ''" >> $PROMPT_PATH
}

fetch_git_prompt
link_dotfile zsh/zshenv .zshenv
