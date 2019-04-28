#!/bin/bash
################################################################################
# This script sets up the host server OS that the Minecraft server application
# runs on top of.
#
# Tested on Ubuntu 16.04 (AWS T2 instance).
################################################################################

export hostname=mc1-loosbrock
export minecraft_user=minecraft
export minecraft_dir=/var/minecraft

# Set the hostnanme:
sed -i -E "s/^(127.0.0.1 localhost).*$/\1 ${hostname}/" /etc/hosts
hostname ${hostname}
echo ${hostname} | sudo tee /etc/hostname

# Install packages:
apt-get -y install aptitude openjdk-8-jre-headless git tmux screen
aptitude update
aptitude safe-upgrade

# Create a user for the minecraft app to run under:
useradd -M -d ${minecraft_dir} -s /bin/bash ${minecraft_user}

# Clone minecraft repo as the minecraft user's home directory:
git clone https://github.com/mikeloosbrock/minecraft.git ${minecraft_dir}
chown ${minecraft_user}:${minecraft_user} -R ${minecraft_dir}
