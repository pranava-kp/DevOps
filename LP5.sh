#!/bin/bash

clear
sudo apt install fontconfig openjdk-21-jre -y

# Choose jdk version
clear
echo -e "\e[1;31mSelect Java version 21\e[0m"
read -p "Press Enter to continue..."
clear
echo -e "\e[1;31mSelect Java version 21\e[0m"
sudo update-alternatives --config java

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

sudo systemctl start jenkins
# sudo systemctl status jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo -e "\e[1;31mCopy password(string above) and press enter to continue\e[0m"
read

xdg-open http://127.0.0.1:8080 >/dev/null 2>&1
