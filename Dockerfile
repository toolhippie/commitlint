FROM ghcr.io/dockhippie/alpine:3.23@sha256:c2218a341d02631f8fe99633a9daef146324b9a0b8a1269c2410446f04034319
ENTRYPOINT [""]

# renovate: datasource=npm depName=@commitlint/cli
ENV COMMITLINT_CLI_VERSION=20.4.3

# renovate: datasource=npm depName=@commitlint/config-conventional
ENV COMMITLINT_CONFIG_VERSION=20.4.3

RUN apk update && \
  apk upgrade && \
  apk add nodejs npm git && \
  npm install --global \
    @commitlint/cli@${COMMITLINT_CLI_VERSION} \
    @commitlint/config-conventional@${COMMITLINT_CONFIG_VERSION} && \
  echo 'module.exports = {extends: ["/usr/local/lib/node_modules/@commitlint/config-conventional"]};' > /etc/commitlint.config.js && \
  rm -rf /var/cache/apk/*
