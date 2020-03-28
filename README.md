# mozjpeg Dockerfile
Produces a `mozjpeg` binary deb distribution, suitable for Ubuntu (tested under 18.04LTS) and likely Debian variants.

Package built using [checkinstall](http://asic-linux.com.mx/~izto/checkinstall/).

The resulting binaries/libs are installed to `/opt/mozjpeg/` (as not to clash with `libjpeg-turbo*` packages).

Image has also been pushed to [Docker Hub](https://hub.docker.com/r/magnetikonline/mozjpegdeb/).

Not sure what mozjpeg is? https://github.com/mozilla/mozjpeg.

## Usage
```sh
$ ./build.sh
# waiting... as Docker builds image

# or alternatively to ./build.sh:
# $ docker pull magnetikonline/mozjpegdeb

$ ./extractdeb.sh
# package extract from container

$ ls -l mozjpeg_3.3.1-1_amd64.deb
-rw-r--r-- 1 root root 401960 Mar 28 23:29 mozjpeg_3.3.1-1_amd64.deb

$ sudo dpkg -i mozjpeg_3.3.1-1_amd64.deb
# installing package to host system...

$ /opt/mozjpeg/bin/jpegtran -v -version
mozjpeg version 3.3.1 (build 20200328)
Copyright (C) 2009-2017 D. R. Commander
Copyright (C) 2011-2016 Siarhei Siamashka
Copyright (C) 2015-2016 Matthieu Darbois
Copyright (C) 2015 Google, Inc.
Copyright (C) 2014 Mozilla Corporation
Copyright (C) 2013-2014 MIPS Technologies, Inc.
Copyright (C) 2013 Linaro Limited
Copyright (C) 2009-2011 Nokia Corporation and/or its subsidiary(-ies)
Copyright (C) 2009 Pierre Ossman for Cendio AB
Copyright (C) 1999-2006 MIYASAKA Masaru
Copyright (C) 1991-2016 Thomas G. Lane, Guido Vollbeding

Emulating The Independent JPEG Group's software, version 6b  27-Mar-1998

mozjpeg version 3.3.1 (build 20200328)
```

Done.
