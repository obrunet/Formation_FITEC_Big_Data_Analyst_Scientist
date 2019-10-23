    1  cd ..
    2  ls
    3  mkdir testgit
    4  cd testgit/
    5  git init
    6  vi newfile.txt
    7  cat newfile.txt 
    8  git status
    9  git add newfile.txt 
   10  git status 
   11  git commit newfile.txt -m "1er commit ajout du fichier"
   12  git status
   13  vi newfile.txt 
   15  git diff
   16  git add newfile.txt 
   17  git diff
   18  vi newfile.txt 
   19  git diff
   20  git status
   21  git add .
   22  git commit newfile.txt -m "deuxième modif"
   23  git log
   24  git log -p
   25  git log --stat
   26  history > exercie1.sh
