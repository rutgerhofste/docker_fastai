#!/bin/bash
# Ubuntu 
# This file should be used as startup script for an amazon graphic compute instance.

apt-get update
apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# Docker CE ((https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce))
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce -y

## Post- Install Docker (https://docs.docker.com/install/linux/linux-postinstall/)
groupadd docker
usermod -aG docker $USER

## Install nvidia docker:
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  tee /etc/apt/sources.list.d/nvidia-docker.list
apt-get update

# Install nvidia-docker2 and reload the Docker daemon configuration
apt-get install -y nvidia-docker2
pkill -SIGHUP dockerd







