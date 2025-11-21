# How to Install oh-my-zsh

1. Install zsh.

2. Run this sh code to install oh-my-zsh.

    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

3. Edit agnoster.zsh-theme color

    ```bash
    # ~/.oh-my-zsh/themes/
    # Current working directory
    : ${AGNOSTER_DIR_FG:=white}
    : ${AGNOSTER_DIR_BG:=magenta}
    
    # user@host
    : ${AGNOSTER_CONTEXT_FG:=white}
    : ${AGNOSTER_CONTEXT_BG:=cyan}
    
    # prompt_context()中
    prompt_segment "$AGNOSTER_CONTEXT_BG" "$AGNOSTER_CONTEXT_FG" "%(!.%{%F{$AGNOSTER_STATUS_ROOT_FG}%}.)%n@%m"
    # 改为
    prompt_segment "$AGNOSTER_CONTEXT_BG" "$AGNOSTER_CONTEXT_FG" "%(!.%{%F{$AGNOSTER_STATUS_ROOT_FG}%}.)%n"
    ```

4. Edit ~/.zshrc

    ```
    # Set the theme to use
    ZSH_THEME="agnoster"

    # bindkey
    bindkey '\C-e\C-e' edit-command-line
    bindkey '\C-j' down-line-or-beginning-search
    bindkey '\C-k' up-line-or-beginning-search
    bindkey '\C-l' accept-line

    # Set default editor
    export EDITOR='nvim'
    ```

5. If some characters are garbled, try to install MesloLGS NF font.

    ```bash
    mkdir -p ~/.local/share/fonts
    cp ./fonts/* ~/.local/share/fonts/
    fc-cache -f -v
    ```
