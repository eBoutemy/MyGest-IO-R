#!/bin/bash

echo "Merci de saisir votre nom d'utilisateur pour la connexion SSH"
read idssh

echo "Merci d'indiquer l'addresse IP pour la connexion SSH"
read ipssh


echo "Votre port est t'il celui par défaut? (O/n)"
read choix


case $choix in 
	O | o)
		ssh $idssh@$ipssh -p 22
		;;
	N | n)
    echo "Merci d'indiquer le port pour la connexion SSH"
    read pssh
		ssh $idssh@$ipssh -p $pssh
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
