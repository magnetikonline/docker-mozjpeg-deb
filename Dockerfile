FROM ubuntu:14.04.1
MAINTAINER Peter Mescalchin "peter@magnetikonline.com"

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install autoconf checkinstall libpng12-dev libtool make nasm pkg-config
RUN apt-get clean

RUN mkdir /root/build
ADD https://github.com/mozilla/mozjpeg/archive/v3.0.tar.gz /root/build/
WORKDIR /root/build
RUN tar xf v3.0.tar.gz

WORKDIR /root/build/mozjpeg-3.0
RUN autoreconf -fiv
RUN mkdir build
WORKDIR /root/build/mozjpeg-3.0/build

RUN ../configure && make
RUN echo "magnetikonline: mozjpeg v3.0" > description-pak && checkinstall -Dy --install=no --nodoc --pkgname=mozjpeg --pkgversion=3.0 make -i install

CMD ["/bin/bash"]
