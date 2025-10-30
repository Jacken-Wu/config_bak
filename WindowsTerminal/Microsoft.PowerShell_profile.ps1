# 自动补全历史命令，逐字补全
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally -MaximumHistoryCount 5000
Set-PSReadLineOption -HistoryNoDuplicates

# 修改Tab补全为bash风格
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# 设置向上箭头为搜索历史中以当前输入开头的命令
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
# 设置向下箭头为反向搜索
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
# 优化历史搜索体验
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# 主题
oh-my-posh init pwsh --config C:\Users\Jacken\Documents\PowerShell\capr4n.omp.json | Invoke-Expression

# thefuck配置
$env:PYTHONIOENCODING="utf-8"
iex "$(thefuck --alias)"

# fzf bindings
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r' -PSReadlineChordSetLocation 'Alt+c'
# **<TAB>
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
# fzf options
$env:FZF_CTRL_T_COMMAND="ag --hidden --ignore .git -g ''"
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
	--preview 'ls {}'
	--height 80%
	--border
	--bind 'ctrl-/:change-preview-window(down|hidden|)'"

# zoxide
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
