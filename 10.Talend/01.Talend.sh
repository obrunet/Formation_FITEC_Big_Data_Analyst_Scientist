sudo apt install openjdk-8-jre-headless

# https://fr.talend.com/products/data-integration-manuals-release-notes/
# TOS_DI-20191031_1204-V7.3.1M3.zip	7.3.1M3	4 novembre 2019	Milestone	Unix_Linux|Windows|MAC	931MB
# extraire l'archive dans un dossier talend


# avec la version 7.2 de talend installer opendjdk v8, pour la 7.3 installer openjdk 11
sudo apt install openjdk-11-jre

# si besoin pour choisir la version de java -> https://doc.ubuntu-fr.org/openjdk
sudo update-alternatives --config java

# lancer talend
fitec@fitec-ThinkPad-P52s:~/Talend$ ./TOS_DI-linux-gtk-x86_64
