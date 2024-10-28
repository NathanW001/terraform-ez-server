#!/bin/bash

# This part is setup for docker, I wouldn't recommend changing it unless you know what you're doing
cd home/ec2-user
sudo yum update -y
sudo yum -y install docker
sudo service docker start

# Here you can add the code you need for things like git clones and running Dockerfiles.
# Some things that may be useful include:
# sudo yum -y install git

sudo docker run -d -p 80:80 -p 443:443 nginx
