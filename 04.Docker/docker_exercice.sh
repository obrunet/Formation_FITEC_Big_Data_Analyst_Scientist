    1  docker images
    2  docker ps
    4  docker ps -l
    5  docker ps -a
    8  docker search nginx
    9  docker search busybox
   11  docker search cdh
   12  docker search cloudera
   13  docker search oracle
   14  docker search hadoop
   16  docker pull nginx
   17  docker images
   18  docker search radare
   20  docker images
   21  docker search ubuntu
   22  docker run -d --name=NginxServer nginx:latest
   24  docker ps
   27  docker ps
   28  docker ps -a
   29  docker run -d --name=NginxServerBIS nginx:latest
   30  docker ps -a
   31  docker stop 4fe2583cb94a
   32  docker ps -a
   34  docker ps
   35  docker start 4fe2583cb94a
   40  docker ps
   41  docker start d464938059db
   42  docker inspect d464938059db
   43  docker ps
   44  docker inspect 4fe2583cb94a
   46  docker inspect 4fe2583cb94a | grep "IPAddress"
   48  docker run -d -p 9999:80 --name NginxServer3 nginx:latest
   50  docker ps -a
   52  docker ps -a
   54  docker search tomcat
   55  docker pull tomcat
   56  docker run -d --name TOMCATisCOOL tomcat 
   58  docker ps -a
   59  docker inspect b8640ee79cf6