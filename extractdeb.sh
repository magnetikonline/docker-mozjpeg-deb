#!/bin/bash -e

DIRNAME=$(dirname "$0")


containerID=$(docker run --detach magnetikonline/buildmozjpeg)
docker cp "$containerID:/root/build/mozjpeg-3.3.1/build/mozjpeg_3.3.1-1_amd64.deb" "$DIRNAME"
sleep 1
docker rm $containerID
