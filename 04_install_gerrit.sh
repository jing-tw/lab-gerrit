#!/bin/bash

# Install docker
. ./common_fun.sh
fun_install_docker

# Pull and Start gerrit
sudo docker run -d -p 8080:8080 -p 29418:29418 openfrontier/gerrit

# Verification
firefox http://127.0.0.1:8080
