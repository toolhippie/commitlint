FROM ghcr.io/dockhippie/alpine:3.19
ENTRYPOINT [""]

# renovate: datasource=npm depName=@commitlint/cli
ENV COMMITLINT_CLI_VERSION=18.4.3

# renovate: datasource=npm depName=@commitlint/config-conventional
ENV COMMITLINT_CONFIG_VERSION=18.4.3

RUN apk update && \
  apk upgrade && \
  apk add nodejs npm git && \
  rm -rf /var/cache/apk/*

RUN npm install --global \
    @commitlint/cli@${COMMITLINT_CLI_VERSION} \
    @commitlint/config-conventional@${COMMITLINT_CONFIG_VERSION} && \
    echo 'module.exports = {extends: ["/usr/local/lib/node_modules/@commitlint/config-conventional"]};' > /etc/commitlint.config.js
