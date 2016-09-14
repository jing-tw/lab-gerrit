#!/bin/bash
username=jing
ip=192.168.33.10
ssh-keygen -f ~/.ssh/known_hosts -R $ip

# copy the necessary files
sshpass -p 1234 scp -o StrictHostKeyChecking=no ./common_fun.sh $username@$ip:/home/$username
sshpass -p 1234 scp -o StrictHostKeyChecking=no ./normal_install.sh $username@$ip:/home/$username

# run remote install
sshpass -p 1234 ssh -o StrictHostKeyChecking=no -t $username@$ip "ip=$ip;. ./normal_install.sh"

# verification
echo Wait for gerrit service start ...
sleep 10
firefox http://$ip:8080/&

echo Login with OpenID
echo -Sign in with a Launchpad ID: UbuntuOne Account
echo -Sign in with a Yahoo! ID
