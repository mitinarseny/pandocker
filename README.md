# [mitinarseny/pandoc](http://hub.docker.com/r/mitinarseny/pandoc/)

[![Docker Pulls](http://img.shields.io/docker/pulls/mitinarseny/pandoc?style=flat-square)](http://hub.docker.com/r/mitinarseny/pandoc)
[![Docker Stars](http://img.shields.io/docker/stars/mitinarseny/pandoc?style=flat-square)](http://hub.docker.com/r/mitinarseny/pandoc)

This is a Docker image containing a [`pandoc`](http://pandoc.org/) installation which can make use of our [`TeX Live`](http://en.wikipedia.org/wiki/TeX_Live) installation from container [mitinarseny/texlive](http://hub.docker.com/r/mitinarseny/texlive), which in turn provides some useful scripts and several fonts.

We install [`pandoc`](http://pandoc.org/) via [`cabal`](http://www.haskell.org/cabal/), a package building and distribution system, which allows us to get the newest `pandoc` version as well as several filters.

## 1. Building and Components

The image has the following components:

- [`TeX Live`](http://www.tug.org/texlive/)
- [`ghostscript`](http://ghostscript.com/)
- [`poppler-utils`](http://poppler.freedesktop.org/)
- [`cabal`](http://www.haskell.org/cabal/)
- [`pandoc`](http://pandoc.org/)
- [`imagemagick`](http://www.imagemagick.org/)
- several `pandoc` filters, namely
   + [`pandoc-citeproc`](http://github.com/jgm/pandoc-citeproc),
   + [`pandoc-crossref`](http://github.com/lierdakil/pandoc-crossref),
   + [`latex-formulae-pandoc`](http://github.com/liamoc/latex-formulae), and
   + [`pandoc-citeproc-preamble`](http://github.com/spwhitton/pandoc-citeproc-preamble)

## 2. License

This image is licensed under the GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007, which you can find in file [LICENSE](LICENSE). The license applies to the way the image is built, while the software components inside the image are under the respective licenses chosen by their respective copyright holders.
