#!/bin/bash
username=jing
ip=192.168.33.10
ssh-keygen -f ~/.ssh/known_hosts -R $ip
sshpass -p 1234 scp -o StrictHostKeyChecking=no ./common_fun.sh $username@$ip:/home/$username
sshpass -p 1234 ssh -o StrictHostKeyChecking=no -t $username@$ip ". ./common_fun.sh;fun_setup_locale"

sshpass -p 1234 scp -o StrictHostKeyChecking=no ./alfres*.bin $username@$ip:/home/$username
sshpass -p 1234 ssh -o StrictHostKeyChecking=no -t $username@$ip "sudo apt-get -y install libfontconfig1 libice6 libsm6 libcups2 libxinerama1 libxext6 libxrender1 libglu1-mesa"

sshpass -p 1234 ssh -o StrictHostKeyChecking=no -t $username@$ip "chmod +x alfresco-community-installer-*-linux-x64.bin"
sshpass -p 1234 ssh -o StrictHostKeyChecking=no -t $username@$ip "./alfresco-community-installer-*-linux-x64.bin"

# run alfresco service
sshpass -p 1234 ssh -o StrictHostKeyChecking=no -t $username@$ip ". ./alfresco-community/alfresco.sh restart"

# verification
echo "== Verification =="
#sshpass -p 1234 ssh -o StrictHostKeyChecking=no -t $username@$ip "sudo docker ps "
#firefox http://192.168.33.10:3000
