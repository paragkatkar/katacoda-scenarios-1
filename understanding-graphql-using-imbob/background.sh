#!/usr/bin/env bash
#get the source from git hub
git clone https://github.com/reselbob/IMBOB.git

#go into the app folder
cd /root/IMBOB

#build the container image
docker build -t imbob .

#run the container image
docker run -d -p 4000:4000 imbob
