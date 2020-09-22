FROM openjdk:8-jdk-alpine

LABEL maintainer="Michele Adduci <adduci.michele@gmail.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
VOLUME "/project"

WORKDIR "/project"

RUN apk update && \
    apk upgrade && \
    apk --update add \
        maven \
        gcc \
        g++ \
        build-base \
        cmake \
        bash \
        libstdc++ \
        cppcheck \
        openssl-dev \
        py3-pip && \
        pip3 install -i https://mirrors.aliyun.com/pypi/simple/ conan && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "bash", "-c" ]
