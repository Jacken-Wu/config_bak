# Setup fzf
# ---------
if [[ ! "$PATH" == */home/wyg/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/wyg/.fzf/bin"
fi

source <(fzf --zsh)
