# Variables générales
[int]$ResultTest = 0
[int]$Level = 1
[int]$XP = 0
[int]$CarInt = 0
[int]$CarForce = 0
[int]$CarEndurance = 0
[int]$CarChance = 0
[int]$DegatMinB = 0
[int]$DegatMaxB = 0
[int]$DegatMin = 0
[int]$DegatMax = 0
[int]$PV = 0
[int]$PVActu = 0
[int]$PM = 0
[int]$PMActu = 0
[double]$Argent = 0
[string]$Nom = "Initialise"
[string]$FilePath = $PSScriptRoot
[string[]]$Inventaire = @("Coca-Cola","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien")
[string[]]$KnownSpell = @("Lifetap","Scan","Fireball","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien","Rien")
[string]$ArmeEquipe = "Poings"
[string]$ArmureEquipe = "T-shirt"
[int]$ValArmure = 5
[int]$ArmurePJ = 0
[int]$BonusArmeMin = 0
[int]$BonusArmeMax = 0
[int]$ZoneActu = 1
[string]$Location1 = RandomLocations
[string]$Location2 = RandomLocations

function NewPlayer {
    $Script:CarInt = Randomize 6 12
    $Script:CarForce = Randomize 6 12
    $Script:CarEndurance = Randomize 6 12
    $Script:CarChance = Randomize 25 80
    $Script:DegatMinB = Randomize 10 30 + $CarForce
    $Script:DegatMaxB = Randomize 10 30
    $Script:DegatMaxB = $DegatMaxB + $DegatMinB + $CarForce
    $Script:DegatMin = $DegatMinB + $BonusArmeMin
    $Script:DegatMax = $DegatMaxB + $BonusArmeMax
    $Script:ArmurePJ = $CarEndurance + $ValArmure
    $Script:Argent = Randomize 10 50
    [double]$Centimes = (Randomize 1 99) / 10
    $Script:Argent = $Argent + $Centimes
    $Script:PV = Randomize 100 200
    $Script:PV = $PV + $CarEndurance
    $Script:PVActu = $PV
    $Script:PM = Randomize 20 60
    $Script:PM = $PM + $CarInt
    $Script:PMActu = $PM
    [int]$idxNom = Randomize 0 $DATANAMES.Length
    $Script:Nom = $DATANAMES[$idxNom]
    [int]$idxNom = Randomize 0 $DATAFNAMES.Length
    $Script:Nom += " " + $DATAFNAMES[$idxNom]
      
}

function CalculateStats {
    $Script:DegatMin = $DegatMinB + $BonusArmeMin
    $Script:DegatMax = $DegatMaxB + $BonusArmeMax
    $Script:ArmurePJ = $CarEndurance + $ValArmure
}

function CheckXP {
    if ($XP -ge (1000 * $Level))
    {
        $Script:XP = 0
        LevelUp
    }
}

function XPGain ($xpgagne)
{
    $Script:XP = $XP + $xpgagne
    CheckXP
}

function LevelUp {
    $Script:Level++
    Write-Host "Félicitations ! Vous venez de montez niveau $Level !" -ForegroundColor Black -BackgroundColor Yellow
    $Script:CarInt += 1
    $Script:CarForce += 1
    $Script:CarEndurance += 1
    $Script:CarChance += 10
    $Script:PV += Randomize 30 60 + $CarEndurance
    $Script:PM += Randomize 1 20 + $CarInt
    $Script:DegatMinB += Randomize 1 10
    $Script:DegatMaxB += Randomize 2 20
    if ($DegatMaxB -lt $DegatMinB)
    {
        $DegatMaxB = $DegatMinB++
    }
    CalculateStats

}