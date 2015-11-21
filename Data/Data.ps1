# Arrays

[string[]]$DATANAMES = "Julien","Robin","Paul","Philippe","Snape","Dumbledor","Bru","Menendez","Arnaud","Fabien","Loïc","Douglas","Jonathan","Dario","Elie","Marc","Jules","Claire","Eric","Sacha","Micheal","Vladimir","Dimitiriev","Pavlov","Henri","Valais","Magi","Carp","Gérard","Hornet","JQUERY","#ImCool","Klign","Loki","Vulpix","Tad","Mok","Yuri","Spock","ERROR_NOT_FOUND","Bruce","Blue","Red","Yellow","Davis","Glairon","AEIOUY","Luther","Tyrone","FAZECLAN","Ptolémhé","Christopher","GrouGrou","Hopi","Windows","Steve","Adolf"
[string[]]$DATAFNAMES = "Horis","Mangoulin","Severus","Albus","Galio","Fir","Mendez","Donnet","Monay","Regulus","Miro","Urdnot","Wrex","Garus","Shepard","Doc","Blue","Green","Lancer","Archer","Dlog","JAVASCRIPT","Nguyen","Gatorade","Select * from tbl","Densetsu","Yellow","Ant","Bull","Fremdi","Ghandi","Nizzard","Xeon","Zlorig","Bioukli","Stackoverflow","Wayne","Sanders","Geneva","BloupBloup","Kleiner","Klein","Ophrio","KGB","LutinVert","YOLO","MLG","Girrard","Tyranus","Lee","Mecanivel","Horilop","CANTTOUCHTHIS","Skrillex","Jobs","Titler"

[string[]]$DATAFOOD_RARITY1 = "Coca-Cola","Bière","Pizza margarita","Pizza proscuitto","Pizza au thon","Sandwich au jambon","Sprite","Steak de lion","Kit-Kat","Twix","Sandwich viande séchée","Menu étudiant"
[string[]]$DATAFOOD_RARITY2 = ""
[string[]]$DATAFOOD_RARITY3 = ""
[string[]]$DATAFOOD_RARITY4 = ""
[string[]]$DATAFOOD_RARITY5 = ""

[string[]]$DATAWEAPONS_RARITY1 = "Baton","Batte de baseball","Couteau à cran d'arrêt","Planche cloutée","Pierre","Massue","Scie circulaire","Thon gelé","Hachoir","Grosse baguette","Couteau papillion","Fouet","Cravache","Levier de vitesse"
[string[]]$DATAWEAPONS_RARITY2 = ""
[string[]]$DATAWEAPONS_RARITY3 = ""
[string[]]$DATAWEAPONS_RARITY4 = ""
[string[]]$DATAWEAPONS_RARITY5 = ""

[string[]]$DATAARTEFACT = "Bouteille de rhum ornée","Masque de Luchador","Compte WOW de farm","Routeur / Firefeu","Magazine étrange","Paquet de données"

[string[]]$DATACOMMONS_RARITY1 = "Amulette obscure","Amulette lumineuse","Bourse","Pilule étrange","Stimpack"
[string[]]$DATACOMMONS_RARITY2 = "Drogue du démon","Peau armure","Grenade"
[string[]]$DATACOMMONS_RARITY3 = ""
[string[]]$DATACOMMONS_RARITY4 = ""
[string[]]$DATACOMMONS_RARITY5 = ""

[string[]]$DATAARMOR_RARITY1 = "T-shirt renforcé","Doudoune résistante","Veston de cuir","Armure en plastique","Costume de Thor"
[string[]]$DATAARMOR_RARITY2 = ""
[string[]]$DATAARMOR_RARITY3 = ""
[string[]]$DATAARMOR_RARITY4 = ""
[string[]]$DATAARMOR_RARITY5 = ""

[string[]]$DATALOCATIONS_ZONE1 = "Hall d'entrée","Exterieur","Couloir","Cafeteria","Salle de classe","Ascenseur","Camion étrange","Salle de gestion de projet","Reserve","Toilette Homme","Toilette Femme","Porte de la Zone 1"
[string[]]$DATALOCATIONS_ZONE2 = "Porte de la Zone 2"
[string[]]$DATALOCATIONS_ZONE3 = "Hall des champions"

