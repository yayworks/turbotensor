
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
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV MPI_VERSION 2.0.1
ADD ./install-openmpi.sh /tmp/install-openmpi.sh
RUN /bin/bash -x /tmp/install-openmpi.sh && rm -rf /tmp/install-openmpi.sh

ENV OSU_VERSION 5.3.2
ADD ./install-osu.sh /tmp/install-osu.sh
RUN /bin/bash -x /tmp/install-osu.sh && rm -rf /tmp/install-osu.sh

ADD ./yb-sw-config.NIMBIX.x8664.turbotensor.sh /root/yb-sw-config.NIMBIX.x8664.turbotensor.sh
##RUN chmod +x /root/yb-sw-config.NIMBIX.x8664.turbotensor.sh \
##&&  /root/yb-sw-config.NIMBIX.x8664.turbotensor.sh \
##&& rm /root/yb-sw-config.NIMBIX.x8664.turbotensor.sh
##&& echo 'export PATH=/root/anaconda3/envs/tensorflow/bin:$PATH' >> /root/.bashrc \
##&& echo 'export PYTHONPATH=/root/anaconda3/envs/tensorflow/lib/python3.6:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/prettytensor-0.7.2-py3.6.egg:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/enum34-1.1.6-py3.6.egg:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/setuptools-27.2.0-py3.6.egg:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/matplotlib:$PYTHONPATH' >> /root/.bashrc \

##&& /usr/bin/wget https://github.com/google/prettytensor/archive/master.zip -P /root \
##&& unzip master.zip \
##&& rm master.zip \
##&& cd prettytensor-master \
##&& /root/anaconda3/envs/tensorflow/bin/python setup.py install \
##&& /root/anaconda3/envs/tensorflow/bin/pip install gym 

ADD ./NAE/help.html /etc/NAE/help.html
