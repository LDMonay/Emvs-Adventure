# Variables globales

[bool]$BattleIsActive = $false # Variable traquant si la bataille doit se terminer, ou pas
[int]$PlayerArmor = 0 # Armure passive du joueur (est retranché à l'attaque de son adversaire)
[bool]$PlayerDefend = $false # Variable traquant si le joueur se défend
[int]$BoostArmorValue = 0 # Valeur d'armure supplémentaire
[int]$TurnCount = 0 # Nombre de tour
[int]$MinDegatOpp = 0 # Dégat minimum de l'adversaire
[int]$MaxDegatOpp = 10 # Dégat maximum de l'adversaire
[int]$PVOpp = 100 # PV Adversaire
[int]$OppXP = 100 # XP gagné pour avoir tué l'adversaire
[string]$NameOpp = "Une créature" # Nom affiché de l'adversaire
[bool]$PlayerIsAway = $false # Variable traquant si le joueur s'est enfuit
[bool]$LackAttack = $false # Variable traquant si un debuf d'attaque est actif
[int]$TimeLackAttack = 0 # Variable traquant le temps restant au débuf
[bool]$LackDefense = $false # Variable traquant si un debuf de defense est actif
[int]$TimeLackDefense = 0 # Variable traquant le temps restant au débuf
[bool]$BoostAttack = $false # Variable traquant si un Buff d'attaque est actif
[int]$TimeBoostAttack = 0 # Variable traquant le temps restant au Buff
[bool]$BoostDefense = $false # Variable traquant si un buff de défense
[int]$TimeBoostDefense = 0 # Variable traquant le temps restant au Buff

# Fonction Permettant de reset les valeurs avant un prochain combat
function ResetValue ()
{
    $Script:BattleIsActive = $false
    $Script:PlayerArmor = 0
    $Script:PlayerDefend = $false
    $Script:BoostArmorValue = 0
    $Script:TurnCount = 0
    $Script:MinDegatOpp = 0
    $Script:MaxDegatOpp = 10
    $Script:PVOpp = 100
    $Script:NameOpp = "Une créature"
    $Script:PlayerIsAway = $false
    $Script:OppXP = 100
    $Script:LackAttack = $false
    $Script:LackDefense = $false
    $Script:BoostAttack = $false
    $Script:BoostDefense = $false
    $Script:TimeBoostDefense = 0
    $Script:TimeLackAttack = 0
    $Script:TimeLackDefense = 0
    $Script:TimeBoostAttack = 0
}

# Fonction de combat
function StartBattle ($DegatMinOpp, $DegatMaxOpp, $OppPV, $OppXP, $OppName) 
{
    ResetValue
    # Test conditionel pour empécher certaines erreur d'arriver
    if ($DegatMinOpp -eq $null)
    {
        Write-Host "ERREUR : DEMMARAGE DU COMBAT IMPOSSIBLE, INFORMATIONS MANQUANTES" -ForegroundColor Red
    }
    elseif ($DegatMaxOpp -eq $null)
    {
        Write-Host "ERREUR : DEMMARAGE DU COMBAT IMPOSSIBLE, INFORMATIONS MANQUANTES" -ForegroundColor Red
    }
    elseif ($OppPV -eq $null)
    {
        Write-Host "ERREUR : DEMMARAGE DU COMBAT IMPOSSIBLE, INFORMATIONS MANQUANTES" -ForegroundColor Red
    }
    else
    {
        # On définit les variables
        $Script:BattleIsActive = $true
        $Script:MinDegatOpp = $DegatMinOpp
        $Script:MaxDegatOpp = $DegatMaxOpp
        $Script:PVOpp = $OppPV
        $Script:PlayerArmor = $ArmurePJ

        if ($OppName -ne $null)
        {
            $Script:NameOpp = $OppName
        }
        if ($OppAttr -ne $null)
        {
            $Script:AttrOpp = $OppAttr
        }
        
        # Boucle de combat
        while ($BattleIsActive -eq $true)
        {
            cls

            if ($PlayerDefend -eq $true)
            {
                # Rétablit l'armure aux valeur de départ au début du tour
                Write-Host "Votre armure revient à son niveau normal..." -ForegroundColor Gray
                $Script:PlayerDefend = $false
                $Script:BoostArmorValue = 0
                echo ""
            }
            
            # Test permettant de comptez le temps restant au différents effet

            if ($LackDefense -eq $true) {$Script:TimeLackDefense--; if($TimeLackDefense -lt 0) {$Script:LackDefense = $false; Write-Host "Votre défense redevient normal..." -ForegroundColor Yellow; $Script:TimeLackDefense = 0; echo ""}}
            if ($LackAttack -eq $true) {$Script:TimeLackAttack--; if($TimeLackAttack -lt 0) {$LackAttack = $false; Write-Host "Votre attaque redevient normal..." -ForegroundColor Yellow; $Script:TimeLackAttack = 0; echo ""}}
            if ($BoostDefense -eq $true) {$Script:TimeBoostDefense--; if($TimeBoostDefense -lt 0) {$BoostDefense = $false; Write-Host "Votre défense redevient normal..." -ForegroundColor Yellow; $Script:TimeBoostDefense = 0; echo ""}} 
            if ($BoostAttack -eq $true) {$Script:TimeBoostAttack--; if($TimeBoostAttack -lt 0) {$BoostAttack = $false; Write-Host "Votre attaque redevient normal..." -ForegroundColor Yellow; $Script:TimeBoostAttack = 0; echo ""}}

            # Le tour du joueur commence concrétement

            PlayerTurn

            # Fin du tour du joueur

            $Script:TurnCount++

            # On fait un test pour savoir si l'adversaire est mort

            $Win = OppCheckDeath

            # Le combat se termine si l'adversaire est mort

            if ($Win -eq $true)
            {
                Write-Host "Vous avez vaincu $NameOpp !" -ForegroundColor Yellow
                XPGain $OppXP
                $Script:BattleIsActive = $false
                break
            }

            # Le combat se termine si le joueur réussit à fuir

            if ($PlayerIsAway -eq $true)
            {
                break
            }

            # Si l'adversaire n'est pas mort, c'est à son tour

            OppTurn
            pause
        }

    }
    
}

