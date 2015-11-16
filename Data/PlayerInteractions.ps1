function PlayerDeath () {
    Start-Sleep 1
    echo ""
    Write-Host "Vous êtes mort..." -ForegroundColor Black -BackgroundColor White
    pause
    cls
    echo "Vous vous appeliez $Nom"
    echo "Vous étiez Niveau $Level"
    echo "Vous aviez une intelligence de $CarInt"
    echo "Vous aviez une force de $CarForce" 
    echo "Vous aviez une endurance de $CarEndurance"
    echo "Vous aviez environ $CarChance % de chance"
    echo "Vous pouviez faire de $DegatMinB jusqu'a $DegatMaxB dégats de base"
    echo "Avec votre arme, vous pouviez faire $DegatMin jusqu'à $DegatMax dégats"
    echo "Vous aviez $PV point de vie de base"
    echo "Vous n'en avez plus"
    echo ""

    Start-Sleep 6

    echo "Vous aviez $Argent francs dans votre portefeuille"
    echo "Vous vous battiez avec $ArmeEquipe"
    echo ""
    Write-Host "==============================" -ForegroundColor Gray
    Write-Host " Contenu de votre Inventaire  " -ForegroundColor Gray
    Write-Host "==============================" -ForegroundColor Gray
    for ($idx = 0; $idx -lt $Inventaire.Length; $idx++)
    {
        if ($Inventaire[$idx] -ne "Rien")
        {
            $val1 = $Inventaire[$idx]
            echo "- [$idx] $val1" 
        }
    }

    Start-Sleep 5
    echo ""
    Write-Host "Durant votre quête, vous êtes mort..." -ForegroundColor Red
    Start-Sleep 3
    echo ""
    Write-Host "Votre corps repose dans $ActualLocation..." -ForegroundColor Red
    Start-Sleep 3
    echo ""
    Write-Host "Votre vie se termine ici..." -ForegroundColor Red
    echo ""
    Write-Host "Appuyer sur Enter pour Quitter" -ForegroundColor Black -BackgroundColor White
    Read-Host
    exit

}

function LureDeath () {
    [int]$difficulty = 100 - $CarChance
    $LureDeath = TryAction $difficulty 0
    if ($LureDeath -eq $true)
    {
        Write-Host "!!! VOUS AVEZ ECHAPPÉ Â LA MORT !!!" -ForegroundColor Yellow
        $Script:PVActu = 1
        Write-Host "Vous avez actuellement 1 pv !" -ForegroundColor Yellow
        $Script:CarChance = $CarChance - 10
        if ($CarChance -le 0)
        {
            $Script:CarChance = 0
            Write-Host "!!! VOUS N'AVEZ PLUS AUCUNE CHANCE DE RESISTER A LA MORT !!!" -ForegroundColor Red
        }
        else
        {
            Write-Host "Votre chance a baissée jusqu'à $CarChance % !" -ForegroundColor DarkYellow
        }
    }
    else
    {
        PlayerDeath
    }
}


function RegenLife ($value) {
    $localvalue = $value
    $PVlocal = $PVActu
    $Script:PVActu = $PVActu + $value
    if ($PVActu -gt $PV)
    {
        $Script:PVActu = $PV
        $localvalue = ($PV - $PVlocal)
    }
    Write-Host "Vous avez regenéré $localvalue PV" -ForegroundColor Green
    Write-Host "Vous avez maintenant $PVActu PV" -ForegroundColor DarkGreen
}

function DamageLife ($value) {
    $Script:PVActu = $PVActu - $value
    if ($PVActu -lt 0)
    {
        LureDeath
    }
    else
    {
        Write-Host "Vous avez perdu $value PV" -ForegroundColor Red
        Write-Host "Vous avez maintenant $PVActu PV" -ForegroundColor DarkRed
    }
    
}

function RegenPM ($value) {
    $localvalue = $value
    $PMlocal = $PMActu
    $Script:PMActu = $PMActu + $value
    if ($PMActu -gt $PM)
    {
        $Script:PMActu = $PM
        $localvalue = ($PM - $PMlocal)
    }
    Write-Host "Vous avez regenéré $localvalue PM" -ForegroundColor Magenta
    Write-Host "Vous avez maintenant $PMActu PM" -ForegroundColor DarkMagenta
}

function DamagePM ($value) {
    $Script:PMActu = $PMActu - $value
    if ($PMActu -lt 0)
    {
        $Script:PMActu = 0
    }
    else
    {
        Write-Host "Vous avez perdu $value PM" -ForegroundColor Magenta
        Write-Host "Vous avez maintenant $PMActu PM" -ForegroundColor DarkMagenta
    }
    
}