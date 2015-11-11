Set-Location $PSScriptRoot
$console = $host.UI.RawUI
$console.ForegroundColor = "white"
$console.BackgroundColor = "black"
$buffer = $console.BufferSize
$buffer.Width = 400
$buffer.Height = 2000
$console.BufferSize = $buffer
Clear-Host
Set-Location $PSScriptRoot
echo "Lancement programme"
. ".\Data\Adventure.ps1"
