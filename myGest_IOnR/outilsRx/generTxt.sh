IFS=":" read username password < informations/credentials.txt

echo "Que souhaitez vous générer ? :"
echo "1) Toute les informations"
echo "2) Seulement les machine"
echo "3) Seulement les serveurs"
echo "4) Seulements les switchs"
echo "5) Seulements les routeurs"
echo "0) Quitter"
echo "Veuillez choisir une option :"
read choix

case $choix in
    1)
	mysql --user=$username --password=$password -e "SELECT * FROM Equipement.Equipement;" | tail -n +2 > informations/toute_info.txt
        ;;
    2)
	mysql --user=$username --password=$password -e "SELECT nom,adIP,id FROM Equipement.Equipement WHERE id="1";" | tail -n +2 > informations/info_machine.txt
        ;;
    3)
	mysql --user=$username --password=$password -e "SELECT nom,adIP,id FROM Equipement.Equipement WHERE id="3";" | tail -n +2 > informations/info_serveurs.txt
        ;;
    4)
	mysql --user=$username --password=$password -e "SELECT nom,adIP,id FROM Equipement.Equipement WHERE id="2";" | tail -n +2 > informations/info_switch.txt
        ;;
    5)
	mysql --user=$username --password=$password -e "SELECT nom,adIP,id FROM Equipement.Equipement WHERE id="4";" | tail -n +2 > informations/info_routeur.txt
        ;;
    0)
        echo "Au revoir!"
        exit 0
        ;;
    *)
        echo "Choix invalide"
        ;;
esac


#mysql --user=eleve --password=btsinfo -e "SELECT nom,adIP,id FROM Equipement.Equipement;" | tail -n +2 > adresse_ip.txt