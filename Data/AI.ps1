function EnnemyAttack () {

    Write-Host "$NameOpp vous attaque !" -ForegroundColor Red
    $Degat = Randomize $MinDegatOpp $MaxDegatOpp
    $Degat = $Degat - $PlayerArmor - $BoostArmorValue
    Start-Sleep 1
    echo ""
    if ($Degat -gt 0)
    {
        DamageLife $Degat
    }
    else
    {
        Write-Host "$NameOpp ne vous inflige aucun dégat !" -ForegroundColor Green
    }

}

function EnnemyAction ($AIName)
{
    switch ($AIName)
    {
        "Standard"
        {
            EnnemyAttack
        }
    }
}