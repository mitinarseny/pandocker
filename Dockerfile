FROM mitinarseny/texlive

RUN apt-get update \
  && apt-get install --fix-broken --yes \
    tzdata \
# We install cabal, a Haskell package manager, because we want the newest
# pandoc and filters which we can only get from there.
# We also install zlib1g, as we will need it later on.
# We install librsvg2 in order to make svg -> pdf conversation possible.
# imagemagick may be needed by the latex-formulae-pandoc filter
  && apt-get install -f -y \
    cabal-install \
    imagemagick \
    librsvg2-bin \
    librsvg2-common \
    zlib1g \
    zlib1g-dev \
# fix the access rights for imagemagick
  && sed -i -e 's/rights="none"/rights="read|write"/g' /etc/ImageMagick-6/policy.xml \
  && sed -i -e 's/<\/policymap>/<policy domain="module" rights="read|write" pattern="{PS,PDF,XPS}" \/>\n<\/policymap>/g' /etc/ImageMagick-6/policy.xml \
# get the newest list of packages
  && cabal update \
# install the dependencies of the packages we want
  && cabal install --dependencies-only \
    pandoc \
    pandoc-citeproc \
    pandoc-citeproc-preamble \
    pandoc-crossref \
    latex-formulae-pandoc \
# install the packages we want
  && cabal install \
    pandoc \
    pandoc-citeproc \
    pandoc-citeproc-preamble \
    pandoc-crossref \
    latex-formulae-pandoc \
# clear unnecessary cabal files
  && rm -rf \
    /root/.cabal/logs \
    /root/.cabal/packages \
# clean up all temporary files
  && apt-get clean \
  && apt-get autoclean --yes \
  && apt-get autoremove --yes \
  && rm -rf \
    /tmp/* \
    /var/tmp/* \
    /var/lib/apt/lists/* \
    /etc/ssh/ssh_host_*

# add pandoc to the path
ENV PATH=/root/.cabal/bin/:${PATH}

ENTRYPOINT ["pandoc"]
CMD ["--help"]
