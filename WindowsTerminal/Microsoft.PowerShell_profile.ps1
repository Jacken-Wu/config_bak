# 自动补全历史命令，逐字补全
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

# 修改Tab补全为bash风格
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

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
$env:FZF_CTRL_T_OPTS="
	--walker-skip .git,node_modules,target
	--preview 'bat -n --color=always {}'
	--height 80%
	--border
	--bind 'ctrl-/:change-preview-window(down|hidden|)'"
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
