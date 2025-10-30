# fzf-previewer.ps1
#
# 接收 fzf 传递过来的文件路径 (例如 "C:\path\to\file.jpg")
param (
    [string]$FilePath
)

# 确保文件存在，否则 bat/img2txt 会报错
if (-not (Test-Path -LiteralPath $FilePath -PathType Leaf)) {
    Write-Output "File not found or is a directory."
    exit
}

# fzf 会在运行时设置这个环境变量
$Width = $env:FZF_PREVIEW_COLUMNS
$Height = $env:FZF_PREVIEW_LINES

# 定义图片扩展名列表
$ImageExtensions = @(".png", ".jpg", ".jpeg", ".gif", ".bmp", ".webp", ".tiff")

# 获取文件的扩展名
$FileExtension = [System.IO.Path]::GetExtension($FilePath).ToLower()

if ($ImageExtensions -contains $FileExtension) {
    # -----------------
    # 1. 预览图片
    # -----------------
    chafa --font-ratio=4/9 --size=${Width}x${Height} $FilePath
} else {
    # -----------------
    # 2. 预览文本 (或其他)
    # -----------------
    # bat 在 Windows 上的可执行文件通常是 bat.exe
    bat -n --color=always $FilePath
}
