# mozjpeg Dockerfile
Produces a working mozjpeg binary deb distribution, suitable for Ubuntu (tested under 14.04LTS) and possibly Debian/variants.

Docker image uses Ubuntu 14.04LTS as the base, deb package is produced using [checkinstall](http://asic-linux.com.mx/~izto/checkinstall/).

The resulting binaries/libs are installed to `/opt/libmozjpeg/` (probably as not to mess with `libjpeg-turbo*` packages) - but you could always change make options or symlink things.

## Usage
With Docker already installed and working on host system:

```sh
$ ./build.sh
# waiting... as Docker builds image

$ ./extractdeb.sh
# package extract from container

$ ls -l mozjpeg_2.0.1-1_amd64.deb
-rw-r--r-- 1 root root 357528 Aug 11 16:54 mozjpeg_2.0.1-1_amd64.deb

$ sudo dpkg -i mozjpeg_2.0.1-1_amd64.deb
# installing package to host system...

$ /opt/libmozjpeg/bin/jpegtran -v
libmozjpeg version 2.0.1 (build 20140811)
Copyright (C) 1991-2012 Thomas G. Lane, Guido Vollbeding
Copyright (C) 1999-2006 MIYASAKA Masaru
Copyright (C) 2009 Pierre Ossman for Cendio AB
Copyright (C) 2009-2013 D. R. Commander
Copyright (C) 2009-2011 Nokia Corporation and/or its subsidiary(-ies)
Copyright (C) 2014 Mozilla Corporation


Emulating The Independent JPEG Group's software, version 6b  27-Mar-1998
```

Done.
