function Savegame ($filepath, $filename)
{

Set-Location -Path $filepath

[string]$localInventory = "`""
for ($idx = 0; $idx -lt ($Inventaire.Length - 1); $idx++)
{
    $localInventory += $Inventaire[$idx] + "`",`""
}
$localInventory += $Inventaire[$idx] + "`""

"`$Script:ResultTest = $ResultTest
`$Script:Level = $Level
`$Script:XP = $XP
`$Script:CarInt = $CarInt
`$Script:CarForce = $CarForce
`$Script:CarEndurance = $CarEndurance
`$Script:CarChance = $CarChance
`$Script:DegatMinB = $DegatMinB
`$Script:DegatMaxB = $DegatMaxB
`$Script:DegatMin = $DegatMin
`$Script:DegatMax = $DegatMax
`$Script:PV = $PV
`$Script:PVActu = $PVActu
`$Script:PM = $PM
`$Script:PMActu = $PMActu
`$Script:Argent = $Argent
`$Script:Nom = `"$Nom`"
`$Script:FilePath = `"$FilePath`"
`$Script:Inventaire = $localInventory
`$Script:ArmeEquipe = `"$ArmeEquipe`"
`$Script:ArmureEquipe = `"$ArmureEquipe`"
`$Script:ValArmure = $ValArmure
`$Script:ArmurePJ = $ArmurePJ
`$Script:BonusArmeMin = $BonusArmeMin
`$Script:BonusArmeMax = $BonusArmeMax
`$Script:Location1 = `"$Location1`"
`$Script:Location2 = `"$Location2`"
`$Script:ZoneActu = $ZoneActu
`$Script:ActualLocation = `"$ActualLocation`"" > $filename
Write-Host "Sauvegarde terminée !" -ForegroundColor Green
}

function Loadgame ($filepath)
{
    $value = Test-Path -Path $filepath
    if ($value -eq $true)
    {
        . $filepath
    }
    else
    {
        Write-Host "ERREUR : FICHIER DE SAUVEGARDE NON DECOUVERT" -ForegroundColor Red
    }
    
}

function SavePrompt () {
    cls
    Set-Location $PSScriptRoot
    Set-Location "..\Save"
    $basepath = Get-Location
    Write-Host "Choisir le nom de la sauvegarde (N pour annuler)" -ForegroundColor Yellow
    $name = Read-Host
    if ($name -eq "N"){}
    elseif ($name -eq "n"){}
    else
    {
        $name += ".ps1"
        $Script:basepath += "\$name"
        Savegame $basepath $name
    }
}

function LoadPrompt () {
    cls 
    Set-Location $PSScriptRoot
    Set-Location "..\Save"

    [string[]]$arraySave = Get-ChildItem "..\Save" | ForEach-Object{$_.Name}

    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host "              Sauvegardes  " -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Yellow
    for ($idx = 0; $idx -lt $arraySave.Length; $idx++)
    {
        $val1 = $arraySave[$idx]
        echo "- [$idx] $val1"
    }
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host "Choisissez le numéro de votre sauvegarde ou N pour annuler" -ForegroundColor Gray
    $idxSave = Read-Host

    if ($idxSave -match "N") {}
    elseif( $idxSave -ge 0 -and $idxSave -le $arraySave.Length){
        $path = "./" + $arraySave[$idxSave]

        $Script:FilePath = $path
        Loadgame $path
    }
    else
    {
        LoadPrompt
    }


}
