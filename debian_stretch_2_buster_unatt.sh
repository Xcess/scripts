#!/bin/sh
set -x
set -e

sed -i 's/stretch/buster/g' /etc/apt/sources.list
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
apt-get -qy update
apt-get -qy -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" full-upgrade
apt-get -qy autoclean

echo " **** update complete. please reboot...  ****"
