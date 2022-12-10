#!/bin/bash

usern="test123"
passwd="TestForVPN123"

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -u|--user)
      usern="$2"
      shift
      shift
      ;;
    -p|--passwd)
      passwd="$2"
      shift
      shift
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") #
      shift
      ;;
  esac
done

passwd_hash=$(htpasswd -bnBC 10 "" $passwd | tr -d ':\n' | sed 's/\$/$$/g')

sudo apt-get update && sudo apt-get install -yqq \
curl \
git \
apt-transport-https \
ca-certificates \
gnupg-agent \
software-properties-common \
apache2-utils

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

sudo mkdir /etc/{wireguard,ipsec,pihole,unbound,prometheus,grafana}
mv unbound.conf /etc/unbound/
mv prometheus.yml /etc/prometheus/
mv grafana.ini /etc/grafana/

sed -i "s/<username>/$usern/" docker-compose.yml
sed -i "s/<passwdhash>/$passwd_hash/" docker-compose.yml

docker-compose up -d
