
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
ADD ./install-openmpi.sh /tmp/install-openmpi.sh
RUN /bin/bash -x /tmp/install-openmpi.sh && rm -rf /tmp/install-openmpi.sh

ENV OSU_VERSION 5.3.2
ADD ./install-osu.sh /tmp/install-osu.sh
RUN /bin/bash -x /tmp/install-osu.sh && rm -rf /tmp/install-osu.sh

RUN wget https://s3.amazonaws.com/yb-lab-cfg/pnnl_tf_v2.tar.gz
RUN tar xvfpz pnnl_tf_v2.tar.gz
WORKDIR /root/cpu/py3.x

ENV PNETCDF_INSTALL_DIR parallel-netcdf-1.7.0
ENV TF_INSTALL_DIR /root/cpu/py3.x

RUN /bin/bash -c "source /root/cpu/py3.x/setAlias.sh"
RUN /bin/bash -c "source /root/cpu/py3.x/install_mpi_tf.sh"

##USER nimbix
##WORKDIR /home/nimbix

##COPY ./yb-sw-config.NIMBIX.x8664.turbotensor.sh /root/yb-sw-config.NIMBIX.x8664.turbotensor.sh
##RUN chmod +x /root/yb-sw-config.NIMBIX.x8664.turbotensor.sh 
##RUN /root/yb-sw-config.NIMBIX.x8664.turbotensor.sh 

##RUN rm /root/yb-sw-config.NIMBIX.x8664.turbotensor.sh 
##RUN echo 'export PATH=/root/anaconda3/envs/tensorflow/bin:$PATH' >> /root/.bashrc 
##RUN echo 'export PYTHONPATH=/root/anaconda3/envs/tensorflow/lib/python3.6:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/prettytensor-0.7.2-py3.6.egg:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/enum34-1.1.6-py3.6.egg:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/setuptools-27.2.0-py3.6.egg:/root/anaconda3/envs/tensorflow/lib/python3.6/site-packages/matplotlib:$PYTHONPATH' >> /root/.bashrc 

##RUN wget https://github.com/google/prettytensor/archive/master.zip -P /root 
##RUN unzip master.zip 
##RUN rm master.zip 
##RUN cd prettytensor-master 
##RUN /root/anaconda3/envs/tensorflow/bin/python setup.py install 
##RUN sudo /usr/local/anaconda3/envs/tensorflow/bin/pip install tensorflow
##RUN sudo /usr/local/anaconda3/envs/tensorflow/bin/pip install keras
##RUN sudo /usr/local/anaconda3/envs/tensorflow/bin/pip install prettytensor 
##RUN sudo /usr/local/anaconda3/envs/tensorflow/bin/pip install gym

ADD ./NAE/help.html /etc/NAE/help.html
