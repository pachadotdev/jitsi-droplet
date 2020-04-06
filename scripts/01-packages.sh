#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get -yq update
apt-get -yq upgrade

# firewall rules
ufw allow OpenSSH
ufw allow http
ufw allow https
ufw allow in 10000:20000/udp

# install Digital Ocean agent
curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash

# jitsi
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -
sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"
add-apt-repository -y ppa:certbot/certbot
apt-get -yq update
mkdir /jitsi-setup
apt-get -yq install openjdk-8-jre-headless nginx python-certbot-nginx
ufw allow 'Nginx Full'

