# How to Install oh-my-zsh

1. Install zsh.

2. Run this sh code.

    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

3. Put agnoster.zsh-theme into ~/.oh-my-zsh/themes/

4. Edit ~/.zshrc

5. If some characters are garbled, try to install MesloLGS NF font.

    ```bash
    mkdir -p ~/.local/share/fonts
    cp ./fonts/* ~/.local/share/fonts/
    fc-cache -f -v
    ```
