#!/bin/bash

IFS=":" read username password < informations/credentials.txt
read bddinfo < informations/infobdd.txt

mysql --user=$username --password=$password -e "show tables;" $bddinfo
echo "Veuilliez indiquer la Tables voulu"
read tables


if [ "$tables" == "Equipement" ]; then

	echo "Veuilliez saisir le nom du système"
	read nom

	while true; do
	  echo "Veuillez saisir l'adresse MAC (12 caractères hexadécimaux séparés par des espaces) :"
	  read adMAC

	  if [[ $adMAC =~ ^[0-9A-Fa-f]{2}(:[0-9A-Fa-f]{2}){5}$ ]]; then
	    break
	  else
	    echo "ERREUR : L'adresse MAC n'est pas valide."
	  fi
	done

	while true; do
	  echo "Veuillez saisir l'adresse IP :"
	  read adIP
	    if [[ $adIP =~ ^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]]; then
	    break
	  else
	    echo "ERREUR : L'adresse IP n'est pas valide."
	  fi
	done

	echo "Veuilliez saisir le masque en CIDR"
	read CIDR

	mysql --user=$username --password=$password -e "SELECT * FROM TypeE;" $bddinfo
	echo "Veuilliez saisir le numéro du TypeE"
	read idT


	echo "Validez-vous ces informations ? Nom : $nom / AdMac : $adMAC / IP : $adIP / CIDR : $CIDR / IdT : $idT"
	echo "o/n"
	read choix
	case $choix in
	  o | O)
	    mysql --user=$username --password=$password -e "INSERT INTO $tables (nom, adMAC, adIP, CIDR, idT) VALUES ('$nom', '$adMAC', '$adIP', '$CIDR', '$idT');" $bddinfo
	    ;;
	  n | N)
	    exit 0
	    ;;
	  *)
	    echo "Choix invalide"
	    ;;
	esac

elif [ "$tables" == "TypeE" ]; then
	mysql --user=$username --password=$password -e "SELECT * FROM $tables;" $bddinfo
	while true; do
	echo "Veuillez saisir le numéro d'ID (doit être composé de chiffres seulement) :"
	read id

	  if [[ $id =~ ^[0-9]+$ ]]; then
	    break
	  else
	    echo "ERREUR : L'ID doit être composé de chiffres seulement."
	  fi
	done

	echo "Veuilliez saisir le nom de l'équipement"
	read libelle

	mysql --user=$username --password=$password -e "INSERT INTO $tables (id, libelle) VALUES ('$id', '$libelle');" $bddinfo




else
  mysql --user=$username --password=$password -e "show Tables;" $bddinfo
  echo "Tables incorrect, merci de bien choisir la tables voulu."
fi

