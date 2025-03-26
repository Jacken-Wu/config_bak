# How To Install tmux-powerline?

## Install tmux-powerline

1. Download tpm.

    ```bash
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```

2. Press prefix + I to install the plugs.

3. If characters can not display normally, install the powerline font.

    ```bash
    sudo apt install fonts-powerline

    ```

## Config Powerline

1. Install tmux-mem-cpu-load.

    ```bash
    git clone https://github.com/thewtex/tmux-mem-cpu-load.git
    cd tmux-mem-cpu-load
    cmake .
    make
    sudo make install
    ```

2. Put theme/default.sh to ~/.tmux/plugins/tmux-powerline/themes/

3. Put config/defaults.sh to ~/.tmux/plugins/tmux-powerline/config/

4. If pwd is too long, change the following line in ~/.tmux/plugins/tmux-powerline/segments/pwd.sh:

    ```bash
    TMUX_POWERLINE_SEG_PWD_MAX_LEN="${TMUX_POWERLINE_SEG_PWD_MAX_LEN:-40}"
    ```

    Change the value to a smaller number to display shorter path.
