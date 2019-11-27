#!/bin/bash

apt-get update
apt-get upgrade -y
apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab