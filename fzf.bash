# Setup fzf
# ---------
if [[ ! "$PATH" == */home/media/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/media/.fzf/bin"
fi

eval "$(fzf --bash)"
