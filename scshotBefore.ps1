
# ソースディレクトリとテンポラリディレクトリの設定
$sourceDir = "C:\Users\あなたのユーザー名\Pictures\Screenshots"
$tempDir = "C:\Users\あなたのユーザー名\Documents\Screenshots_Temp"

Write-Host "pass setting complete"
Pause

# テンポラリディレクトリが存在しない場合は作成
if (-Not (Test-Path -Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir
}

# PNGファイルを取得して移動
Get-ChildItem -Path $sourceDir -Filter "*.png" | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $tempDir
}

Write-Host "scshot move complete"
Pause

