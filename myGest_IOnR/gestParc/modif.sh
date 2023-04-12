#!/bin/bash

IFS=":" read username password < informations/credentials.txt
read bddinfo < informations/infobdd.txt


mysql --user=$username --password=$password -e "show tables;" $bddinfo
echo "Veuilliez indiquer la Tables voulu"
read tables


if [ "$tables" == "Equipement" ]; then

	mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.$tables"

	  echo "Voici la tables $tables, quel est l'id que vous voulez modifier?"
	  read idmodif
	  mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.Equipement WHERE id="$idmodif""

	echo "Voulez vous modifier le nom de la machine? (O/n)"
	read choixo
	case $choixo in
	  o | O)
     echo "Comment voulez-vous appeler votre nouvelle machine ? (O/n)"
     read namemodiftwo
	    mysql --user=$username --password=$password -e "UPDATE $tables SET nom='$namemodiftwo' WHERE id=$idmodif;" $bddinfo 
      ;;
	  *)
	    ;;
	esac

	echo "Voulez vous modifier l'addresse IP de la machine? (O/n)"
	read newip
	case $newip in
	  o | O)
      echo "Quel est la nouvelle addresse de la machine ?"
      read newiptwo
	    mysql --user=$username --password=$password -e "UPDATE $tables SET adIP='$newiptwo' WHERE id=$idmodif;" $bddinfo
	    ;;
	  *)
	    ;;
	esac


	echo "Voulez vous modifier le CIDR reseaux de la machine ? (O/n)"
	read newcidr
	case $newcidr in
	  o | O)
      echo "Quel est le nouveau CIDR IP de la machine?"
      read newcidrtwo
	    mysql --user=$username --password=$password -e "UPDATE $tables SET CIDR='$newcidrtwo' WHERE id=$idmodif;" $bddinfo
      ;;
	  *)
	    ;;
	esac

	sleep 1
	mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.Equipement WHERE id="$idmodif""
	echo "Voici la modification."

elif [ "$tables" == "TypeE" ]; then
	mysql --user=$username --password=$password -e "SELECT * FROM $tables" $bddinfo

	echo "Voici la tables $tables, quel est l'id que vous voulez modifier?"
	read idmodif

	echo "Merci d'indiquer le nouveau nom de la machine."
	read namemodif

	mysql --user=$username --password=$password -e "UPDATE $tables SET libelle='$namemodif' WHERE id=$idmodif;" $bddinfo

	sleep 1
	mysql --user=$username --password=$password -e "SELECT * FROM $tables" $bddinfo
	echo "Voici la modification."


else
  mysql --user=$username --password=$password -e "show Tables;" $bddinfo
  echo "Tables incorrect, merci de bien choisir la tables voulu."
fi
