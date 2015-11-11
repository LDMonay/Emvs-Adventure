function Unequip () {
    $Script:ArmeEquipe = "Poings"
    $Script:BonusArmeMin = 0
    $Script:BonusArmeMax = 0
    CalculateStats
}

function AddItem ($itemname) {
    [int]$Full = 0
    for ($idx = 0; $idx -lt $Inventaire.Length; $idx++)
    {
        if ($Inventaire[$idx] -eq "Rien")
        {
            Write-Host "Vous venez d'obtenir $itemname !" -ForegroundColor Yellow
            $Inventaire[$idx] = $itemname
            break
        }
        else
        {
            $Full++
        }
    }
    if ($Full -ge $Inventaire.Length)
    {
        echo "Inventaire plein, vous laissez $itemname par terre"
    }

}

function RemoveItem ($itemname) {
    for ($idx = 0; $idx -lt 10; $idx++)
    {
        if ($Inventaire[$idx] -eq $itemname)
        {
            $Inventaire[$idx] = "Rien"
            break
        }
    }
}

function Use ($itemname) {
    if ($DATAFOOD.Contains($itemname))
    {
        UseFood $itemname
    }
    elseif ($DATAWEAPONS.Contains($itemname))
    {
        UseWeapon $itemname
    }
    elseif ($DATACOMMONS.Contains($itemname))
    {
        UseCommon $itemname
    }
    elseif ($DATAARTEFACT.Contains($itemname))
    {
        UseArtefact $itemname
    }
    else {
        Write-Host "Objet inexistant, Annulation" -ForegroundColor Red
        RemoveItem $itemname
    }
}

function UseFood ($foodname) {
    switch ($foodname) 
    {
        "Coca-Cola"
        {
            echo "Vous buvez votre Coca-Cola"
            $regen = Randomize 35 65
            RegenLife $regen
            break
        }
        "Bi�re"
        {
            echo "Vous buvez votre bi�re"
            $regen = Randomize 40 70
            RegenLife $regen
            break
        }
        "Pizza margarita"
        {
            echo "Vous mangez votre pizza"
            $regen = Randomize 70 120
            RegenLife $regen
            break
        }
        "Pizza prochuito"
        {
            echo "Vous mangez votre pizza"
            $regen = Randomize 80 130
            RegenLife $regen
            break
        }
        "Pizza au thon"
        {
            echo "Vous mangez votre pizza... m�me si le thon c'est pas tr�s bon"
            $regen = Randomize 50 100
            RegenLife $regen
            break
        }
        "Sandwich au jambon"
        {
            echo "Vous mangez votre sandwich"
            $regen = Randomize 50 100
            RegenLife $regen
            break
        }
        "Sprite"
        {
            echo "Vous buvez votre Sprite"
            $regen = Randomize 35 65
            RegenLife $regen
            break
        }
        "Steak de lion"
        {
            echo "Vous mangez votre steak de lion ! MMmmh !"
            $regen = Randomize 200 300
            RegenLife $regen
            break
        }
        "Kit-Kat"
        {
            echo "Vous mangez un bon kit-kat"
            $regen = Randomize 10 60
            RegenLife $regen
            break
        }
        "Twix"
        {
            echo "Vous mangez un twix"
            $regen = Randomize 10 60
            RegenLife $regen
            break
        }
        "Sandwich viande s�ch�e"
        {
            echo "Vous mangez votre sandwich"
            $regen = Randomize 50 150
            RegenLife $regen
            break            
        }
        "Menu �tudiant"
        {
            echo "Vous mangez votre menu �tudiant"
            $regen = Randomize 100 200
            RegenLife $regen
            break 
        }
    }

    RemoveItem $foodname

}

