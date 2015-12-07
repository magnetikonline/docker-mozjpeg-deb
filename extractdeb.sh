#!/bin/bash -e

containerID=$(docker run -d magnetikonline/buildmozjpeg)
docker cp $containerID:/root/build/mozjpeg-3.1/build/mozjpeg_3.1-1_amd64.deb .
sleep 1
docker rm $containerID
