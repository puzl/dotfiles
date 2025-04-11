#!/bin/bash

if [[ -f $HOME/.bash.d/bash-init ]]; then
    . $HOME/.bash.d/bash-init
fi

[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"
