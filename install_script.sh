#!/bin/bash

sudo apt-get update && sudo apt-get install -yqq \
curl \
git \
apt-transport-https \
ca-certificates \
gnupg-agent \
software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" &&
sudo apt-get update &&
sudo apt-get install docker-ce docker-ce-cli containerd.io -yqq

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

sudo mkdir /etc/{wireguard,ipsec,pihole,unbound,prometheus}
mv unbound.conf /etc/unbound/
mv prometheus.yml /etc/prometheus/
sudo docker compose up -d
