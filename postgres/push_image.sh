#!/bin/bash

#sudo docker build -t $1 .
#
#sudo docker tag $2 madridgit:5000/$1:$2
#
#sudo docker push madridgit:5000/$1:$2

sudo docker build -t madridgit:5000/$1:$2 .

#sudo docker tag $2 madridgit:5000/$1:$2

sudo docker  push madridgit:5000/$1:$2

