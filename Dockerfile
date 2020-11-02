FROM ghcr.io/linuxserver/baseimage-cloud9:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
 echo "**** install basic ruby environment ****" && \
 apt-get update && \
 apt-get install -y \
	ruby-full && \
 HOME=/c9bins gem install \
	bundler && \
 echo "**** cleanup ****" && \
 apt-get autoclean && \
 rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*
