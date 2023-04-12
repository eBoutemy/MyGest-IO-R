#!/bin/bash

#import des configs et fonctions
source config.sh
source fonction.sh

afficheTitre "Menu CMS"
quitter=1
while [[ $quitter -ne 0 ]]
do
echo -e "\nMenu :"
echo "1) Installation WordPress"
echo "2) Installation PrestaShop"
echo "3) Installation GLPI"
echo "0) Retour au menu principal"
echo -e "Veuillez choisir une option :"
read choix
case $choix in 
	1 )
		cd /var/www/html/
		sudo wget https://wordpress.org/latest.zip
		sudo unzip latest.zip
		sudo mv latest/ wordpress/
		sudo chown -R www-data:www-data /var/www/html/wordpress/
		sudo chmod -R 755 /var/www/html/wordpress/
		sudo apt install php-mysql php-mbstring php-curl php-gd php-xml php-intl -y
		sudo rm -r latest.zip
		;;
	2 )
		cd /var/www/html/
		sudo wget https://github.com/PrestaShop/PrestaShop/releases/download/8.0.3/prestashop_8.0.3.zip
		sudo unzip prestashop_8.0.3.zip
		sudo mv prestashop_8.0.3/ prestashop/
		sudo chown -R www-data:www-data /var/www/html/prestashop/
		sudo chmod -R 755 /var/www/html/prestashop/
		sudo rm -r prestashop_8.0.3.zip
		;;
	3 )
		cd /var/www/html/
		sudo wget https://github.com/glpi-project/glpi/releases/download/9.5.7/glpi-9.5.7.tgz
		sudo tar xzf glpi-9.5.7.tgz
		sudo chown -R www-data:www-data /var/www/html/glpi/
		sudo chmod -R 755 /var/www/html/glpi/
		apt install php-mysql php-mbstring php-curl php-gd php-xml php-intl -y
		sudo rm -r glpi-9.5.7.tgz
		;;
	0 )
		quitter=0
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
done
