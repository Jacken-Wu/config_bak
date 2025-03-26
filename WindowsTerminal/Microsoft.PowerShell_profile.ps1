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

# PSFzf配置
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# pass your override to PSFzf:
Set-PsFzfOption -AltCCommand $commandOverride
# **<TAB>
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
