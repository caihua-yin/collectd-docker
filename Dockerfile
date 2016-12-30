FROM debian:jessie
MAINTAINER Caihua Yin <alend.yin@gmail.com>

ENV COLLECTD_VERSION 5.7.0
ENV WORKDIR /opt/collectd

#ENV HOSTNAME <PLEASE SUPPLY!>
ENV SINK_SERVER localhost
ENV SINK_PORT 25826

RUN apt-get update && apt-get install -y wget lbzip2 build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://collectd.org/files/collectd-${COLLECTD_VERSION}.tar.bz2 && \
    tar xf collectd-${COLLECTD_VERSION}.tar.bz2 && cd collectd-${COLLECTD_VERSION} && \
    ./configure --prefix=${WORKDIR} && make all install && \
    rm -rf collectd-5.7.0.tar.bz2 collectd-5.7.0

COPY collectd.conf ${WORKDIR}/etc/collectd.conf
COPY run.sh ${WORKDIR}/run.sh

CMD ${WORKDIR}/run.sh
