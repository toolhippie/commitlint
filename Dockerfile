FROM ghcr.io/dockhippie/alpine:3.23@sha256:0c390b9f9e8a5a78f0fd573548d2a13e035893de9ed1342ebcb7d33e02a912c2
ENTRYPOINT [""]

# renovate: datasource=npm depName=@commitlint/cli
ENV COMMITLINT_CLI_VERSION=21.2.3

# renovate: datasource=npm depName=@commitlint/config-conventional
ENV COMMITLINT_CONFIG_VERSION=21.2.3

RUN apk update && \
  apk upgrade && \
  apk add nodejs npm git && \
  npm install --global \
    @commitlint/cli@${COMMITLINT_CLI_VERSION} \
    @commitlint/config-conventional@${COMMITLINT_CONFIG_VERSION} && \
  echo 'module.exports = {extends: ["/usr/local/lib/node_modules/@commitlint/config-conventional/lib/index.js"]};' > /etc/commitlint.config.js && \
  rm -rf /var/cache/apk/*
