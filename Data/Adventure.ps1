Set-Location $PSScriptRoot
echo "Chargement Données..."
. ".\Data.ps1"
echo "Chargement Menus..."
. ".\CommonFunction.ps1"
echo "Chargement Interactions..."
. ".\ItemInteractions.ps1"
echo "Chargement Effets..."
. ".\PlayerInteractions.ps1"
echo "Chargement Stats..."
. ".\PlayerStats.ps1"
echo "Chargement Evenements..."
. ".\Events.ps1"
echo "Chargement Lieux..."
. ".\Locations.ps1"
echo "Chargement Module de Sauvegarde..."
. ".\SaveInteraction.ps1"
echo "Chargement IA..."
. ".\AI.ps1"
echo "Chargement Système de magie..."
. ".\MagicInteractions.ps1"
echo "Chargement Système de combat..."
. ".\CombatInteraction.ps1"


Start-Sleep 1
cls
PlayTitle
NewPlayer
Write-Host "Charger une partie ? (C pour charger / Enter pour créer un nouveau personnage)" -ForegroundColor Yellow
$choice = Read-Host
if ($choice -match "C"){LoadPrompt}
InfoPlayer
ActionMenu