function UseWeapon ($weaponname) {
    if ($ArmeEquipe -ne "Poings"){ InventoryUnequip }
    switch ($weaponname) 
    {
        "Baton"
        {
            echo "Vous vous equipez de votre baton"
            $Script:ArmeEquipe = "Baton"
            $Script:BonusArmeMin = 5
            $Script:BonusArmeMax = 10
        }
        "Batte de baseball"
        {
            echo "Vous vous equipez de votre batte de baseball"
            $Script:ArmeEquipe = "Batte de baseball"
            $Script:BonusArmeMin = 25
            $Script:BonusArmeMax = 45
        }
        "Couteau � cran d'arr�t"
        {
            echo "Vous vous equipez de votre couteau"
            $Script:ArmeEquipe = "Couteau � cran d'arr�t"
            $Script:BonusArmeMin = 5
            $Script:BonusArmeMax = 35
        }
        "Planche clout�e"
        {
            echo "Vous vous equipez d'une planche clout�"
            $Script:ArmeEquipe = "Planche clout�e"
            $Script:BonusArmeMin = 10
            $Script:BonusArmeMax = 40
        }
        "Pierre"
        {
            echo "Vous vous equipez de votre pierre"
            $Script:ArmeEquipe = "Pierre"
            $Script:BonusArmeMin = 8
            $Script:BonusArmeMax = 14
        }
        "Scie circulaire"
        {
            echo "Vous vous equipez d'une scie circulaire... Ca va pas bien dans votre t�te ?"
            $Script:ArmeEquipe = "Scie circulaire"
            $Script:BonusArmeMin = 10
            $Script:BonusArmeMax = 70
        }
        "Thon gel�"
        {
            echo "Vous vous equipez de votre thon gel�"
            $Script:ArmeEquipe = "Thon gel�"
            $Script:BonusArmeMin = 20
            $Script:BonusArmeMax = 20
        }
        "Hachoir"
        {
            echo "Vous vous equipez de votre beau gros hachoir � viande"
            $Script:ArmeEquipe = "Hachoir"
            $Script:BonusArmeMin = 15
            $Script:BonusArmeMax = 50
        }
        "Grosse baguette"
        {
            echo "Vous vous equipez d'une grosse baguette"
            $Script:ArmeEquipe = "Grosse baguette"
            $Script:BonusArmeMin = 5
            $Script:BonusArmeMax = 30
        }
        "Couteau papillion"
        {
            echo "Vous vous equipez d'un couteau papillion"
            $Script:ArmeEquipe = "Couteau papillion"
            $Script:BonusArmeMin = 15
            $Script:BonusArmeMax = 30
        }
        "Fouet"
        {
            echo "Vous vous equipez d'un fouet"
            Write-Host "Vous seriez pas un petit peu maso par hasard ?" -ForegroundColor Gray
            $Script:ArmeEquipe = "Fouet"
            $Script:BonusArmeMin = 18
            $Script:BonusArmeMax = 38
        }
        "Cravache"
        {
            echo "Vous vous equipez... d'une cravache ?"
            Write-Host "faut croire que vous �tes bizzare..." -ForegroundColor Gray
            $Script:ArmeEquipe = "Cravache"
            $Script:BonusArmeMin = 5
            $Script:BonusArmeMax = 20
        }
        "Levier de vitesse"
        {
            echo "Vous vous equipez d'un levier de vitesse"
            $Script:ArmeEquipe = "Levier de vitesse"
            $Script:BonusArmeMin = 12
            $Script:BonusArmeMax = 24
        }

    }
    CalculateStats
    RemoveItem $weaponname
}

