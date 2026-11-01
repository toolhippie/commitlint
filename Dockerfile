FROM ghcr.io/dockhippie/alpine:3.23@sha256:1194c744e2b2a03ecb3214aecb89005830fa422b4a8f84cd12951d6d29df7a4c
ENTRYPOINT [""]

# renovate: datasource=npm depName=@commitlint/cli
ENV COMMITLINT_CLI_VERSION=21.2.4

# renovate: datasource=npm depName=@commitlint/config-conventional
ENV COMMITLINT_CONFIG_VERSION=21.2.4

RUN apk update && \
  apk upgrade && \
  apk add nodejs npm git && \
  npm install --global \
    @commitlint/cli@${COMMITLINT_CLI_VERSION} \
    @commitlint/config-conventional@${COMMITLINT_CONFIG_VERSION} && \
  echo 'module.exports = {extends: ["/usr/local/lib/node_modules/@commitlint/config-conventional/lib/index.js"]};' > /etc/commitlint.config.js && \
  rm -rf /var/cache/apk/*
