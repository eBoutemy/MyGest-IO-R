#!/bin/bash

while true; do
  echo "Veuillez saisir l'adresse IP :"
  read ip

  if [[ $ip =~ ^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]]; then
    break
  else
    echo "ERREUR : L'adresse IP n'est pas valide."
  fi
done

echo "Veuillez saisir le port visé"
read port

a=$(nmap -p "$port" -v "$ip" | grep open)

if [[ "$a" == *"open"* ]]; then
    echo "le port est ouvert"
else 
    echo "le port n'est pas ouvert"
fi