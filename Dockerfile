FROM ghcr.io/dockhippie/alpine:3.18
ENTRYPOINT [""]

# renovate: datasource=npm depName=@commitlint/cli
ENV COMMITLINT_CLI_VERSION=19.0.1

# renovate: datasource=npm depName=@commitlint/config-conventional
ENV COMMITLINT_CONFIG_VERSION=19.0.0

RUN apk update && \
  apk upgrade && \
  apk add nodejs npm git && \
  npm install --global \
    @commitlint/cli@${COMMITLINT_CLI_VERSION} \
    @commitlint/config-conventional@${COMMITLINT_CONFIG_VERSION} && \
  echo 'module.exports = {extends: ["/usr/local/lib/node_modules/@commitlint/config-conventional"]};' > /etc/commitlint.config.js && \
  rm -rf /var/cache/apk/*
