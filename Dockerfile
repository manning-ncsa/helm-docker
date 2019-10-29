FROM alpine

ENV URL='https://get.helm.sh/helm-v2.15.1-linux-amd64.tar.gz'

RUN apk add --no-cache curl && \
    curl -L ${URL} | tar xvz && \
    cp linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del curl

WORKDIR /apps

ENTRYPOINT ["helm"]
CMD ["--help"]
