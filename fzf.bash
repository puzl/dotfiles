# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hjw/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/hjw/.fzf/bin"
fi

eval "$(fzf --bash)"
