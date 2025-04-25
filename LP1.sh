#!/bin/bash
clear
sudo apt install openjdk-11-jdk -y
sudo apt install maven
sudo apt install gradle -y
clear
java -version
mvn -version
gradle -v