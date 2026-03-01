FROM ghcr.io/dockhippie/alpine:3.23@sha256:ecf1af2fb0a1dd8a7c5db631a254ac3b77fcb53c51b18ab7bc8548699afad289
ENTRYPOINT [""]

# renovate: datasource=npm depName=@commitlint/cli
ENV COMMITLINT_CLI_VERSION=20.4.2

# renovate: datasource=npm depName=@commitlint/config-conventional
ENV COMMITLINT_CONFIG_VERSION=20.4.2

RUN apk update && \
  apk upgrade && \
  apk add nodejs npm git && \
  npm install --global \
    @commitlint/cli@${COMMITLINT_CLI_VERSION} \
    @commitlint/config-conventional@${COMMITLINT_CONFIG_VERSION} && \
  echo 'module.exports = {extends: ["/usr/local/lib/node_modules/@commitlint/config-conventional"]};' > /etc/commitlint.config.js && \
  rm -rf /var/cache/apk/*
