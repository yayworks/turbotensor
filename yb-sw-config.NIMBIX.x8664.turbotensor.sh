
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


wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh

(
bash Anaconda3-4.4.0-Linux-x86_64.sh <<EOF
yes
yes
EOF

) > com.out

rm com.out

###This finally did work

/root/anaconda3/bin/conda create -n tensorflow python=3.6 <<EOF
y
EOF

source /root/anaconda3/bin/activate tensorflow

/root/anaconda3/bin/conda install -c conda-forge tensorflow <<EOF
y
EOF

exit 0


