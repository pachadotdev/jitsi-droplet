#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

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

# pkgs for jitsi itself
apt-get -yq install openjdk-8-jre-headless openssl prosody nginx-full python-certbot-nginx
ufw allow 'Nginx Full'

# side deps for jitsi
apt-get -yq install coturn libevent-core-2.1-6 libevent-extra-2.1-6 libevent-openssl-2.1-6 libevent-pthreads-2.1-6 libhiredis0.13 libmysqlclient20 libpq5 mysql-common
  
# getting let's encrypt deps ready
apt-get -yq install augeas-lenses binutils binutils-common binutils-x86-64-linux-gnu cpp cpp-7 gcc gcc-7 gcc-7-base libasan4 libatomic1 libaugeas0 libbinutils libc-dev-bin libc6-dev libcc1-0 libcilkrts5 libexpat1-dev libffi-dev libgcc-7-dev libgomp1 libisl19 libitm1 liblsan0 libmpc3 libmpx2 libpython-dev libpython-stdlib libpython2.7 libpython2.7-dev libpython2.7-minimal libpython2.7-stdlib libquadmath0 libssl-dev libtsan0 libubsan0 linux-libc-dev python python-dev python-minimal python-pip-whl python-pkg-resources python-virtualenv python2.7 python2.7-dev python2.7-minimal python3-distutils python3-lib2to3 python3-virtualenv virtualenv
