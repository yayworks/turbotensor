
FROM nimbix/base-ubuntu-nvidia:8.0-cudnn5-devel
MAINTAINER Nimbix, Inc. <support@nimbix.net>

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget \
    libibverbs-dev \
    libibverbs1 \
    librdmacm1 \
    librdmacm-dev \
    rdmacm-utils \
    libibmad-dev \
    libibmad5 \
    byacc \
    libibumad-dev \
    libibumad3 \
    flex && \
    apt-get install -y python3.4 && \
    apt-get install -y python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install virtualenv

ENV MPI_VERSION 2.0.1
ADD ./install-ompi.sh /tmp/install-ompi.sh
RUN /bin/bash -x /tmp/install-ompi.sh && \
    rm -rf /tmp/install-ompi.sh

ENV OSU_VERSION 5.3.2
ADD ./install-osu.sh /tmp/install-osu.sh
RUN /bin/bash -x /tmp/install-osu.sh && rm -rf /tmp/install-osu.sh

ADD ./yb-sw-config.NIMBIX.x8664.turbotensor.sh /tmp/yb-sw-config.NIMBIX.x8664.turbotensor.sh
RUN /bin/bash -x /tmp/yb-sw-config.NIMBIX.x8664.turbotensor.sh 

ADD ./config.sh /usr/local/config.sh
ADD ./start.sh /usr/local/start.sh
ADD ./setup.x /usr/local/setup.x
RUN chmod +x /usr/local/config.sh && chown nimbix.nimbix /usr/local/config.sh && \
    chmod +x /usr/local/start.sh && chown nimbix.nimbix /usr/local/start.sh && \
    chmod +x /usr/local/setup.x && chown nimbix.nimbix /usr/local/setup.x 

ADD ./NAE/help.html /etc/NAE/help.html
