#!/bin/bash

if [[ -f $HOME/.bash.d/bash-init ]]; then
    . $HOME/.bash.d/bash-init
fi

eval "$(dircolors ~/.dircolors)"

if [[ -e /usr/share/doc/fzf/examples/key-bindings.bash ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi
