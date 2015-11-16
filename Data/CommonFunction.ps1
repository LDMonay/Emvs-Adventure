# Fonctions
function PlayTitle () {
    Write-Host "                                                                                    "  -ForegroundColor Red
    Write-Host "         ████████████  ██████     ████  █████   █████   ████████                    "  -ForegroundColor Red
    Start-Sleep -Milliseconds 100
    Write-Host "          ██████████    ████     ████    ███     ███   ██████████   █▌              "  -ForegroundColor Red
    Start-Sleep -Milliseconds 100
    Write-Host "         ███           █████    █████    ███    ███    ████     █   ██▌             "  -ForegroundColor Red
    Start-Sleep -Milliseconds 100
    Write-Host "  ___╔═══████████══════██████═██████═════███════███════████══════════██▄▄▄▄▄▄▄▄▄▀█  "  -ForegroundColor Red
    Start-Sleep -Milliseconds 100
    Write-Host " ║------████████------███-██████-███-----███---███------██████------██║▒║▒║▒║▒║▒║▌  "  -ForegroundColor Red
    Start-Sleep -Milliseconds 100
    Write-Host "  ¯¯¯╚══███═══════════███══████══███══════███══███══════════███══════██▀▀▀▀▀▀▀▀▀▄█  "  -ForegroundColor Red
    Start-Sleep -Milliseconds 100
    Write-Host "       ███           ███        ███       ███ ███    ██     ███     ██▌             "  -ForegroundColor Red
    Start-Sleep -Milliseconds 100
    Write-Host "       ███████████   ███        ███       ██████     ██████████     █▌              "  -ForegroundColor Red
    Start-Sleep -Milliseconds 100
    Write-Host "      ███████████   █████      █████       ████       ████████                      "  -ForegroundColor Red
    Write-Host "                                                                                    "  -ForegroundColor Red
    Write-Host "EMVS Adventure  v0.85b"
    Start-Sleep 2
    cls
}

function BarAffichage($Total, $Partiel,$BackgroundColor,$ForegroundColor){

    $iNbCharacters = 51

    <# Affichage de la barre #>

    $nbFoisRepeat = [System.Math]::Round($Partiel * $iNbCharacters / $Total)
    
    for($index = 0; $index -lt $nbFoisRepeat; $index++){
        $lfBar += "█"
    }

    for($index = 0; $index -lt $iNbCharacters - $nbFoisRepeat; $index++){
        $lfBar += " "
    }
    Write-Host $lfBar -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor
}

function InfoPlayer () {
    cls
    <#
        Affichage de la barre de vie
    #>

    Write-Host "====================================================" -ForegroundColor Yellow
    Write-Host "            Barre de vie / Barre d'xp" -ForegroundColor Yellow
    Write-Host "====================================================" -ForegroundColor Yellow

    BarAffichage -Total $PV -Partiel $PVActu -BackgroundColor "Red" -ForegroundColor "Green"

    BarAffichage -Total (1000 * $Level) -Partiel $XP -BackgroundColor "DarkCyan" -ForegroundColor "Cyan"

    Write-Host "====================================================" -ForegroundColor Yellow

    <# Affichage du personnage #>

    Write-Host "Vous êtes $Nom"
    Write-Host "Vous êtes Niveau $Level"
    Write-Host "Vous avez une intelligence de $CarInt"
    Write-Host "Vous avez une force de $CarForce" 
    Write-Host "Vous avez une endurance de $CarEndurance"
    Write-Host "Vous avez environ $CarChance % de chance"
    Write-Host "Vous pouvez faire de $DegatMinB jusqu'a $DegatMaxB dégats de base"
    Write-Host "Avec votre arme, vous pouvez faire $DegatMin jusqu'à $DegatMax dgt"
    Write-Host "Vous avez une armure de $ArmurePJ"
    Write-Host "Vous avez $PMActu PM"
    Write-Host "Vous avez $PM PM max"
    Write-Host "Vous avez $PV point de vie de base"
    Write-Host "Vous avez actuellement $PVActu points de vie"

    WhereAmI
    
    Write-Host "====================================================" -ForegroundColor Yellow
}

function InfoInventaire () {
    echo "Vous avez $Argent francs dans votre portefeuille"
    echo "Vous vous battez avec $ArmeEquipe"
    echo "Vous êtes equippé de $ArmureEquipe"
    echo "Votre armure vous confère un bonus de $ValArmure points d'armure"
    echo ""
    Write-Host "==============================" -ForegroundColor Yellow
    Write-Host " Contenu de votre Inventaire  " -ForegroundColor Yellow
    Write-Host "==============================" -ForegroundColor Yellow
    for ($idx = 0; $idx -lt $Inventaire.Length; $idx++)
    {
        if ($Inventaire[$idx] -ne "Rien")
        {
            $val1 = $Inventaire[$idx]
            echo "- [$idx] $val1" 
        }
    }
}

function ActionMenu () {
    echo ""
    Write-Host "[MENU] Que faire ?" -ForegroundColor Yellow
    Write-Host "(Inventaire / I ; Status / S ; Magie / M ; Se déplacer / D ; Quitter / Q)" -ForegroundColor Gray
    $Todo = Read-Host
    if ($Todo -match "i")
    {
        InventoryMenu
        ActionMenu
    }
    elseif ($Todo -match "s")
    {
        InfoPlayer
        ActionMenu
    }
    elseif ($Todo -match "m")
    {
        MagicMenu
        ActionMenu
    }
    elseif ($Todo -match "d")
    {
        MoveMenu
        ActionMenu
    }
        elseif ($Todo -match "Q")
    {
        QuitPrompt
        ActionMenu
    }
    else
    {
        cls
        ActionMenu
    }
}

function MagicMenu () {
    cls
    Write-Host "====================================================" -ForegroundColor Yellow
    Write-Host "                     Barre de PM" -ForegroundColor Yellow
    Write-Host "====================================================" -ForegroundColor Yellow

    BarAffichage -Total $PM -Partiel $PMActu -BackgroundColor "DarkMagenta" -ForegroundColor "Magenta"

    Write-Host "====================================================" -ForegroundColor Yellow
    Write-Host "                     Sorts Connus " -ForegroundColor Yellow
    Write-Host "====================================================" -ForegroundColor Yellow
    for ($idx = 0; $idx -lt $KnownSpell.Length; $idx++)
    {
        if ($KnownSpell[$idx] -ne "Rien")
        {
            $val1 = $KnownSpell[$idx]
            echo "- [$idx] $val1"
        }
    }
    echo ""
    Write-Host "[MAGIE] Utiliser un sort ?" -ForegroundColor Yellow
    Write-Host "(Numéro du sort / N pour annuler)" -ForegroundColor Gray
    $Todo = Read-Host
    if ($Todo -match "n")
    {
        cls
        echo "Annulation"
    }
    elseif ($Todo -ge 0)
    {
        cls
        UseSpell ($KnownSpell[$Todo])
    }
    else
    {
        cls
        MagicMenu
    }
}


function MoveMenu () {
    cls
    WhereAmI
    echo ""
    Write-Host "[DEPLACEMENT] Que faire ?" -ForegroundColor Yellow
    Write-Host "(Se déplacer vers $Location1 / D1 ; Se déplacer vers $Location2 / D2 ; Annuler / N)" -ForegroundColor Gray
    $Todo = Read-Host
    if ($Todo -match "n")
    {
        cls
        echo "Annulation"
    }
    elseif ($Todo -match "D1")
    {
        cls
        MoveTo $Location1
        $Script:Location1 = RandomLocations
        $Script:Location2 = RandomLocations
    }
    elseif ($Todo -match "D2")
    {
        cls
        MoveTo $Location2
        $Script:Location1 = RandomLocations
        $Script:Location2 = RandomLocations
    }
    else
    {
        MoveMenu
    }
}

function InventoryMenu () {
    cls
    InfoInventaire
    echo ""
    Write-Host "[INVENTAIRE] Que faire ?" -ForegroundColor Yellow
    Write-Host "(Utiliser / U ; Déséquiper arme / D ; Jetez objet / J ; Annuler / N)" -ForegroundColor Gray
    $Todo = Read-Host
    if ($Todo -match "n")
    {
        cls
        echo "Annulation"
    }
    elseif ($Todo -match "u")
    {
        UseInventoryItem
    }
    elseif ($Todo -match "d")
    {
        InventoryUnequip
    }
    elseif ($Todo -match "j")
    {
        DumpInventoryItem
    }
    else
    {
        InventoryMenu
    }

}

function UseInventoryItem () {
    $UseItem = Read-Host "Utiliser un objet ? (numéro de l'objet ou N pour annuler)"
    echo ""
    if ($UseItem -match "N"){echo "Annulation"}
    elseif ([int]$UseItem -le $Inventaire.Length)
    {
        if ([int]$UseItem -ge 0)
        {
            cls
            Use $Inventaire[$UseItem]
        }
    }
    else 
    {
        cls
        Write-Host "Objet inexistant, Annulation" -ForegroundColor Red
    }
}

function InventoryUnequip () {
    if ($ArmeEquipe -ne "Poings")
    {
        echo "Désequiper $ArmeEquipe ?"
        $Unequip = ConfirmCommand
        if ($Unequip -eq $true)
        {
            cls
            AddItem $ArmeEquipe
            Unequip
        }
    }
    else
    {
        cls
        Write-Host "Pas d'arme équipée, Annulation" -ForegroundColor Red
    }

}

function ForceInventoryUnequip () {
    if ($ArmeEquipe -ne "Poings")
    {
        AddItem $ArmeEquipe
        Unequip
    }
}

function DumpInventoryItem () {
    $UseItem = Read-Host "Jetez un objet ? (numéro de l'objet ou N pour annuler)"
    echo ""
    if ($UseItem -match "N"){echo "Annulation"}
    elseif ([int]$UseItem -le 10)
    {
        if ([int]$UseItem -ge 0)
        {
            $Dump = ConfirmCommand
            if ($Dump -eq $true)
            {
                cls
                RemoveItem $Inventaire[$UseItem]
            }
            else 
            {
                cls
                InventoryMenu
            }
        }
        else 
        {
            cls
            Write-Host "Objet inexistant, Annulation" -ForegroundColor Red
        }
    }
    else {
        cls
        Write-Host "Objet inexistant, Annulation" -ForegroundColor Red
    }

}

function Randomize ($min, $max) {

    [int]$Gen = Get-Random -Maximum $max -Minimum $min
    return ,$Gen
}

function TryAction ($Difficulty, $Bonus) {
    [bool]$Victory = $false
    $Result = Randomize 1 100
    $Result = $Result + $Bonus
    $Script:ResultTest = $Result
    if ($Result -ge $Difficulty)
    {
        [bool]$Victory = $true;
    }
    return ,$Victory
}

function SelectFilePath () {
    [string]$FilePath = Read-Host 'Chemin du fichier (Relatif ou Absolu)'
    IF ($FilePath -eq "") {SelectFilePath}
}

function ConfirmCommand () {
    [bool]$value = $false
    [string]$confirm = Read-Host "Veuillez confirmer l'action (Oui / Non)"
    if ($confirm -match 'Oui') {
        [bool]$value = $true
    }
    elseif ($confirm -match 'Non') {
        [bool]$value = $false
    }
    elseif ($confirm -match 'N') {
        [bool]$value = $false
    }
    elseif ($confirm -match 'O') {
        [bool]$value = $true
    }
    else {
        [bool]$value = ConfirmCommand
    }
    return ,$value
}

function QuitPrompt () {
    cls
    Write-Host "Sauvegarder ?" -ForegroundColor Yellow
    $confirm = ConfirmCommand
    if ($confirm -eq $true)
    {
        SavePrompt
    }
    Write-Host "Quitter ?" -ForegroundColor Yellow
    $confirm = ConfirmCommand
    if ($confirm -eq $true)
    {
        exit
    }
    cls
}