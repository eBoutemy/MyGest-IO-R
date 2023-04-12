#!/bin/bash

rm gestParc/credentials.txt
echo "Veuillez entrer le nom de la base de données :"
read username
echo "Veuillez entrer le mot de passe :"
read -s password

echo "$username:$password" > informations/credentials.txt

echo "Les identifiants ont été stockés dans le fichier credentials.txt"