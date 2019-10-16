FROM mitinarseny/texlive

RUN apt-get update \
  && apt-get install --fix-broken --yes \
    curl \
    tzdata \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
# We install zlib1g, as we will need it later on.
# We install librsvg2 in order to make svg -> pdf conversation possible.
# imagemagick may be needed by the latex-formulae-pandoc filter
  && apt-get install --fix-broken --yes \
    imagemagick \
    librsvg2-bin \
    librsvg2-common \
    zlib1g \
    zlib1g-dev \
    nodejs \
# fix the access rights for imagemagick
  && sed -i -e 's/rights="none"/rights="read|write"/g' /etc/ImageMagick-6/policy.xml \
  && sed -i -e 's/<\/policymap>/<policy domain="module" rights="read|write" pattern="{PS,PDF,XPS}" \/>\n<\/policymap>/g' /etc/ImageMagick-6/policy.xml \
  && apt-get clean \
  && apt-get autoclean --yes \
  && apt-get autoremove --yes \
  && rm -rf \
    /tmp/* \
    /var/tmp/* \
    /var/lib/apt/lists/* \
    /etc/ssh/ssh_host_*

ARG PANDOC_VERSION=2.7.3
RUN curl -sL "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb" --output /tmp/pandoc-${PANDOC_VERSION}-1-amd64.deb \
  && dpkg -i /tmp/pandoc-${PANDOC_VERSION}-1-amd64.deb \
  && rm /tmp/pandoc-${PANDOC_VERSION}-1-amd64.deb

RUN PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1 npm install --global mermaid-filter

WORKDIR /data

ENTRYPOINT [""]
CMD ["pandoc", "--help"]
