# if the image comes from a downloaded file :
sudo docker load -i <path to copied image zip file>

# then run the container
docker run -it --rm -p 8888:8888 jupyter/all-spark-notebook

# use your web brwoser with the token
localhost:8888

# or with a volume (launch the cmd from this dir)
docker run -it --rm -v `pwd`:/src -p 8888:8888 jupyter/all-spark-notebook
docker exec -it <container name> /bin/bash


