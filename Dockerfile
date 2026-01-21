FROM ghcr.io/dockhippie/alpine:3.23@sha256:dd0a8a957cb409bde4a96e04af7b59b16f3436817784c67afb9b6bc431672e3e
ENTRYPOINT [""]

# renovate: datasource=npm depName=@commitlint/cli
ENV COMMITLINT_CLI_VERSION=20.3.1

# renovate: datasource=npm depName=@commitlint/config-conventional
ENV COMMITLINT_CONFIG_VERSION=20.3.1

RUN apk update && \
  apk upgrade && \
  apk add nodejs npm git && \
  npm install --global \
    @commitlint/cli@${COMMITLINT_CLI_VERSION} \
    @commitlint/config-conventional@${COMMITLINT_CONFIG_VERSION} && \
  echo 'module.exports = {extends: ["/usr/local/lib/node_modules/@commitlint/config-conventional"]};' > /etc/commitlint.config.js && \
  rm -rf /var/cache/apk/*
