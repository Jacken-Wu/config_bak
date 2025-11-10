# How to Config fzf

## Install fzf

* For Linux

    ```bash
    # Install fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    # Install bat, chafa
    sudo apt install bat chafa
    ```

* For Windows

    ```powershell
    # Install fzf
    choco install fzf

    # Install bat, chafa
    choco install bat
    winget install --id=hpjansson.Chafa -e
    ```

## Config fzf

* For Linux

    1.Install `ag`:

    ```bash
    sudo apt install silversearcher-ag
    ```

    2.Put `.fzf.zsh` to `~/`.

    3.Add this command to `.zshrc` file:

    ```zsh
    # Set up fzf key bindings and fuzzy completion
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # fzf options
    export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g ''"
    export FZF_DEFAULT_OPTS="
      --walker-skip .git,node_modules,target
      --preview '[ -f {} ] && bat -n --color=always {} || [ -d {} ] && ls {}'
      --height 80%
      --border
      --bind 'ctrl-/:change-preview-window(down|hidden|)'
      --bind 'ctrl-l:accept'"
    export FZF_CTRL_T_COMMAND="ag --hidden --ignore .git -g ''"
    export FZF_CTRL_T_OPTS="
      --walker-skip .git,node_modules,target
      --preview '
        mimetype=\$(file --brief --mime-type {});
        if [[ \"\$mimetype\" == image/* ]]; then
          chafa --font-ratio=4/9 --size=\${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES} {};
        else
          bat -n --color=always {};
        fi
      '
      --height 80%
      --border
      --bind 'ctrl-/:change-preview-window(down|hidden|)'"
    export FZF_CTRL_R_OPTS="
      --preview 'tldr \$(echo {} | sed \"s/^[^a-zA-Z]*\([a-zA-Z0-9-]\{1,\}\).*/\1/\") | grep -v \"^$\"'
      --height 80%
      --border"
    export FZF_ALT_C_OPTS="
      --walker-skip .git,node_modules,target
      --preview 'ls {}'
      --height 80%
      --border
      --bind 'ctrl-/:change-preview-window(down|hidden|)'"
    ```

* For Windows

    1.Install `PSFzf`:

    ```powershell
    Install-Module -Name PSFzf -RequiredVersion 2.6.1
    ```

    2.Put `fzf-previewer.ps1` to `~/Documents/PowerShell/Scripts/`.

    3.Add this command to `profile.ps1` file:

    ```powershell
    # fzf bindings
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r' -PSReadlineChordSetLocation 'Alt+c'
    # **<TAB>
    Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
    # fzf options
    $env:FZF_CTRL_T_COMMAND="ag --hidden --ignore .git -g ''"
    $env:FZF_DEFAULT_OPTS="
        --bind 'ctrl-/:change-preview-window(down|hidden|)'
        --bind 'ctrl-l:accept'"
    $env:FZF_CTRL_T_OPTS=@"
        --walker-skip .git,node_modules,target
        --preview 'pwsh -NoProfile -ExecutionPolicy Bypass -File "$HOME\Documents\PowerShell\Scripts\fzf-previewer.ps1" {}'
        --height 80%
        --border
        --bind 'ctrl-/:change-preview-window(down|hidden|)'
    "@
    $env:FZF_CTRL_R_OPTS="
        --preview 'echo {} | sed `"s/^[^a-zA-Z]*\([a-zA-Z0-9-]\{1,\}\).*/\1/`"'
        --height 80%
        --border"
    $env:FZF_ALT_C_OPTS="
        --walker-skip .git,node_modules,target
        --preview 'ls -n {}'
        --height 80%
        --border
        --bind 'ctrl-/:change-preview-window(down|hidden|)'"
    ```
