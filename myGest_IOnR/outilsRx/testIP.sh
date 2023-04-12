#!/bin/bash

while true; do
    	echo "Veuilliez saisir une addresse ip:"
	read ip
	if [[ $ip =~ ^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]]; then
	    break
	  else
	    echo "ERREUR : L'adresse IP n'est pas valide."
	  fi
	done

echo "Envoie de la requete ICMP..."
a=$(ping -c 3 $ip | grep -oP '\d+(?=% packet loss)')

if [ "$a" == "0" ]; then
	echo "L'adresse $ip répond au ping"
else
	echo "L'adresse $ip ne répond pas au ping"
fi