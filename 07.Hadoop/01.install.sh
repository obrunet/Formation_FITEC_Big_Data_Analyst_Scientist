# install package for exfat if need to get the file form an usb key
apt install exfat-utils exfat-fuse

# extract tar archive
tar xzf cloudera-quickstart-vm-*-docker.tar.gz 

# import image docker
docker import - cloudera/quickstart:latest < cloudera-quickstart-vm-*-docker/*.tar
or
cd folder
docker import - cloudera/quickstart:latest < cloudera-quickstart-vm-*-docker*.tar

# check if image is present
docker images

# run images with port mapping, if you've not got the file it'll pull it from dockerhub while launching the run
docker run --name=cloudera --hostname=quickstart.cloudera --cpus=4 -m=8g --privileged=true -t -i -v `pwd`:/src --publish-all=true -p 8888:8888 -p 7180:7180 cloudera/quickstart /usr/bin/docker-quickstart

# connect to the web ui
http://localhost:8888

# if you exit docker and want to re-run it, first remove the container then relaunch the image
docker rm $(docker ps -a -q) --force


# to launch another shell
sudo docker exec -ti cloudera bash


