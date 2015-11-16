[string[]]$DATASPELL = "Lifetap","Scan","Restauration","Fireball","Calin"

function UseSpell ($spellname) {
    switch ($spellname)
    {
        "Lifetap"
        {
            if ($BattleIsActive -eq $true)
            {
                Write-Host "Vous puisez dans votre vie !" -ForegroundColor Yellow
                DamageLife(20)
                RegenPM(50)

            }
            else
            {
                Write-Host "Lifetap :" -ForegroundColor Yellow
                Write-Host "Permet de régénérer vos PM"
                Write-Host "Cout en PM : +50 PM"
                Write-Host "Cout en PV : 20 PV"
            }
        }
        "Scan"
        {
            if ($BattleIsActive -eq $true)
            {
                Write-Host "====================================================" -ForegroundColor Yellow
                Write-Host "                     Vie adversaire" -ForegroundColor Yellow
                Write-Host "====================================================" -ForegroundColor Yellow
                BarAffichage -Total $PVOppMax -Partiel $PVOpp -BackgroundColor "Red" -ForegroundColor "DarkGreen"
                Write-Host "====================================================" -ForegroundColor Yellow
            }
            else
            {
                Write-Host "Scan :" -ForegroundColor Yellow
                Write-Host "Permet de voir la vie de l'adversaire"
                Write-Host "Cout en PM : 0 PM"
            }
        }
        "Fireball"
        {
            if ($BattleIsActive -eq $true)
            {
                if ($PMActu -ge 35)
                {
                    Write-Host "Vous envoyez une boule de feu sur votre adversaire !" -ForegroundColor Yellow
                    $Degat = (Randomize (50+($CarInt)) (100 + ($CarInt * 3)))
                    $Script:PVOpp = $PVOpp - $Degat
                    Start-Sleep 1
                    echo ""
                    Write-Host "Vous infligez $Degat dégats à $NameOpp !" -ForegroundColor Green
                    Start-Sleep 1
                    echo ""
                    DamagePM(35)
                }
                else
                {
                    Write-Host "Vous manquez de PM !" -ForegroundColor Red
                }
            }
            else
            {
                Write-Host "Fireball :" -ForegroundColor Yellow
                Write-Host "Enovie une boule de feu sur votre adversaire"
                Write-Host "Cout en PM : 35 PM"
                $varTemp1 = 100 + ($CarInt * 3)
                $varTemp2 = 50 + $CarInt
                Write-Host "Degats : $varTemp2 à $varTemp1"
            }            
        }
    }
}