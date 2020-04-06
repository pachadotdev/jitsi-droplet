#!/bin/bash
ip=$(
    ifconfig eth0 |
    perl -ne 'print $1 if /inet\s.*?(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\b/'
)
hostnamectl set-hostname jitsimeet
sed -i 's/^127.0.1.1.*$/127.0.1.1 '$ip' jitsimeet/g' /etc/hosts
apt-get install jitsi-meet

