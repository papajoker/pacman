#!/bin/bash
echo 'recupérer la dernière version et créer dossier /pacman/'
git clone https://github.com/papajoker/pacman.git
cd pacman
pacman -Qqen > pkglist-repo.txt
pacman -Qqem > pkglist-aur.txt

#on a executé les 2 lignes a la création du repository dans le dossier "pacman"
#git init
#git remote add origin https://github.com/papajoker/pacman.git

echo '---------- git add ----------'
git add pkglist-repo.txt
git add pkglist-aur.txt
echo '---------- git commit ----------'
git commit -m "derniere sauvegarde de ma config Manjaro"
echo '---------- git upload ----------'
git push origin master
cd ..

#voila c'est fini

echo '-----------------------------------'
echo 'pour restauration:'
echo 'git clone https://github.com/papajoker/pacman.git'
echo 'sudo pacman -S --needed $(< pacman/pkglist-repo.txt)'
echo 'yaourt -S --needed --noconfirm $(< pacman/pkglist-aur.txt)' 
