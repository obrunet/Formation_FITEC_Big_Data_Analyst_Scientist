    1  clear
    2  read -p 'Your name' -n 5 name
    3  echo -e "Hi $name"
    4  read -n 5 -p 'Your name' name
    5  echo -e "Hi $name"
    6  history > read.sh
