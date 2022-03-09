# Copyright 2022, e1z0
# Copyright 2018, Andrew Lindesay
# Distributed under the terms of the MIT License.

FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install git nasm autoconf automake texinfo flex bison gawk build-essential unzip wget zip less zlib1g-dev libzstd1-dev xorriso libtool gcc-multilib python3 bc

COPY assets/buildjam.sh /haiku-support/buildjam.sh
COPY assets/buildhaiku.sh /haiku-support/buildhaiku.sh

RUN /bin/bash /haiku-support/buildjam.sh

CMD  [ "/bin/bash", "/haiku-support/buildhaiku.sh" ]


