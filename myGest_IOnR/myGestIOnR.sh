#!/bin/bash

#import des configs et fonctions
source config.sh
source fonction.sh

#bash install/install.sh
#echo $serveur

echo "Bienvenu dans :"
afficheTitre "MyGest IOn ' R"
quitter=1
while [[ $quitter -ne 0 ]]
do
echo ""
figlet "Menu principal"|lolcat

#affiche titre "Menu principal"
echo "1) Gestion du parc"
echo "2) Outils réseau"
echo "3) Installations pré-requis"
echo "4) CMS"
echo "0) Quitter"
echo -e "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		bash gestParc/menuParc.sh
		;;
	2 )
		bash outilsRx/menuOutils.sh
		;;
	3 )
		bash scripts/menuScript.sh
		;;
	4 )
		bash scripts/menucms.sh
		;;
	0 )
		quitter=0
		figlet "Au revoir"|lolcat
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done


