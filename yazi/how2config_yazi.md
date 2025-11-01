# How to configure yazi

1. [Installation](https://yazi-rs.github.io/docs/installation)

2. Put `keymap.toml` into `~/.config/yazi/`

2. Edit `.zshrc`

    ```
    # cd to the directory where you view when you quit yazi
    yy() {
        local _yy_tmp=; local _yy_cwd=
        _yy_tmp="$(command mktemp -t "yazi-cwd.XXXXXX")"
        command yazi "$@" --cwd-file="$_yy_tmp"

        _yy_cwd="$(cat -- "$_yy_tmp")"
        command rm -f -- "$_yy_tmp"

        if [ -n "$_yy_cwd" ] && [ "$_yy_cwd" != "$PWD" ]; then
            cd -- "$_yy_cwd"
        fi
    }
    ```
