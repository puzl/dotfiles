# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hjw/.fzf/bin* ]]; then
  export PATH="$PATH:/home/hjw/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/hjw/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/hjw/.fzf/shell/key-bindings.bash"

