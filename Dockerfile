FROM ubuntu:18.04

MAINTAINER Tim Koepsel <xzesstence@gmail.com>


WORKDIR /srv/ragemp

RUN \
apt-get update && apt-get install vim -q -y && \
apt-get install git -q -y && \
apt-get install lsof -q -y && \
apt-get install sudo -q -y && \
apt-get install curl -q -y


# Install required packages
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
      ca-certificates \
      openssh-server \
      wget \
      apt-transport-https \
      vim \
      nano \
      software-properties-common

RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
apt update && apt -q -y install libstdc++6

# Downloading server
RUN wget https://cdn.rage.mp/lin/ragemp-srv-037.tar.gz && \
tar -xzf ragemp-srv-037.tar.gz && cd ragemp-srv && chmod +x server

ENTRYPOINT ./server && /bin/bash
