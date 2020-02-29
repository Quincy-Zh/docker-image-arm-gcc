FROM ubuntu:18.04

WORKDIR /work

ADD . /work

RUN find /etc/apt/ -name "*.list" -print0 | xargs -0 sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g'
RUN find /etc/apt/ -name "*.list" -print0 | xargs -0 sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g'

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y \
      build-essential \
      git \
      bzip2 \
      cmake \
      make \
      python3 \
      python3-pip \
      wget
RUN apt-get clean
RUN wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2 | tar -xj

ENV PATH "/work/gcc-arm-none-eabi-8-2019-q3-update/bin:$PATH"


