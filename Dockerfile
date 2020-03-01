FROM ubuntu:18.04

WORKDIR /work

ADD . /work

RUN find /etc/apt/ -name "*.list" -print0 | xargs -0 sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' && \
    find /etc/apt/ -name "*.list" -print0 | xargs -0 sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' && \

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  && \
      cmake && \
      make && \
    apt-get clean
