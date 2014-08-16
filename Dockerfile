FROM ubuntu:14.04
MAINTAINER Peter Mescalchin "peter@magnetikonline.com"

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install autoconf checkinstall libtool make nasm
RUN apt-get clean

RUN mkdir /root/build
ADD https://github.com/mozilla/mozjpeg/archive/v2.1.tar.gz /root/build/
WORKDIR /root/build
RUN tar xf v2.1.tar.gz

WORKDIR /root/build/mozjpeg-2.1
RUN autoreconf -fiv
RUN mkdir build
WORKDIR /root/build/mozjpeg-2.1/build

RUN ../configure && make
RUN echo "magnetikonline: mozjpeg v2.1" > description-pak && checkinstall -Dy --install=no --nodoc --pkgname=mozjpeg --pkgversion=2.1 make -i install

CMD ["/bin/bash"]
