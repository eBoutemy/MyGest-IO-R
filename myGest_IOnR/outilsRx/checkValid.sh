#!/bin/bash
IFS=":" read username password < informations/credentials.txt
read bddinfo < informations/infobdd.txt

mysql --user=$username --password=$password -e "SELECT adIP FROM $bddinfo.Equipement;" | tail -n +2 > informations/ip.txt

for line in $(cat informations/ip.txt)
do

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
WHITE=$(tput setaf 7)

a=$(ping -w 3 $line | grep -oP '\d+(?=% packet loss)')


if [ "$a" == "0" ]; then
	echo "${WHITE}L'adresse ${GREEN}$line ${WHITE}répond au ping"
else
	echo "${WHITE}L'adresse ${RED}$line ${WHITE}ne répond pas au ping"
fi
tput sgr0
done


