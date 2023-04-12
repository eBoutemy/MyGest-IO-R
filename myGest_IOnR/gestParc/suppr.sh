#!/bin/bash

IFS=":" read username password < informations/credentials.txt
read bddinfo < informations/infobdd.txt

mysql --user=$username --password=$password -e "show tables;" $bddinfo
echo "Veuilliez indiquer la Tables voulu"
read tables


if [ "$tables" == "Equipement" ]; then
	mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.$tables"
	echo "Voici la tables $tables, quel est l'id que vous voulez supprimer?"
	read idsup

	echo "Confirmer la suppresion , (O/n)"
	read choix
	case $choix in
	  o)
	    	mysql --user=$username --password=$password -e "DELETE FROM $tables WHERE id='$idsup';" $bddinfo
		sleep 1
		mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.$tables"
		echo "Voici la modification."
	   	 ;;
	  O)
	    	mysql --user=$username --password=$password -e "DELETE FROM $tables WHERE id='$idsup';" $bddinfo
		sleep 1
		mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.$tables"
		echo "Voici la modification."
	   	 ;;
	  n)
	    echo "Au revoir!"
	    exit 0
	    ;;
	  N)
	    echo "Au revoir!"
	    exit 0
	    ;;
	  *)
	    echo "Choix invalide"
	    ;;
	esac



elif [ "$tables" == "TypeE" ]; then
	mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.$tables"
	echo "Voici la tables $tables, quel est l'id que vous voulez supprimer?"
	read idsup

	echo "Confirmer la suppresion , (O/n)"
	read choix
	case $choix in
	  o)
		mysql --user=$username --password=$password -e "DELETE FROM $tables WHERE id='$idsup';" $bddinfo
		sleep 1
		mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.$tables"
		echo "Voici la modification."
	   	 ;;
	  O)
		mysql --user=$username --password=$password -e "DELETE FROM $tables WHERE id='$idsup';" $bddinfo
		sleep 1
		mysql --user=$username --password=$password -e "SELECT * FROM $bddinfo.$tables"
		echo "Voici la modification."
	   	 ;;
	  n)
	    echo "Au revoir!"
	    exit 0
	    ;;
	  N)
	    echo "Au revoir!"
	    exit 0
	    ;;
	  *)
	    echo "Choix invalide"
	    ;;
	esac


else
  mysql --user=$username --password=$password -e "show Tables;" $bddinfo
  echo "Tables incorrect, merci de bien choisir la tables voulu."
fi

