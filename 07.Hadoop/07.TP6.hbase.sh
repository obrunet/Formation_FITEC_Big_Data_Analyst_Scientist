hbase shell
status


# if zookeeper is dead relaunch docker
docker rm $(docker ps -a -q) --force
docker run --name=cloudera --hostname=quickstart.cloudera --cpus=4 -m=8g --privileged=true -t -i -v `pwd`:/src --publish-all=true -p 8888:8888 -p 7180:7180 cloudera/quickstart /usr/bin/docker-quickstart

# retry
hbase shell
status