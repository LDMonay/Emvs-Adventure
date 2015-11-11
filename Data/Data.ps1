# Arrays

[string[]]$DATANAMES = "Julien","Robin","Paul","Philippe","Snape","Dumbledor","Bru","Menendez","Arnaud","Fabien","Lo�c","Douglas","Jonathan","Dario","Elie","Marc","Jules","Claire","Eric","Sacha","Micheal","Vladimir","Dimitiriev","Pavlov","Henri","Valais","Magi","Carp","G�rard","Hornet","JQUERY","#ImCool","Klign","Loki","Vulpix","Tad","Mok","Yuri","Spock","ERROR_NOT_FOUND","Bruce","Blue","Red","Yellow","Davis","Glairon","AEIOUY","Luther","Tyrone","FAZECLAN","Ptol�mh�","Christopher","GrouGrou","Hopi","Windows","Steve","Adolf"
[string[]]$DATAFNAMES = "Horis","Mangoulin","Severus","Albus","Galio","Fir","Mendez","Donnet","Monay","Regulus","Miro","Urdnot","Wrex","Garus","Shepard","Doc","Blue","Green","Lancer","Archer","Dlog","JAVASCRIPT","Nguyen","Gatorade","Select * from tbl","Densetsu","Yellow","Ant","Bull","Fremdi","Ghandi","Nizzard","Xeon","Zlorig","Bioukli","Stackoverflow","Wayne","Sanders","Geneva","BloupBloup","Kleiner","Klein","Ophrio","KGB","LutinVert","YOLO","MLG","Girrard","Tyranus","Lee","Mecanivel","Horilop","CANTTOUCHTHIS","Skrillex","Jobs","Titler"

[string[]]$DATAFOOD = "Coca-Cola","Bi�re","Pizza margarita","Pizza prochuito","Pizza au thon","Sandwich au jambon","Sprite","Steak de lion","Kit-Kat","Twix","Sandwich viande s�ch�e","Menu �tudiant"
[string[]]$DATAWEAPONS = "Baton","Batte de baseball","Couteau � cran d'arr�t","Planche clout�e","Pierre","Massue","Scie circulaire","Thon gel�","Hachoir","Grosse baguette","Couteau papillion","Fouet","Cravache","Levier de vitesse"
[string[]]$DATAARTEFACT = "Bouteille de rhum orn�e","Masque de Luchador","Compte WOW de farm","Routeur / Firefeu","Magazine �trange","Paquet de donn�es"
[string[]]$DATACOMMONS = "Amulette obscure","Amulette lumineuse","Drogue du d�mon","Peau armure","Bourse","Grenade","Pilule �trange","Stimpack"

[string[]]$DATAARMOR = "";

[string[]]$DATALOCATIONS_ZONE1 = "Hall d'entr�e","Exterieur","Couloir","Cafeteria","Salle de classe","Ascenseur","Camion �trange","Salle de gestion de projet","Reserve","Toilette Homme","Toilette Femme","Porte de la Zone 1"
[string[]]$DATALOCATIONS_ZONE2 = "Porte de la Zone 2"
[string[]]$DATALOCATIONS_ZONE3 = "Hall des champions"

[string[]]$DATAEVENT = "Eleve","Selecta","VendeurPizza","Prof","FABCOP","JULTOR(Paradis)","JULTOR(Enfer)","PATRAU","YANFON","ALAALB","CommandePizza","9GAG","BloodTrade","Boulangerie","Caid","DIM","Sonia","Backpack","HDD","Trap","ANTGEN","BASPOT","TREX","CRATE","JOHVER","Eleve(F)","Furie","GIOFAZ","DOUCLE"

# Randoms

function RandomFood () {
    $idx = Randomize 0 $DATAFOOD.Length
    $value = $DATAFOOD[$idx]
    return $value
}

function RandomWeapon () {
    $idx = Randomize 0 $DATAWEAPONS.Length
    $value = $DATAWEAPONS[$idx]
    return $value
}

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

function RandomCommon () {
    $idx = Randomize 0 $DATACOMMONS.Length
    $value = $DATACOMMONS[$idx]
    return $value
}

function DropItem ($RareMin, $RareMax)
{
}