# Set the base image
FROM ubuntu:16.04

# Dockerfile author / maintainer 
MAINTAINER Name <forpdfsending@gmail.com> 

RUN apt update && apt upgrade -y

ARG DEBIAN_FRONTEND=noninteractive

# Step for building Python 3.3.5
RUN apt-get install -y sudo apt-utils
RUN apt-get install -y gcc make git unzip wget xz-utils locales

RUN sudo dpkg-reconfigure dash

SHELL ["/bin/bash", "-c"]
ARG DEBIAN_FRONTEND=noninteractive

RUN git config --global user.email "your@email.com"
RUN git config --global user.name "yourusername"

RUN locale-gen en_US.UTF-8 \
 && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN adduser --disabled-password --gecos '' docker \
 && adduser docker sudo \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
 
RUN apt-get install -y wget bash bc gcc sed patch patchutils tar bzip2 gzip perl gawk gperf zip unzip diffutils texinfo lzop python g++ xfonts-utils xfonts-utils xfonts-utils xsltproc default-jre-headless libc6-dev libncurses5-dev u-boot-tools xz-utils make file libxml-parser-perl libjson-perl golang-go git openssh-client --no-install-recommends 
	
USER docker