#!/bin/bash -e

DIRNAME=$(dirname "$0")


. "$DIRNAME/version"

docker build \
	--build-arg "MOZJPEG_VERSION=$MOZJPEG_VERSION" \
	--tag "magnetikonline/mozjpeg-deb:$MOZJPEG_VERSION" \
		"$DIRNAME"
