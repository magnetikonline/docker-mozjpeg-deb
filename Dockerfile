FROM ubuntu:18.04
LABEL maintainer="Peter Mescalchin <peter@magnetikonline.com>"

ARG MOZJPEG_VERSION

RUN DEBIAN_FRONTEND="noninteractive" \
	apt-get update && \
	apt-get install --no-install-recommends --yes \
		automake \
		checkinstall \
		libpng-dev \
		libtool \
		make \
		nasm \
		pkg-config && \
	# clean up
	apt-get clean

ADD https://github.com/mozilla/mozjpeg/archive/v$MOZJPEG_VERSION.tar.gz /root/build/
WORKDIR /root/build
RUN tar --extract --file v$MOZJPEG_VERSION.tar.gz

WORKDIR /root/build/mozjpeg-$MOZJPEG_VERSION
RUN autoreconf -fiv
RUN mkdir build
WORKDIR /root/build/mozjpeg-$MOZJPEG_VERSION/build
RUN ../configure && make

RUN echo "magnetikonline: mozjpeg" >description-pak && \
	checkinstall \
		--default \
		--install=no \
		--nodoc \
		--pkgname=mozjpeg \
		--pkgversion=$MOZJPEG_VERSION \
		--type=debian \
			make --ignore-errors install

ENTRYPOINT ["/bin/bash"]
