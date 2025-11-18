# How to configure zoxide

1. Install zoxide using your package manager.

    ```bash
    # For Ubuntu
    sudo apt install zoxide
    # For Windows
    choco install zoxide
    ```

2. Add the following line to your shell configuration file (e.g. `.zshrc` for zsh, `$PROFILE` for powershell, etc.)
    ```bash
    # For zsh
    eval "$(zoxide init --cmd cd zsh)"
    # For powershell
    Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
    ```

3. If cd error `cd:1: maximum nested function level reached; increase FUNCNEST?`, reinstall zoxide with `curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh`. It will install the newest version.
