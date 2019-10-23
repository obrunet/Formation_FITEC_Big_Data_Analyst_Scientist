    1  git branch
    2  git branch new_branch
    3  git branch
    4  git checkout new_branch
    5  git branch
    6  touch file_new_branch
    7  git status
    8  git add .
    9  git commit -m "add new file in the new branch"
   10  git checkout master
   11  touch new_file_master
   12  ls
   13  git status
   14  git add .
   15  git commit -m "add new file in master"
   16  git status
   17  git merge new_branch
   18  git merge new_branch -m "merge two branches"
   19  ls
   20  git branch
   21  git branch -d new_branch
   22  git branch
   23  history > exercice2_same_dir_new_branch.sh