function UseCommon ($commonname)
{
    switch ($commonname)
    {
        "Amulette obscure"
        {
            Write-Host "Vous examinez l'amulette" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 10)
            {
                Write-Host "L'amulette vous octroie du pouvoir sombre !" -ForegroundColor Yellow
                $Script:PV += 20
                $Script:CarEndurance += 2
                Write-Host "Vos PV et votre endurance ont �t� augement� !" -ForegroundColor Yellow
            }
            elseif ($Chance -le 20)
            {
                Write-Host "L'amulette tente d'avaler votre ame !!!" -ForegroundColor Red
                LureDeath
            }
            elseif ($Chance -le 30)
            {
                StartEvent "JULTOR(Enfer)"
            }
            else
            {
                Write-Host "L'amulette vous octroie du pouvoir sombre !" -ForegroundColor Yellow
                $Script:PV += 10
                Write-Host "Vos PV ont �t� augement�s !" -ForegroundColor Yellow
            }

            Write-Host "Apr�s cela, l'amulette se brise et tombe au sol" -ForegroundColor Red
            RemoveItem "Amulette obscure"
        }
        "Amulette lumineuse"
        {
            Write-Host "Vous examinez l'amulette" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 10)
            {
                Write-Host "L'amulette vous octroie du pouvoir divin !" -ForegroundColor Yellow
                $Script:PV += 20
                $Script:CarEndurance += 2
                Write-Host "Vos PV et votre endurance ont �t� augement� !" -ForegroundColor Yellow
            }
            elseif ($Chance -le 20)
            {
                Write-Host "L'amulette augemente votre chance !" -ForegroundColor Yellow
                $Script:CarChance += 20
            }
            elseif ($Chance -le 30)
            {
                StartEvent "JULTOR(Paradis)"
            }
            else
            {
                Write-Host "L'amulette vous octroie du pouvoir divin !" -ForegroundColor Yellow
                $Script:PV += 10
                Write-Host "Vos PV ont �t� augement�s !" -ForegroundColor Yellow
            }

            Write-Host "Apr�s cela, l'amulette se brise et tombe au sol" -ForegroundColor Red
            RemoveItem "Amulette lumineuse"
        }
        "Drogue du d�mon"
        {
            if ($BattleIsActive -eq $false)
            {
                Write-Host "Impossible d'utiliser cet objet dans cette situation" -ForegroundColor Yellow
            }
            else
            {
                $Script:BoostAttack = $true
                Write-Host "Votre attaque a �t� boost�e !" -ForegroundColor Yellow
                RemoveItem "Drogue du d�mon"
            }
        }
        "Peau armure"
        {
            if ($BattleIsActive -eq $false)
            {
                Write-Host "Impossible d'utiliser cet objet dans cette situation" -ForegroundColor Yellow
            }
            else
            {
                $Script:BoostDefense = $true
                Write-Host "Votre d�fense a �t� boost�e !" -ForegroundColor Yellow
                RemoveItem "Peau armure"
            }
        }
        "Bourse"
        {
            Write-Host "Vous ouvrez la bourse" -ForegroundColor Gray
            $value = Randomize 10 20
            Write-Host "Vous trouvez $value francs � l'interieur !" -ForegroundColor Yellow
            $Script:Argent += $value
            RemoveItem "Bourse"
        }
        "Grenade"
        {
            if ($BattleIsActive -eq $false)
            {
                Write-Host "Impossible d'utiliser cet objet dans cette situation" -ForegroundColor Yellow
            }
            else
            {
                $value = Randomize 200 400
                $Script:PVOpp -= $value
                Write-Host "Votre grenade explose devant l'ennemi !" -ForegroundColor Yellow
                Write-Host "Vous infligez $value d�gats � $NameOpp !" -ForegroundColor Green
                RemoveItem "Grenade"
            }
        }
        "Pilule �trange"
        {
            Write-Host "Vous avalez la pilule" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 10)
            {
                Write-Host "La pilule vous booste !" -ForegroundColor Yellow
                $Script:PV += 20
                $Script:CarEndurance += 2
                Write-Host "Vos PV et votre endurance ont �t� augement� !" -ForegroundColor Yellow
            }
            elseif ($Chance -le 20)
            {
                Write-Host "Vous vous sentez plus chanceux" -ForegroundColor Yellow
                $Script:CarChance += 20
            }
            elseif ($Chance -le 30)
            {
                Write-Host "Vous toussez fort... Vous vous �touffez..." -ForegroundColor Red
                LureDeath
            }
            else
            {
                Write-Host "La pilule vous booste !" -ForegroundColor Yellow
                $Script:CarInt += 3
                Write-Host "Votre intelligence augemente !" -ForegroundColor Yellow
            }
            RemoveItem "Pilule �trange"        
        }
        "Stimpack"
        {
            Write-Host "Vous vous plantez le stimpack dans le bras" -ForegroundColor Gray
            RegenLife ($PV / 3)
            RemoveItem "Stimpack"
        }
    }
}

