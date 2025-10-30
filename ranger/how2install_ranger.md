# How to install and config ranger?

1. Install ranger with pip3.

    ```bash
    sudo pip3 install ranger-fm
    ```

2. Put the other files except this md file into ~/.config/ranger/.

    - commands_full.py: all commands
    - commands.py: custom commands
    - rc.conf: startup config
    - rifle.conf: file executor/opener
    - scope.sh: preview

    Change txt files and image files' preview in scope.sh.
    ```bash
    # Preview txt files with bat
    # Change the text/* part in handle_mime()
    env COLORTERM=8bit bat --color=always --style="${BAT_STYLE}"

    # Preview image files with chafa
    # Set the preview size at the beginning of the script
    PREVIEW_WIDTH="$2"
    PREVIEW_HEIGHT="$3"
    # Change the image/* part in handle_mime()
    chafa --font-ratio="4/9" --size="${PREVIEW_WIDTH}x${PREVIEW_HEIGHT}" --colors=256 "${FILE_PATH}" && exit 5
    ```

3. Add the following lines to ~/.bashrc or ~/.zshrc. This makes you CD into the last directory when you exit ranger.

    ```bash
    # CD into the last directory when you exit ranger.
    alias ranger='ranger --choosedir=$HOME/.config/ranger/.rangerdir; LASTDIR=`cat $HOME/.config/ranger/.rangerdir`; cd "$LASTDIR"'
    ```

4. If the script preview display error, install the following packages.

    ```bash
    sudo apt install highlight
    sudo apt install bat
    ```
