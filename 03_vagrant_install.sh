#!/bin/bash
username=jing
ip=192.168.33.10
ssh-keygen -f ~/.ssh/known_hosts -R $ip

# setup necessary files
sshpass -p 1234 scp -o StrictHostKeyChecking=no ./common_fun.sh $username@$ip:/home/$username
sshpass -p 1234 scp -o StrictHostKeyChecking=no ./04_install_gerrit.sh $username@$ip:/home/$username

# run remote install
sshpass -p 1234 ssh -o StrictHostKeyChecking=no -t $username@$ip ". ./04_install_gerrit.sh"
