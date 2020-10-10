FROM python:3-alpine

LABEL maintainer="Guan Bo <guanbo2002@gmail.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
VOLUME "/project"

WORKDIR "/project"

RUN apk update && \
    apk upgrade && \
    apk --update add \
        linux-headers \
        gcc \
        g++ \
        build-base \
        cmake \
        bash \
        libstdc++ \
        cppcheck \
        openssl-dev \
        openjdk8 \
        maven && \
        pip install -i https://mirrors.aliyun.com/pypi/simple/ conan && \
    rm -rf /var/cache/apk/*

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

RUN cd /usr/bin && ln -s python3 python && ln -s pip3 pip

ENTRYPOINT [ "bash", "-c" ]
