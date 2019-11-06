#!/bin/sh
(
echo "10" ; sleep 1
echo "# Mise à jour des journaux de mail" ; sleep 1
echo "20" ; sleep 1
echo "# Remise à zéro des paramètres" ; sleep 1
echo "50" ; sleep 1
echo "Cette ligne est ignorée" ; sleep 1
echo "75" ; sleep 1
echo "# Redémarrage du système" ; sleep 1
echo "100" ; sleep 1
) |
zenity --progress \
  --title="Mise à jour des journaux système" \
  --text="Analyse des journaux de mail..." \
  --percentage=0 \
  --auto-close

if [ "$?" = -1 ] ; then
        zenity --error --text="Mise à jour annulée."
fi