[string[]]$DATAEVENT = "Eleve","Selecta","VendeurPizza","Prof","FABCOP","JULTOR(Paradis)","JULTOR(Enfer)","PATRAU","YANFON","ALAALB","CommandePizza","9GAG","BloodTrade","Boulangerie","Caid","DIM","Sonia","Backpack","HDD","Trap","ANTGEN","BASPOT","TREX","CRATE","JOHVER","Eleve(F)","Furie","GIOFAZ","DOUCLE"

function RandomLocations () {
    if ($ZoneActu -eq 1)
    {
        $idx = Randomize 0 $DATALOCATIONS_ZONE1.Length
        $value = $DATALOCATIONS_ZONE1[$idx]
        return $value
    }
    elseif ($ZoneActu -eq 2)
    {
        $try = Randomize 0 100
        if ($try -le 30)
        {
            $idx = Randomize 0 $DATALOCATIONS_ZONE1.Length
            $value = $DATALOCATIONS_ZONE1[$idx]
            return $value
        }
        else
        {
            $idx = Randomize 0 $DATALOCATIONS_ZONE2.Length
            $value = $DATALOCATIONS_ZONE2[$idx]
            return $value
        }
    }
    elseif ($ZoneActu -eq 3)
    {
        $try = Randomize 0 100
        if ($try -le 15)
        {
            $idx = Randomize 0 $DATALOCATIONS_ZONE1.Length
            $value = $DATALOCATIONS_ZONE1[$idx]
            return $value
        }
        elseif ($try -le 40)
        {
            $idx = Randomize 0 $DATALOCATIONS_ZONE2.Length
            $value = $DATALOCATIONS_ZONE2[$idx]
            return $value
        }
        else
        {
            $idx = Randomize 0 $DATALOCATIONS_ZONE3.Length
            $value = $DATALOCATIONS_ZONE3[$idx]
            return $value           
        }     
    }
}

function DropItem ([double]$DropPercent, [string[]]$DropType, [double]$RarityMultiplier, [int]$RarityMin, [int]$RarityMax)
{
    AddItem (DropName -DropPercent $DropPercent -DropType $DropType -RarityMultiplier $RarityMultiplier -RarityMin $RarityMin -RarityMax $RarityMax)
}

