ARG DOCKER_VERSION=dind
FROM docker:${DOCKER_VERSION}

ARG COMPOSE_VERSION=
ARG DOCKER_VERSION

RUN apk add --no-cache py3-pip python3
RUN apk add --no-cache --virtual build-dependencies python3-dev libffi-dev openssl-dev gcc libc-dev make \
  && pip3 install "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}" \
  && apk del build-dependencies

RUN apk add --no-cache git

RUN apk add --no-cache wget

RUN wget https://github.com/mikefarah/yq/releases/download/3.2.1/yq_linux_amd64 -O /usr/bin/yq

RUN chmod +x /usr/bin/yq

RUN git config --global user.email "gitlab@gitlab.com"

RUN git config --global user.name "GitLab CI/CD"