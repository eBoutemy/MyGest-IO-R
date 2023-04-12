#!/bin/bash

#import des configs et fonctions
source config.sh
source fonction.sh

afficheTitre "Menu Pré-requis"
quitter=1
while [[ $quitter -ne 0 ]]
do
echo -e "\nMenu :"
echo "1) Installation PHP"
echo "2) Installation Apache"
echo "3) Installation MariaDB"
echo "4) Installation Pure-ftp"
echo "5) Installation SSH"
echo "0) Retour au menu principal"
echo -e "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		echo "Installation PHP"
        sudo apt-get update
		sudo apt-get install php
        echo "Validé avec succées"
		;;
	2 )
		echo "Installation Apache"
        sudo apt-get update
		sudo apt-get install apache2
        echo "Validé avec succées"
		;;
	3 )
		echo "Installation mariadb"
        sudo apt-get update
		sudo apt-get install mariadb-serveur
        echo "Validé avec succées"        
		;;
	4 )
		echo "Installation Pure-FTPD"
        sudo apt-get update
		sudo apt-get install pure-ftpd
        echo "Validé avec succées"        
		;;
	5 )
		bash scripts/ssh.sh     
		;;
	0 )
		quitter=0
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done
