FROM ubuntu:18.04
USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV GOVERSION=1.13.8
ENV GOPATH=$HOME/go
ENV GOENV_ROOT=$HOME/.goenv
ENV PATH=bin:$GOENV_ROOT/bin:$GOPATH/bin:$PATH


RUN apt-get -qq update && \
    apt-get -qqy install git

RUN git clone https://github.com/syndbg/goenv.git ~/.goenv
RUN goenv init -
RUN goenv install $GOVERSION

RUN apt clean && rm -rf /var/lib/apt/lists/*

ARG workspace=/app/
WORKDIR $workspace