# Tour du joueur

function PlayerTurn () 
{
    Write-Host "[COMBAT] Que faire ?" -ForegroundColor Yellow
    Write-Host "(Attaquer / A ; Se défendre / D ; Magie / M ; Inventaire / I ; Tentez de fuir / F)" -ForegroundColor Gray
    $Todo = Read-Host
    # Réalise les différentes fonction suivant le choix du joueur
    if ($Todo -match "i")
    {
        InventoryMenu
    }
    elseif ($Todo -match "a")
    {
        PlayerAttack
    }
    elseif ($Todo -match "d")
    {
        PlayerDefend
    }
    elseif ($Todo -match "m")
    {
        PlayerMagic
    }
    elseif ($Todo -match "f")
    {
        PlayerRun
    }
    else
    {
        cls
        PlayerTurn
    }

}

# Fonction définissant l'attaque

function PlayerAttack ()
{
    echo ""
    Write-Host "[ATTAQUE] Que faire ?" -ForegroundColor Yellow
    Write-Host "(Attaque Légère / L ; Attaque Normal / A ; Attaque Critique / C)" -ForegroundColor Gray
    # Réalise les différentes fonction suivant le choix du joueur
    $Todo = Read-Host
    if ($Todo -match "L")
    {
        echo ""
        Write-Host "Vous lancez une attaque légère !" -ForegroundColor Cyan
        Write-Host "Vous attaquez avec $ArmeEquipe" -ForegroundColor Gray

        # Random des dégats (appliquant les différents buff / débuff)

        $Degat = (Randomize $DegatMin $DegatMax) / 2
        if($LackAttack -eq $true) { $Degat = $Degat / 2 }
        if($BoostAttack -eq $true) { $Degat = $Degat * 2 }
        # On retranche les dégats aux pv de l'adversaire
        $Script:PVOpp = $PVOpp - $Degat

        Start-Sleep 1

        # Random de l'armure (appliquant les différents buff / débuff)

        $Script:BoostArmorValue += ((Randomize $CarEndurance ($CarEndurance * 10)) / 2)
        if($LackDefense -eq $true) { $Script:BoostArmorValue = $BoostArmorValue / 2 }
        if($BoostDefense -eq $true) { $Script:BoostArmorValue = $BoostArmorValue * 2 }
        # On indique que le joueur se défend
        $Script:PlayerDefend = $true
        echo ""
        Write-Host "Vous augementez votre armure de $BoostArmorValue !" -ForegroundColor Green
        echo ""
        Write-Host "Vous infligez $Degat dégats à $NameOpp !" -ForegroundColor Green
    }
    elseif ($Todo -match "A")
    {
        echo ""
        Write-Host "Vous vous lancez à l'attaque !" -ForegroundColor Cyan
        Write-Host "Vous attaquez avec $ArmeEquipe" -ForegroundColor Gray

        # Random des dégats (appliquant les différents buff / débuff)

        $Degat = Randomize $DegatMin $DegatMax
        if($LackAttack -eq $true) { $Degat = $Degat / 2 }
        if($BoostAttack -eq $true) { $Degat = $Degat * 2 }
        # On retranche les dégats aux pv de l'adversaire
        $Script:PVOpp = $PVOpp - $Degat

        Start-Sleep 1

        echo ""
        Write-Host "Vous infligez $Degat dégats à $NameOpp !" -ForegroundColor Green
    }
    elseif (($Todo -match "C") -and ($LackAttack -eq $false)) # L'attaque peut être lancé uniquement si un débuf d'attaque n'est pas actif
    {
        echo ""
        Write-Host "Vous lancez une attaque CRITIQUE !" -ForegroundColor Cyan
        Write-Host "Vous attaquez avec $ArmeEquipe" -ForegroundColor Gray

        # Random des dégats (appliquant les différents buff / débuff)

        $Degat = (Randomize $DegatMin $DegatMax) * 2
        if($BoostAttack -eq $true) { $Degat = $Degat * 2 }
        # On retranche les dégats aux pv de l'adversaire
        $Script:PVOpp = $PVOpp - $Degat
        $Script:LackAttack = $true
        $Script:TimeLackAttack = 2
        Start-Sleep 1
        echo ""
        Write-Host "Vous infligez $Degat dégats à $NameOpp !" -ForegroundColor Green
        echo ""
        Write-Host "Votre capacité à attaquer est diminuée !" -ForegroundColor Red
    }
    else
    {
        echo ""
        Write-Host "Vous n'arrivez pas à attaquer !" -ForegroundColor Red
        Start-Sleep 1
    }
}

