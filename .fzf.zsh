# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tiago/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/tiago/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tiago/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/tiago/.fzf/shell/key-bindings.zsh"
