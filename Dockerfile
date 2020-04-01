FROM debian:stable-slim

## ffsend version
ENV FFSEND_VERSION=0.2.59

RUN \
  apt-get update -qq&& \
  apt-get install -y -qq \
    curl && \
  curl -OL https://github.com/timvisee/ffsend/releases/download/v${FFSEND_VERSION}/ffsend-v${FFSEND_VERSION}-linux-x64-static && \
  mv ./ffsend-* ./ffsend && \
  chmod a+x ./ffsend && \
  mv ./ffsend /usr/local/bin/ && \
  ffsend version


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
