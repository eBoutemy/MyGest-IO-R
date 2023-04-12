#!/bin/bash

echo "Installation de openssh-server"
sudo apt update && apt install -y openssh-server

echo "Souhaitez-vous mettre le PermitRootLogin sur no?"
echo "O/n"
read choixroot
case $choixroot in 
	O | o)
        cd /etc/ssh/
        sleep 1
        sed -i -e 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' sshd_config
        echo "Validé."
        ;;
	N | n)
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac

echo "Souhaitez-vous mettre le port SSh ?"
echo "O/n"
read choixport
case $choixport in 
	O | o)
        echo "Quel est votre nouveau numéro de port voulu?"
        read newport
        cd /etc/ssh/
        sleep 1
        sed -i -e 's/#Port 22/Port $newport/g' sshd_config
        echo "Validé."
        ;;
	N | n)
		;;
	* )
		echo "Erreur dans la saisie"
		;;
esac
service ssh restart
sleep 2
cd /etc/ssh
ssh-keygen -lf ssh_host_ecdsa_key.pub -E sha256
