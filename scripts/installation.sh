#!/bin/bash
#
# Installation script for ubuntu 20.04

echo "Installing packages..."

sudo apt update
sudo apt upgrade

printf "\n\n===================================="
printf " Installing Vim 8 "
printf "=====================================\n"
sudo apt -y install vim

printf "\n\n===================================="
printf " Installing Curl "
printf "=====================================\n"
sudo apt -y install curl

printf "\n\n===================================="
printf " Installing Nodejs 12 "
printf "=====================================\n"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && sudo apt-get install -y nodejs

printf "\n\n===================================="
printf " Installing Git "
printf "=====================================\n"
sudo apt -y install git

printf "\n\n===================================="
printf " Installing SDKMAN "
printf "=====================================\n"
curl -s "https://get.sdkman.io" | bash && bash "$HOME/.sdkman/bin/sdkman-init.sh"

printf "\n\n===================================="
printf " Installing PostgreSQL 12 "
printf "=====================================\n"
sudo apt -y install postgresql postgresql-contrib

printf "\n\n===================================="
printf " Installing JDK 11 "
printf "=====================================\n"
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo mkdir -p /var/cache/oracle-jdk11-installer-local/
sudo cp "$HOME/Downloads/jdk-11.0.7_linux-x64_bin.tar.gz" /var/cache/oracle-jdk11-installer-local/
sudo apt -y install oracle-java11-installer-local

printf "\n\n===================================="
printf " Installing JDK 14 "
printf "=====================================\n"
sudo mkdir -p /var/cache/oracle-jdk14-installer-local/
sudo cp "$HOME/Downloads/jdk-14.0.1_linux-x64_bin.tar.gz" /var/cache/oracle-jdk14-installer-local/
sudo apt -y install oracle-java14-installer

# Set default JDK 11 before install Maven and Gradle
sudo apt -y install oracle-java11-set-default-local 

printf "\n\n===================================="
printf " Installing Gradle "
printf "=====================================\n"
. "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk install gradle 6.3

printf "\n\n===================================="
printf " Installing Maven "
printf "=====================================\n"
. "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk install maven 3.6.3

printf "\n\n===================================="
printf " Installing Docker "
printf "=====================================\n"
sudo apt -y install apt-transport-https ca-certificates gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker ${USER}

printf "\n\n===================================="
printf " Installing Postman "
printf "=====================================\n"
sudo snap install postman

printf "\n\n===================================="
printf " Installing Slack "
printf "=====================================\n"
wget -P "$HOME/Downloads" https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.2-amd64.deb
sudo apt -y install "$HOME/Downloads/slack-desktop-4.4.2-amd64.deb"

printf "\n\n===================================="
printf " Installing Spotify "
printf "=====================================\n"
sudo snap install spotify

printf "\n\n"
