#!/bin/bash

IFS=":" read username password < informations/credentials.txt
read bddinfo < informations/infobdd.txt

echo "Que souhaitez vous consulter :"
echo "1) Toute les informations"
echo "2) Seulement les machines"
echo "3) Seulement les serveurs"
echo "4) Seulements les switchs"
echo "5) Seulements une machine précise"
echo "0) Quitter"
echo "Veuillez choisir une option :"
read choix

case $choix in
    1)
    echo "Quelle table voulez-vous consulter? (Equipement/TypeE)"
    read tables
    if [[ $tables == Equipement ]]
    then
	    mysql --user=$username --password=$password -e "SELECT Equipement.id, Equipement.nom, Equipement.adMAC, Equipement.adIP, Equipement.CIDR, TypeE.libelle FROM Equipement, TypeE WHERE Equipement.idT = TypeE.id" $bddinfo
        elif [[ $tables == TypeE ]]
    then
        mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.TypeE"
    else
        echo "Table introuvable."
        fi
        ;;
    2)
	 mysql --user=$username --password=$password -e "SELECT Equipement.id, Equipement.nom, Equipement.adMAC, Equipement.adIP, Equipement.CIDR, TypeE.libelle FROM Equipement, TypeE WHERE Equipement.idT = TypeE.id and idT="1"" $bddinfo
        ;;
    3)
	mysql --user=$username --password=$password -e "SELECT Equipement.id, Equipement.nom, Equipement.adMAC, Equipement.adIP, Equipement.CIDR, TypeE.libelle FROM Equipement, TypeE WHERE Equipement.idT = TypeE.id and idT="3"" $bddinfo
        
        ;;
    4)
	mysql --user=$username --password=$password -e "SELECT Equipement.id, Equipement.nom, Equipement.adMAC, Equipement.adIP, Equipement.CIDR, TypeE.libelle FROM Equipement, TypeE WHERE Equipement.idT = TypeE.id and idT="2"" $bddinfo    
        ;;
    5)
        mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.Equipement"
	echo "Quel est le nom de la machine que vous voulez consulter"
	read machinee
        mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.Equipement WHERE nom='$machinee'"
        ;;
    0)
        echo "Au revoir!"
        exit 0
        ;;
    *)
        echo "Choix invalide"
        ;;
esac