function DropName ([double]$DropPercent, [string[]]$DropType, [double]$RarityMultiplier, [int]$RarityMin, [int]$RarityMax)
{
    # Controle des valeurs des paramêtres

    if ($DropPercent -eq $null -or $DropPercent -le 0)
    {
        $DropPercent = 100
    }

    if ($DropType -eq $null)
    {
        $DropType = "Food","Weapon","Common","Armor"
    }

    if ($RarityMultiplier -eq $null)
    {
        $RarityMultiplier = 1
    }

    if ($RarityMin -eq $null -or $RarityMin -le 0)
    {
        $RarityMin = 1
    }

    if ($RarityMax -eq $null -or $RarityMax -le 0)
    {
        $RarityMax = $RarityMin
    }

    # Dropping

    if ((TryAction 100 $DropPercent) -eq $true)
    {
        # En cas de réusite, on détermine la rareté et le type de drop

        [int]$Rarity = 0
        [string]$Type = ""

        # Type de drop

        if ($DropType.Length -eq 1)
        {
            $Type = $DropType[0]
        }
        else
        {
            $idxType = (Randomize 0 ($DropType.Length))
            $Type = $DropType[$idxType]
        }
        
        # Rareté

        if ($RarityMin -eq $RarityMax)
        {
            $Rarity = $RarityMin
        }
        else
        {
            $Z = $RarityMax - $RarityMin
            [double]$Y = $RarityMultiplier        
            [double]$X = 100 * ([System.Math]::Pow($Y,$Z - 1))
            [double]$H = 0

            for ($idx = 1; $idx -le $Z; $idx++)
            {
                $H += [System.Math]::Pow($Y, $Z - $idx)
            }
            
            $X = $X / $H

            $DropRand = Randomize 1 100

            if ($DropRand -le $X)
            {
                $Rarity = $RarityMin
            }
            else
            {
                $XSum = $X
                for ($idx = 0; $idx -le $Z; $idx++)
                {
                    if ($DropRand -le $XSum + $X / [System.Math]::Pow($Y, $Z - $idx))
                    {
                        $Rarity = $RarityMin + $idx
                    }
                    $XSum += $X / [System.Math]::Pow($Y, $Z - $idx)
                }
            }
        }

        # Drop d'item

        switch ($Type)
        {
            "Food"
            {
                switch ($Rarity)
                {
                    1
                    {
                        $idxItem = Randomize 0 $DATAFOOD_RARITY1.Length
                        $value = $DATAFOOD_RARITY1[$idxItem]
                        return, $value 
                    }
                    2
                    {
                        $idxItem = Randomize 0 $DATAFOOD_RARITY2.Length
                        $value = $DATAFOOD_RARITY2[$idxItem]
                        return, $value 
                    }
                    3
                    {
                        $idxItem = Randomize 0 $DATAFOOD_RARITY3.Length
                        $value = $DATAFOOD_RARITY3[$idxItem]
                        return, $value 
                    }
                    4
                    {
                        $idxItem = Randomize 0 $DATAFOOD_RARITY4.Length
                        $value = $DATAFOOD_RARITY4[$idxItem]
                        return, $value 
                    }
                    5
                    {
                        $idxItem = Randomize 0 $DATAFOOD_RARITY5.Length
                        $value = $DATAFOOD_RARITY5[$idxItem]
                        return, $value 
                    }
                }
            }
            "Weapon"
            {
                switch ($Rarity)
                {
                    1
                    {
                        $idxItem = Randomize 0 $DATAWEAPONS_RARITY1.Length
                        $value = $DATAWEAPONS_RARITY1[$idxItem]
                        return, $value 
                    }
                    2
                    {
                        $idxItem = Randomize 0 $DATAWEAPONS_RARITY2.Length
                        $value = $DATAWEAPONS_RARITY2[$idxItem]
                        return, $value 
                    }
                    3
                    {
                        $idxItem = Randomize 0 $DATAWEAPONS_RARITY3.Length
                        $value = $DATAWEAPONS_RARITY3[$idxItem]
                        return, $value 
                    }
                    4
                    {
                        $idxItem = Randomize 0 $DATAWEAPONS_RARITY4.Length
                        $value = $DATAWEAPONS_RARITY4[$idxItem]
                        return, $value 
                    }
                    5
                    {
                        $idxItem = Randomize 0 $DATAWEAPONS_RARITY5.Length
                        $value = $DATAWEAPONS_RARITY5[$idxItem]
                        return, $value 
                    }
                }
            }
            "Armor"
            {
                switch ($Rarity)
                {
                    1
                    {
                        $idxItem = Randomize 0 $DATAARMOR_RARITY1.Length
                        $value = $DATAARMOR_RARITY1[$idxItem]
                        return, $value 
                    }
                    2
                    {
                        $idxItem = Randomize 0 $DATAARMOR_RARITY2.Length
                        $value = $DATAARMOR_RARITY2[$idxItem]
                        return, $value 
                    }
                    3
                    {
                        $idxItem = Randomize 0 $DATAARMOR_RARITY3.Length
                        $value = $DATAARMOR_RARITY3[$idxItem]
                        return, $value 
                    }
                    4
                    {
                        $idxItem = Randomize 0 $DATAARMOR_RARITY4.Length
                        $value = $DATAARMOR_RARITY4[$idxItem]
                        return, $value 
                    }
                    5
                    {
                        $idxItem = Randomize 0 $DATAARMOR_RARITY5.Length
                        $value = $DATAARMOR_RARITY5[$idxItem]
                        return, $value 
                    }
                }
            }
            "Common"
            {
                switch ($Rarity)
                {
                    1
                    {
                        $idxItem = Randomize 0 $DATACOMMONS_RARITY1.Length
                        $value = $DATACOMMONS_RARITY1[$idxItem]
                        return, $value 
                    }
                    2
                    {
                        $idxItem = Randomize 0 $DATACOMMONS_RARITY2.Length
                        $value = $DATACOMMONS_RARITY2[$idxItem]
                        return, $value 
                    }
                    3
                    {
                        $idxItem = Randomize 0 $DATACOMMONS_RARITY3.Length
                        $value = $DATACOMMONS_RARITY3[$idxItem]
                        return, $value 
                    }
                    4
                    {
                        $idxItem = Randomize 0 $DATACOMMONS_RARITY4.Length
                        $value = $DATACOMMONS_RARITY4[$idxItem]
                        return, $value 
                    }
                    5
                    {
                        $idxItem = Randomize 0 $DATACOMMONS_RARITY5.Length
                        $value = $DATACOMMONS_RARITY5[$idxItem]
                        return, $value 
                    }
                }
            }
        }
    }
}