#!/bin/bash

# Setup IP
if [ -z "$ip" ]; then 
    ip=127.0.0.1
    normal_run=true
fi
echo "ip=$ip"

# Install Package
. ./common_fun.sh
fun_setup_locale
fun_install_docker 

# Pull and Start gerrit
sudo docker run -d -p 8080:8080 -p 29418:29418 --restart=always -e WEBURL=http://$ip:8080 openfrontier/gerrit

# Verification
if [ -n "$normal_run" ]; then
    echo Wait for gerrit service start ...
    sleep 10
    firefox http://127.0.0.1:8080&
fi