function UseArtefact ($artefactname)
{
    switch ($artefactname)
    {
        "Bouteille de rhum orn�e"
        {
            if ($BattleIsActive -eq $false)
            {
                Write-Host "Vous buvez � la bouteille jusqu'� tombez raide bourr�" -ForegroundColor Yellow
                Write-Host "Vous vous relevez dans $ActualLocation"
                ActivateLocationEvent
            }
            else
            {
                Write-Host "Vous buvez un coup" -ForegroundColor Yellow
                $regen = Randomize 50 100
                RegenLife $regen
            }
        }
        "Masque de Luchador"
        {
            if ($BattleIsActive -eq $false)
            {
                Write-Host "Impossible d'utiliser cet objet dans cette situation" -ForegroundColor Yellow
            }
            else
            {
                Write-Host "Vous enfilez le masque et ressentez une grande force !" -ForegroundColor Yellow
                Write-Host "Votre attaque a �t� boost�e !" -ForegroundColor Yellow
                Write-Host "Votre d�fense a �t� boost�e !" -ForegroundColor Yellow
                $Script:BoostAttack = $true
                $Script:BoostDefense = $true
                $Script:TimeBoostAttack = 1
                $Script:TimeBoostDefense = 1
            } 
        }
        "Compte WOW de farm"
        {
            if ($BattleIsActive -eq $false)
            {
                Write-Host "Vous farmer plusieurs heures pour gagnez de l'argent !" -ForegroundColor Yellow
                $value = Randomize 3 10
                Write-Host "Vous gagnez $value francs !" -ForegroundColor Yellow
                $Script:Argent += $value
                DamageLife 8
            }
        }
        "Paquet de donn�es"
        {
            if ($BattleIsActive -eq $false)
            {
                Write-Host "Impossible d'utiliser cet objet dans cette situation" -ForegroundColor Yellow
            }
            else
            {
                Write-Host "00101010101010110101010101101010" -ForegroundColor Black -BackgroundColor White
                Start-Sleep -Milliseconds 500
                Write-Host "10101010101010101101010101101011" -ForegroundColor Black -BackgroundColor White
                Start-Sleep -Milliseconds 500
                Write-Host "00101010101010010111010110101010" -ForegroundColor Black -BackgroundColor White
                Start-Sleep -Milliseconds 500
                Write-Host "00110101111101010101011101010001" -ForegroundColor Black -BackgroundColor White
                Start-Sleep 1
                Write-Host "Votre armure augemente de 200 !" -ForegroundColor Green
                $Script:BoostArmorValue += 200
                $Script:PlayerDefend = $true

            }
        }
        "Routeur / Firefeu"
        {
            if ($BattleIsActive -eq $false)
            {
                Write-Host "Impossible d'utiliser cet objet dans cette situation" -ForegroundColor Yellow
            }
            else
            {
                if ($TurnCount -gt 3)
                {
                    $Script:TurnCount = 0
                    Write-Host "Vous brandissez le routeur / firefeu !" -ForegroundColor Yellow
                    Write-Host "Un �clair apparait et vous frappe ainsi que votre adversaire !" -ForegroundColor Yellow
                    RegenLife 100
                    Write-Host "Vous infligez 100 d�gats � $NameOpp !" -ForegroundColor Green
                    $Script:PVOpp -= 100
                }
                else
                {
                    Write-Host "Le routeur / firefeu semble n'avoir pas assez de charge �lectrique..." -ForegroundColor Gray
                }
            }
        }
        "Magazine �trange"
        {
            if ($BattleIsActive -eq $false)
            {
                Write-Host "Impossible d'utiliser cet objet dans cette situation" -ForegroundColor Yellow
            }
            else
            {
                if ($TurnCount -gt 6)
                {
                    Write-Host "Le contenu du magazine ne sera pas d�voil� � vos yeux de joueurs... D�sol�..." -ForegroundColor Gray
                    Write-Host "Le magazine vous encourage !" -ForegroundColor Yellow
                    PlayerTurn
                    PlayerTurn
                }
            }
        }
    }

}