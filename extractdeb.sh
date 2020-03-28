#!/bin/bash -e

DIRNAME=$(dirname "$0")


. "$DIRNAME/version"

containerID=$(docker run --detach "magnetikonline/buildmozjpeg:$MOZJPEG_VERSION")
docker cp "$containerID:/root/build/mozjpeg-$MOZJPEG_VERSION/build/mozjpeg_$MOZJPEG_VERSION-1_amd64.deb" "$DIRNAME"
sleep 1
docker rm $containerID
