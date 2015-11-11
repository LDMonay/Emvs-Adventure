# Variables
[string]$ActualLocation = "Hall d'entrée"

function MoveTo ($location) {
    if ($DATALOCATIONS_ZONE1.Contains($location) -eq $true)
    {
        Write-Host "Vous vous déplacer jusqu'à $location..." -ForegroundColor Magenta
        $Script:ActualLocation = $location
        ActivateLocationEvent
    }
    else
    {
        Write-Host "Lieu inexistant, Annulation" -ForegroundColor Red
    }
}

function WhereAmI () {
    Write-Host "Vous vous trouvez dans $ActualLocation" -ForegroundColor Cyan 
}

function LocationEvent ($location) {
    switch ($location)
    {
        "Hall d'entrée"
		{
            Write-Host "Vous arrivez dans une grande pièce bien éclairée" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 50)
            {
                StartEvent "Eleve"
            }
            elseif ($Chance -le 80)
            {
                StartEvent "Selecta"
            }
            elseif ($Chance -le 100)
            {
                StartEvent "Boulangerie"
            }
		}
		"Couloir"
		{
		    Write-Host "Vous avancez dans un couloir faiblement éclairé" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 20)
            {
                StartEvent "Eleve"
            }
            elseif ($Chance -le 40)
            {
                StartEvent "Prof"
            }
            elseif ($Chance -le 45)
            {
                StartEvent "DIM"
            }
            elseif ($Chance -le 60)
            {
                StartEvent "Selecta"
            }
            elseif ($Chance -le 70)
            {
                Write-Host "Il n y a rien d'intéressant ici..." -ForegroundColor Gray
            }
            elseif ($Chance -le 100)
            {
                StartEvent "Caid"
            }
		}
		"Cafeteria"
		{
		    Write-Host "Vous arrivez dans la cafeteria" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 20)
            {
                StartEvent "Eleve"
            }
            elseif ($Chance -le 35)
            {
                StartEvent "Sonia"
            }
            elseif ($Chance -le 100)
            {
                StartEvent "Selecta"
            }
		}
		"Salle de classe"
		{
		    Write-Host "Vous arrivez dans une salle de classe" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 20)
            {
                StartEvent "Eleve"
            }
            elseif ($Chance -le 50)
            {
                StartEvent "Prof"
            }
            elseif ($Chance -le 60)
            {
                Write-Host "Il n y a rien d'intéressant ici..." -ForegroundColor Gray
            }
            elseif ($Chance -le 65)
            {
                StartEvent "YANFON"
            }
            elseif ($Chance -le 80)
            {
                StartEvent "Backpack"
            }
            elseif ($Chance -le 100)
            {
                StartEvent "HDD"
            }
		}
		"Ascenseur"
		{
		    Write-Host "Vous rentrez dans l'ascenseur" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 10)
            {
                StartEvent "Trap"
            }
            elseif ($Chance -le 20)
            {
                StartEvent "ANTGEN"
            }
            elseif ($Chance -le 70)
            {
                Write-Host "Il n y a rien d'intéressant ici..." -ForegroundColor Gray
            }
            elseif ($Chance -le 100)
            {
                StartEvent "BloodTrade"
            }
		}
		"Camion étrange"
		{
		    Write-Host "Vous rentrez dans un camion fort étrange" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 20)
            {
                StartEvent "Trap"
            }
            elseif ($Chance -le 30)
            {
                StartEvent "TREX"
            }
            elseif ($Chance -le 70)
            {
                Write-Host "Il n y a rien d'intéressant ici..." -ForegroundColor Gray
            }
            elseif ($Chance -le 75)
            {
                StartEvent "BloodTrade"
            }
            elseif ($Chance -le 85)
            {
                StartEvent "BASPOT"
            }
            elseif ($Chance -le 100)
            {
                StartEvent "CRATE"
            }
		}
		"Salle de gestion de projet"
		{
		    Write-Host "Vous rentrez dans une salle alloué à la gestion de projet" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 10)
            {
                StartEvent "Trap"
            }
            elseif ($Chance -le 40)
            {
                StartEvent "HDD"
            }
            elseif ($Chance -le 45)
            {
                StartEvent "ALAALB"
            }
            elseif ($Chance -le 70)
            {
                StartEvent "Prof"
            }
            else
            {
                Write-Host "Il n y a rien d'intéressant ici..." -ForegroundColor Gray
            }
		}
		"Reserve"
		{
		    Write-Host "Vous rentrez dans une pièce peu éclairée... la réserve..." -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 40)
            {
                StartEvent "Trap"
            }
            elseif ($Chance -le 80)
            {
                StartEvent "CRATE"
            }
            elseif ($Chance -le 85)
            {
                StartEvent "JOHVER"
            }
            else
            {
                Write-Host "Il n y a rien d'intéressant ici..." -ForegroundColor Gray
            }
		}
		"Toilette Homme"
		{
		    Write-Host "Vous arrivez dans les toilettes pour homme" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 50)
            {
                StartEvent "Eleve"
            }
            elseif ($Chance -le 55)
            {
                StartEvent "Prof"
            }
            else
            {
                Write-Host "Il n y a rien d'intéressant ici..." -ForegroundColor Gray
            }	
		}
		"Toilette Femme"
		{
		    Write-Host "Vous arrivez dans les toilettes pour femme" -ForegroundColor Gray
			[int]$Chance = Randomize 0 100
			if ($Chance -le 50)
            {
                StartEvent "Eleve(F)"
            }
            elseif ($Chance -le 75)
            {
                StartEvent "Furie"
            }
            else
            {
                Write-Host "Il n y a rien d'intéressant ici..." -ForegroundColor Gray
            }		
		}
        "Exterieur"
        {
            Write-Host "Vous vous trouvez à l'exterieur du batiment" -ForegroundColor Gray
            [int]$Chance = Randomize 0 100
			if ($Chance -le 50)
            {
                StartEvent "VendeurPizza"
            }
            elseif ($Chance -le 70)
            {
                StartEvent "Eleve"
            }
            elseif ($Chance -le 80)
            {
                Write-Host "Il n y a rien d'intéressant ici..." -ForegroundColor Gray
            }
            else
            {
                StartEvent "FABCOP"
            }
        }
    }
}
