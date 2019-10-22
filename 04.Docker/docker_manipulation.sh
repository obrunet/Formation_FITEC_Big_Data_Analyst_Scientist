    3  docker stop b8640ee79cf6
    4  docker rm 6d574740d7b4
    5  docker ps -a
    6  docker rm d464938059db
    7  docker ps -a
    8  docker images
    9  docker rmi tomcat
   11  docker ps -a
   12  docker rmi tomcat
   13  docker ps -a -q
   14  docker ps -a
   15  docker run -it nginx /bin/bash
   16  docker ps -a
   18  docker exec -it 15dcb1663fa5 /bin/bash
   19  docker exec -it 4fe2583cb94a /bin/bash
   20  docker start 4fe2583cb94a
   21  docker ps -a
   22  docker exec -it 4fe2583cb94a /bin/bash
   23  uname -a
   26  touch test.txt
   27  docker cp test.txt 4fe2583cb94a:/test.txt
   28  docker ps -a
   29  docker exec -it 4fe2583cb94a /bin/bash
   32  docker cp 4fe2583cb94a:/testbis.txt testbis.txt
   33  ls

