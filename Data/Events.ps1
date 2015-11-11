function ActivateLocationEvent () {
    LocationEvent $ActualLocation
}

function StartEvent ($eventname) {
    switch ($eventname)
    {
        "Eleve"
		{
            Write-Host "Vous rencontrez un élève" -ForegroundColor Yellow
            $Chance = Randomize 0 100
			if ($Chance -le 30)
            {
                Write-Host "L'élève vous trouve sympa et vous offre un objet"
                $item = RandomFood
                AddItem $item
            }
            elseif ($Chance -le 80)
            {
                Write-Host "L'élève à l'air mécontant et vous attaque !" -ForegroundColor Red
                pause
                StartBattle 15 50 (Randomize 80 120) 180 "l'élève"
                if ($PlayerIsAway -eq $false)
                {
                    $item = RandomFood
                    AddItem $item
                }

            }
            elseif ($Chance -le 100)
            {
                Write-Host "L'élève vous regarde d'un air indiférent puis s'en vas"
            }
        }
        "Eleve(F)"
        {
            Write-Host "Vous rencontrez une élève" -ForegroundColor Yellow
            $Chance = Randomize 0 100
			if ($Chance -le 20)
            {
                Write-Host "L'élève vous trouve sympa et vous offre un objet"
                $item = RandomCommon
                AddItem $item
            }
            elseif ($Chance -le 80)
            {
                Write-Host "L'élève à l'air mécontant et vous attaque !" -ForegroundColor Red
                pause
                StartBattle 15 50 (Randomize 80 120) 180 "l'élève"
                if ($PlayerIsAway -eq $false)
                {
                    $item = RandomCommon
                    AddItem $item
                }

            }
            elseif ($Chance -le 100)
            {
                Write-Host "L'élève vous regarde d'un air indiférent puis s'en vas"
            }           
        }
        "Furie"
        {
            Write-Host "Vous tombez nez à nez avec une fille dans une colère sombre !!!" -ForegroundColor Red
            Write-Host "Elle vous attaque !!!" -ForegroundColor Red
            pause
            StartBattle 25 50 (Randomize 100 160) 180 "Furie"
            if ($PlayerIsAway -eq $false)
            {
                $item = RandomCommon
                AddItem $item
            }
        }
        "Caid"
        {
            Write-Host "Vous rencontrez un caid de mauvaise humeur" -ForegroundColor Yellow
            pause
            StartBattle 15 50 100 200 "le caid"
            if ($PlayerIsAway -eq $false)
            {
                $item = RandomWeapon
                AddItem $item
            }
        }
        "Selecta"
        {
            Write-Host "Vous découverez un Selecta" -ForegroundColor Yellow
            $chance = Randomize 0 100
			if ($Chance -le 10)
            {
                Write-Host "C'est votre jour de chance ! Un coca-cola a été oublié !" -ForegroundColor Green
                AddItem "Coca-Cola"
            }
            elseif ($Chance -le 90)
            {
               $prix = Randomize 10 300
               $prix = $prix / 10
               $item = RandomFood
               Write-Host "Le selecta propose $item pour la modique somme de $prix francs" -ForegroundColor Yellow
               Write-Host "Achetez $item ?"
               $confirm = ConfirmCommand
               if ($confirm -eq $true)
               {
                    Write-Host "Vous introduisez la somme d'argent" -ForegroundColor Yellow
                    if ($Argent -lt $prix)
                    {
                        Write-Host "Malheureusement, vous n'avez pas assez d'argent" -ForegroundColor Red
                    }
                    else
                    {
                        $Script:Argent -= $prix
                        AddItem $item
                    }
               }
            }
            elseif ($Chance -le 100)
            {
                Write-Host "Malheureusement il ne fonctionne pas" -ForegroundColor Gray
            }
        }
        "VendeurPizza"
        {
            Write-Host "Vous rencontrez un italien parlant avec les mains" -ForegroundColor Yellow
            Write-Host "Il vous propose d'acheter une pizza" -ForegroundColor Yellow
            $prix = Randomize 100 200
            $prix = $prix / 10
            echo ""
            Write-Host "[EVENT] Que faire ?" -ForegroundColor Yellow
            Write-Host "Acheter une pizza prochuito / AP ; Acheter une pizza margarita / AM ; Acheter une pizza au thon / AT ; Insulter l'italien / I ; Annuler / N " -ForegroundColor Gray
            $Todo = Read-Host
            if ($Todo -match "AP")
            {
                Write-Host "Une pizza prochuito coute $prix .-"
                $confirm = ConfirmCommand
                if ($confirm -eq $true)
                {
                    Write-Host "Vous payez l'italien" -ForegroundColor Yellow
                    if ($Argent -lt $prix)
                    {
                        Write-Host "Malheureusement, vous n'avez pas assez d'argent" -ForegroundColor Red
                    }
                    else
                    {
                        $item = "Pizza prochuito"
                        $Script:Argent -= $prix
                        AddItem $item
                    }
                }
            }
            elseif ($Todo -match "AM")
            {
                $prixm = $prix - ($prix / 10)
                Write-Host "Une pizza margarita coute $prixm .-"
                $confirm = ConfirmCommand
                if ($confirm -eq $true)
                {
                    Write-Host "Vous payez l'italien" -ForegroundColor Yellow
                    if ($Argent -lt $prixm)
                    {
                        Write-Host "Malheureusement, vous n'avez pas assez d'argent" -ForegroundColor Red
                    }
                    else
                    {
                        $item = "Pizza margarita"
                        $Script:Argent -= $prixm
                        AddItem $item
                    }
                }
            }
            elseif ($Todo -match "AT")
            {
                Write-Host "Une pizza au thon coute $prix .-"
                $confirm = ConfirmCommand
                if ($confirm -eq $true)
                {
                    Write-Host "Vous payez l'italien" -ForegroundColor Yellow
                    if ($Argent -lt $prix)
                    {
                        Write-Host "Malheureusement, vous n'avez pas assez d'argent" -ForegroundColor Red
                    }
                    else
                    {
                        $item = "Pizza au thon"
                        $Script:Argent -= $prix
                        AddItem $item
                    }
                }
            }
            elseif ($Todo -match "i")
            {
                Write-Host "Vous insulter l'italien, ce qui le met dans une rage extrème !" -ForegroundColor Red
                pause
                StartBattle 20 60 170 300 "l'italien en colère"
                if ($PlayerIsAway -eq $false)
                {
                    $item = RandomFood
                    AddItem $item
                }
            }
        }
        "Prof"
        {
            Write-Host "Vous faites face à un prof" -ForegroundColor Yellow
            $Chance = Randomize 0 100
            if ($Chance -le 80)
            {
                Write-Host "Le prof vous crie dessus et se prépare à vous attaquer !" -ForegroundColor Red
                pause
                StartBattle 30 70 (Randomize 120 240) 250 "le prof"
                if ($PlayerIsAway -eq $false)
                {
                    $item = RandomCommon
                    AddItem $item
                }

            }
            elseif ($Chance -le 100)
            {
                Write-Host "Le prof vous regarde de travers puis s'en vas" -ForegroundColor Gray
            }
        }
        "FABCOP"
        {
            Write-Host "Vous rencontrer un homme imposant apparament mécontant" -ForegroundColor Gray
            Write-Host "FABIEN COPPI : `"T`'aurais pas une bière ?`"" -ForegroundColor Yellow
            InfoInventaire
            Write-Host "(Numéro de l'objet ou N pour annuler)" -ForegroundColor Gray
            $selected = Read-Host
            if ($Inventaire[$selected] -eq "Bière")
            {
                Write-Host "FABIEN COPPI : Oh merci, tu me sauve la vie" -ForegroundColor Gray
                RemoveItem $Inventaire[$selected]
                Write-Host "Vous n'avez plus Bière" -ForegroundColor Gray
                Start-Sleep -Milliseconds 500
                Write-Host "FABIEN COPPI : Eh tu sais ce qui serait bien maintenant ? Une bonne baston ! T'es chaud ?" -ForegroundColor Yellow
                $confirm = ConfirmCommand
                if ($confirm -eq $true)
                {
                    Write-Host "FABIEN COPPI : Oh yeeeeah ! Allez c'est parti" -ForegroundColor Red
                    pause
                    StartBattle 45 120 550 1000 "Fabien Coppi"
                    if ($PlayerIsAway -eq $false)
                    {
                        Write-Host "FABIEN COPPI : Houla c'était une bonne baston... Tiens prend ca pour comme récompense" -ForegroundColor Yellow
                        AddItem "Bouteille de rhum ornée"
                    }
                }
                else
                {
                    Write-Host "FABIEN COPPI : Bon tant pis, A plus !" -ForegroundColor Yellow
                    Write-Host "L'homme s'éloigne" -ForegroundColor Gray
                }
            }
            else
            {
                Write-Host "FABIEN COPPI : Bon... Tant pis" -ForegroundColor Yellow
                Write-Host "L'homme s'éloigne" -ForegroundColor Gray
            }
        }
        "Backpack"
        {
            Write-Host "Vous découvrez un sac à dos abandonné" -ForegroundColor Yellow
            Write-Host "Vous fouillez à l'intérieur" -ForegroundColor Gray
            $Chance = Randomize 0 100
            if ($Chance -le 30)
            {
               AddItem (RandomFood)
            }
            elseif ($Chance -le 60)
            {
                AddItem (RandomWeapon)
            }
            elseif ($Chance -le 90)
            {
                AddItem (RandomCommon)
            }
            else
            {
                Write-Host "Vous ne découvrez rien d'intéressant" -ForegroundColor Gray
            }
        }
        "HDD"
        {
            Write-Host "Vous découvrez un disque dur abandonné" -ForegroundColor Yellow
            Write-Host "Vous examinez son contenu" -ForegroundColor Gray
            if ($Chance -le 30)
            {
               Write-Host "Vous obtenez de la connaisance !" -ForegroundColor Yellow
               $Ammount = Randomize (50 * $Level) (200 * $Level)
            }
            elseif ($Chance -le 60)
            {
                Write-Host "Vous tombez sur des images répugnantes, ce qui vous fait vomir" -ForegroundColor Red
                DamageLife(10)
            }
            elseif ($Chance -le 90)
            {
                Write-Host "Vous obtenez beaucoup de connaisance !" -ForegroundColor Yellow
                $Ammount = Randomize (150 * $Level) (500 * $Level)
            }
            else
            {
                Write-Host "Un esprit sort du disque dur et se matérialise devant vous !!!" -ForegroundColor Red
                StartEvent "GIOFAZ"
            }
        }
        "GIOFAZ"
        {
            $faussereponse = $false
            Write-Host "Un homme mystérieux vous fait face" -ForegroundColor Gray
            Write-Host "M. FAZIO : Un avion transporte 300 briques, une brique tombe, combien en reste t-il ?" -ForegroundColor Yellow
            if ((Read-Host "Votre réponse") -match "299")
            {
                Write-Host "M. FAZIO : C'est juste, Trois nains vont à la mine, le premier prend une pelle, le deuxième prend une pioche, Que prend le troisième ?" -ForegroundColor Yellow
                if ((Read-Host "Votre réponse") -match "tête")
                {
                    Write-Host "M. FAZIO : Tu es plutot bon, je te laisse la vie sauve pour cette fois" -ForegroundColor Yellow
                    Write-Host "L'homme disparait..." -ForegroundColor Gray
                }
                else
                {
                    Write-Host "M. FAZIO : NOOOOOOOOOOOOOON ! Prépare toi à mourir !" -ForegroundColor Red
                    $faussereponse = $true
                }
            }
            else 
            {
               Write-Host "M. FAZIO : NOOOOOOOOOOOOOON ! Prépare toi à mourir !" -ForegroundColor Red
               $faussereponse = $true
            }

            if ($faussereponse -eq $true)
            {
                    Write-Host "L'homme enfile un masque de Luchador !" -ForegroundColor Red
                    pause
                    StartBattle 60 160 750 1200 "un Luchador"
                    if ($PlayerIsAway -eq $false)
                    {
                        Write-Host "M. FAZIO : Je reconnais ta force, prend ceci en gage de ta victoire" -ForegroundColor Yellow
                        AddItem "Masque de Luchador"
                    }
            }
        }
        "9GAG"
        {
            Write-Host "Vous regarder un post..." -ForegroundColor Gray
            $Chance = Randomize 0 100
            if ($Chance -le 30)
            {
               Write-Host "Vous découvrez un post particulièrement rigolo !" -ForegroundColor Yellow
            }
            elseif ($Chance -le 60)
            {
                Write-Host "Vous découvrez un post rassurant !" -ForegroundColor Green
                RegenLife 3
            }
            elseif ($Chance -le 90)
            {
               Write-Host "Vous découvrez un post qui vous choque !" -ForegroundColor Red
               DamageLife 3
            }
            elseif ($Chance -le 92)
            {
                Write-Host "Une forme se matérialise devant vous !!!" -ForegroundColor Red
                StartEvent "DOUCLE"
            }
            else
            {
                Write-Host "Vous ne découvrez qu'un post pas rigolo" -ForegroundColor Gray
            } 
        }
        "DOUCLE"
        {
            Write-Host "Vous rencontrez un homme mystérieux..." -ForegroundColor Gray
            Write-Host "DOUGLAS CLERC : A que coucou $Nom. A que, On va dans un coin. A que, je te tue"
            pause
            StartBattle 60 120 600 1000 "Douglas Clerc"
            if ($PlayerIsAway -eq $false)
            {
                Write-Host "DOUGLAS CLERC : A que tu es plus fort que prévu..." -ForegroundColor Yellow
                AddItem "Compte WOW de farm"
            }
        }
        "Trap"
        {
            Write-Host "Vous entendez un `"CLIC`" mécanique..." -ForegroundColor Red
            $Chance = Randomize 0 100
            if ($Chance -le 30)
            {
               Write-Host "UN PIEGE A LOUP SE RENFERME SUR VOTRE JAMBE !!!" -ForegroundColor Red
               DamageLife (Randomize 1 30)
            }
            elseif ($Chance -le 60)
            {
                Write-Host "UNE MINE EXPLOSE A VOS PIEDS !!!" -ForegroundColor Red
                DamageLife (Randomize 20 60)
            }
            elseif ($Chance -le 90)
            {
               Write-Host "Vous vous encoublez comme une merde sur un fil tendu..." -ForegroundColor Gray
               DamageLife 3
            }
            else
            {
                Write-Host "Une forme se matérialise devant vous !" -ForegroundColor Yellow
                StartEvent "PATRAU"
            }
        }
        "PATRAU"
        {
            Write-Host "Un homme sournois vous approche !" -ForegroundColor Yellow
            Write-Host "M. RAUSIS : Jamais vous ne batterez le maitre des pièges !!!" -ForegroundColor Red
            pause
            StartBattle 10 150 800 1200 "le maitre des pièges"
            if ($PlayerIsAway -eq $false)
            {
                Write-Host "M. RAUSIS : Impossible.... NOOOOOOOOOON !!!" -ForegroundColor Yellow
                AddItem "Paquet de données"
            }
        }
        "CRATE"
        {
            Write-Host "Vous découvrez une grosse caisse..." -ForegroundColor Gray
            Write-Host "Vous fouillez à l'intérieur" -ForegroundColor Gray
            $Chance = Randomize 0 100
            if ($Chance -le 30)
            {
               AddItem (RandomFood)
            }
            elseif ($Chance -le 60)
            {
                AddItem (RandomWeapon)
            }
            elseif ($Chance -le 90)
            {
                AddItem (RandomCommon)
            }
            else
            {
                Write-Host "Vous ne découvrez rien d'intéressant" -ForegroundColor Gray
            }
        }
        "JOHVER"
        {
            Write-Host "Un homme menacant sort de l'ombre !" -ForegroundColor Red
            Write-Host "M. VERNAILLEN : Ach ! Il nous faut protecter le réserve ! Prépare toi à recevoir le mort !" -ForegroundColor Red
            pause
            StartBattle 10 150 800 1200 "Vernaillen"
            if ($PlayerIsAway -eq $false)
            {
                Write-Host "M. VERNAILLEN : NON ! Nous avons faille à tache !" -ForegroundColor Yellow
                AddItem "Routeur / Firefeu"
            }
        }
        "TREX"
        {
            Write-Host "Le passage est bloqué par une porte en métal" -ForegroundColor Yellow
            Write-Host "[EVENT] Que faire ?" -ForegroundColor Yellow
            Write-Host "Ouvrir la porte / O, Partir / N" -ForegroundColor Gray
            $Todo = Read-Host
            if ($Todo -match "N")
            {
                Write-Host "Vous vous éloignez de la porte" -ForegroundColor Gray
            }
            elseif ($Todo -match "O")
            {
                Write-Host "Vous ouvrez la porte..." -ForegroundColor Gray
                Write-Host "IL Y A UN TYRANOSAURUS REX DE L'AUTRE COTE !!!" -ForegroundColor Red
                Write-Host "IL VOUS ATTAQUE !" -ForegroundColor Red
                DamageLife (Randomize 50 150)
                Write-Host "Vous reculez rapidement, Il ne peux plus vous faire de mal maintenant" -ForegroundColor Yellow
            }
        }
        "BloodTrade"
        {
            Write-Host "Un homme inquiétant s'approche de vous..." -ForegroundColor Gray
            Write-Host "Il vous propose de l'argent contre votre sang" -ForegroundColor Yellow
            Write-Host "[EVENT] Que faire ?" -ForegroundColor Yellow
            Write-Host "Accepter / O, Partir / N" -ForegroundColor Gray
            $Todo = Read-Host
            if ($Todo -match "N")
            {
                Write-Host "Vous vous éloignez de l'homme..." -ForegroundColor Gray
            }
            elseif ($Todo -match "O")
            {
                Write-Host "Choisisez la quantité de sang à vendre (PV)" -ForegroundColor Yellow
                $Ammount = Read-Host
                DamageLife $Ammount
                Write-Host "L'homme vous tend une somme d'argent"
                $Ammount = $Ammount / 2
                Write-Host "Vous obtenez $Ammount frs !" -ForegroundColor Yellow
                $Script:Argent += $Ammount
                
            }
        }
        "BASPOT"
        {
            Write-Host "Une créature étrange s'approche dans l'ombre..." -ForegroundColor Gray
            Write-Host "La créature arrive devant vous" -ForegroundColor Gray
            Write-Host "La créature est une chimère mi-humain, mi-poulpe" -ForegroundColor Yellow
            Write-Host "BASTIEN POTET : *Bruit de bulles*... "
            Write-Host "La chimère fait des bubulles..." -ForegroundColor Gray
            Write-Host "Elle vous attaque !" -ForegroundColor Red
            pause
            StartBattle 10 150 800 1200 "Un poulpe"
            if ($PlayerIsAway -eq $false)
            {
                Write-Host "BASTIEN POTET : *Bruit de bulles* !!! " -ForegroundColor Yellow
                AddItem "Magazine étrange"
            }

        }

    }
}