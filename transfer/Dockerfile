FROM alpine:3.11
RUN apk add --no-cache \
  openssh-client \
  ca-certificates \
  tar \
  bash

COPY transfer.sh /

RUN chmod +x /transfer.sh

ENTRYPOINT ["/transfer.sh"]