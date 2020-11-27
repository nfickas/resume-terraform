#! /bin/bash

sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo docker pull nfickas15/resume-dev:main
sudo docker run -p 80:3000 nfickas15/resume-dev:main &