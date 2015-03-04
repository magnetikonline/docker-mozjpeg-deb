# mozjpeg Dockerfile
Produces a working mozjpeg binary deb distribution, suitable for Ubuntu (tested under 14.04LTS) and possibly Debian/variants.

Docker image uses Ubuntu 14.04LTS as the base, deb package is produced using [checkinstall](http://asic-linux.com.mx/~izto/checkinstall/).

The resulting binaries/libs are installed to `/opt/mozjpeg/` (as not to clash with `libjpeg-turbo*` packages) - but you could always change `make` options or symlink things.

Not sure what mozjpeg is? See here: https://github.com/mozilla/mozjpeg.

## Usage
With Docker already installed and working on host system:

```sh
$ ./build.sh
# waiting... as Docker builds image

$ ./extractdeb.sh
# package extract from container

$ ls -l mozjpeg_3.0-1_amd64.deb
-rw-r--r-- 1 root root 384106 Mar  4 22:28 mozjpeg_3.0-1_amd64.deb

$ sudo dpkg -i mozjpeg_3.0-1_amd64.deb
# installing package to host system...

$ /opt/mozjpeg/bin/jpegtran -v
mozjpeg version 3.0 (build 20150304)
Copyright (C) 1991-2012 Thomas G. Lane, Guido Vollbeding
Copyright (C) 1999-2006 MIYASAKA Masaru
Copyright (C) 2009 Pierre Ossman for Cendio AB
Copyright (C) 2009-2014 D. R. Commander
Copyright (C) 2009-2011 Nokia Corporation and/or its subsidiary(-ies)
Copyright (C) 2014 Mozilla Corporation
Copyright (C) 2013-2014 MIPS Technologies, Inc.
Copyright (C) 2013 Linaro Limited

Emulating The Independent JPEG Group's software, version 6b  27-Mar-1998
```

Done.
