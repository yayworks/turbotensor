
#!/bin/bash
####################################################################################################
#                                                                                                  #
# yb--sw-config.NIMBIX.x8664.turbotensor.sh - Software installs & configuration for Ubuntu TF Lab  #
#                                                                                                  #
# Copyright (C) 2017 Yayworks, Inc. - All Rights Reserved                                          #
#                                                                                                  #
# Last revised 07/26/2017                                                                          #
#                                                                                                  #
####################################################################################################


#wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh

#(
#sudo bash Anaconda3-4.4.0-Linux-x86_64.sh <<EOF

#yes
#/usr/local/anaconda3
#EOF

#) > com.out

#rm com.out


###This finally did work

#sudo /usr/local/anaconda3/bin/conda create -n tensorflow python=3.6 <<EOF
#y
#EOF

#source /usr/local/anaconda3/bin/activate tensorflow

#sudo /usr/local/anaconda3/bin/conda install -c conda-forge tensorflow <<EOF
#y
#EOF
cd /tmp
wget https://s3.amazonaws.com/yb-lab-cfg/pnnl_tf_v2.tar.gz
tar xvfpz pnnl_tf_v2.tar.gz
###WORKDIR /root/cpu/py3.x

export PNETCDF_INSTALL_DIR=parallel-netcdf-1.7.0
export TF_INSTALL_DIR=/root/cpu/py3.x

cd /tmp/cpu/py3.x
source /tmp/cpu/py3.x/setAlias.sh
source /tmp/cpu/py3.x/install_mpi_tf.sh

cd /home/nimbix
wget https://s3.amazonaws.com/yb-lab-cfg/ptf_examples.tar.gz
tar xvfpz ptf_examples.tar.gz
rm ptf_examples.tar.gz
chown -R nimbix.nimbix ptf_examples



exit 0




