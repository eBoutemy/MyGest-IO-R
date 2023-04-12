#!/bin/bash
apt-get update
apt-get install sudo -y
sudo apt-get install mariadb-server -y
sudo apt-get install tcpdump -y
sudo apt-get install net-tools -y
sudo apt-get install nmap -y
sudo apt-get install figlet -y
sudo apt-get install lolcat -y 
sudo apt install unzip -y
sleep 1

echo "Etes vous sur un poste client ou un serveur?"
echo "Saisir (Client ou Serveur)"
read choixsrv

case $choixsrv in
    Client | client)
        sed -i -e 's/serveur=1/serveur=0/g' ../config.sh
        echo "Changement du fichier config"
        ;;

    Serveur | serveur)
        sed -i -e 's/serveur=0/serveur=1/g' ../config.sh
        echo "Changement du fichier config"
        ;;
    *)
        echo "Choix invalide"
        ;;
    esac
    
mkdir ../informations


#IDENTIFIANT

echo "Quel est votre compte utilisateur pour la bdd ?"
read namebdd
echo "Quel est votre mots de passe pour cette utilisateur ?"
read passbdd

sudo touch ../informations/credentials.txt
echo "$namebdd:$passbdd" > ../informations/credentials.txt

# BASE DE DONNE

echo "Comment voulez-vous appeler votre table de base de données?"
read namebddtable

sudo touch ../informations/infobdd.txt
echo "$namebddtable" > ../informations/infobdd.txt
sleep 1

sudo mysql -e "create database $namebddtable;"
sleep 1


# PERMISSIONS

sudo mysql -e "create user $namebdd@'localhost' identified by '$passbdd';"
sleep 1

sudo mysql -e "grant all on $namebddtable.* to $namebdd@'localhost';flush privileges;"
sleep 1

sudo mysql --user=$namebdd --password=$passbdd -e "source myGestIOnR.sql;" $namebddtable