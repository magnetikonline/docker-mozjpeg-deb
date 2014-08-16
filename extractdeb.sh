#!/bin/bash

containerID=`sudo docker run -d magnetikonline/buildmozjpeg`
sudo docker cp $containerID:/root/build/mozjpeg-2.1/build/mozjpeg_2.1-1_amd64.deb .
sleep 1
sudo docker rm $containerID
