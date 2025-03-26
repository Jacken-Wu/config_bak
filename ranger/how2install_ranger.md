# How to install and config ranger?

1. Install ranger with pip3.

    ```bash
    sudo pip3 install ranger-fm
    ```

2. Put the other files except this md file into ~/.config/ranger/.

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
