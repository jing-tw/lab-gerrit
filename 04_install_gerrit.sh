#!/bin/bash

# Install Package
. ./common_fun.sh
fun_setup_locale
fun_install_docker 

# Pull and Start gerrit
sudo docker run -d -p 8080:8080 -p 29418:29418 --restart=always openfrontier/gerrit

# Verification
firefox http://127.0.0.1:8080&