# Fonction de magie

function PlayerMagic ()
{





}

 
function PlayerDefend ()
{
    echo ""
    Write-Host "[DEFENSE] Que faire ?" -ForegroundColor Yellow
    Write-Host "(Restauration / R ; Défense normal / D ; Défense critique / C)" -ForegroundColor Gray
    $Todo = Read-Host
    if ($Todo -match "r")
    {
        Write-Host "Vous vous préparez à vous réstaurer !" -ForegroundColor Cyan

        # Random de l'armure (appliquant les différents buff / débuff)

        $Script:BoostArmorValue += ((Randomize $CarEndurance ($CarEndurance * 10)) / 2)
        if($LackDefense -eq $true) { $Script:BoostArmorValue = $BoostArmorValue / 2 }
        if($BoostDefense -eq $true) { $Script:BoostArmorValue = $BoostArmorValue * 2 }

        # Random de la regen

        $regenvalue = Randomize ($CarInt) ($CarInt * 3)
        Regenlife $regenvalue

         # On indique que le joueur se défend
        $Script:PlayerDefend = $true
        Start-Sleep 1
        echo ""
        Write-Host "Vous augementez votre armure de $BoostArmorValue !" -ForegroundColor Green
    }
    elseif ($Todo -match "d")
    {
        Write-Host "Vous vous préparez à vous défendre !" -ForegroundColor Cyan

        # Random de l'armure (appliquant les différents buff / débuff)

        $Script:BoostArmorValue += Randomize $CarEndurance ($CarEndurance * 10)
        if($LackDefense -eq $true) { $Script:BoostArmorValue = $BoostArmorValue / 2 }
        if($BoostDefense -eq $true) { $Script:BoostArmorValue = $BoostArmorValue * 2 }
        # On indique que le joueur se défend
        $Script:PlayerDefend = $true
        Start-Sleep 1
        echo ""
        Write-Host "Vous augementez votre armure de $BoostArmorValue !" -ForegroundColor Green
    }
    elseif (($Todo -match "c") -and ($LackDefense -eq $false))
    {
        Write-Host "Vous vous préparez à une défense CRITIQUE !" -ForegroundColor Cyan

        # Random de l'armure (appliquant les différents buff / débuff)

        $Script:BoostArmorValue += (Randomize $CarEndurance ($CarEndurance * 10)) * 2
        if($BoostDefense -eq $true) { $Script:BoostArmorValue = $BoostArmorValue * 2 }
        # On indique que le joueur se défend
        $Script:PlayerDefend = $true
        $Script:LackDefense = $true
        $Script:TimeLackDefense = 2
        Start-Sleep 1
        echo ""
        Write-Host "Vous augementez votre armure de $BoostArmorValue !" -ForegroundColor Green
        echo ""
        Write-Host "Votre capacité à vous défendre est diminuée !" -ForegroundColor Red
    }
    else
    {
        echo ""
        Write-Host "Vous n'arrivez pas à vous défendre !" -ForegroundColor Red
        Start-Sleep 1
    }
}

# Fonction permettant de fuir

function PlayerRun ()
{
    echo ""
    Write-Host "Vous tentez de fuir !" -ForegroundColor Yellow
    [int]$difficulty = 100 - $CarChance
    $run = TryAction $difficulty 0
    if ($run -eq $true)
    {
        $Script:PlayerIsAway = $true
        Write-Host "Vous vous êtes enfui du combat !" -ForegroundColor Cyan
        $Script:CarChance = $CarChance - 2
        if ($CarChance -le 0)
        {
            $Script:CarChance = 0
        }

        Write-Host "Votre chance a baissée jusqu'à $CarChance % !" -ForegroundColor DarkYellow
    }
    else
    {
        Write-Host "Vous n'avez pas réussi à fuir !" -ForegroundColor Cyan
        $Script:CarChance = $CarChance - 4
        if ($Chance -le 0)
        {
            $Script:Chance = 0
        }

        Write-Host "Votre chance a baissée jusqu'à $CarChance % !" -ForegroundColor DarkYellow
    }
}

# Tour de l'adversaire

function OppTurn ()
{
    echo ""
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

function OppCheckDeath ()
{
    $dead = $false
    if ($PVOpp -lt 0)
    {
        $dead = $true
    }
    return $dead
}