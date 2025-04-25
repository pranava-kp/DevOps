#!/bin/bash
clear
sudo apt install openjdk-11-jdk -y
sudo apt install maven -y
sudo apt install tree
clear
echo "Enter project name:"
read name
cd
rm -rf $name
    mvn archetype:generate -DgroupId=com.example -DartifactId=$name -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
cd $name
tree
cat > pom.xml <<EOF
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.example</groupId>
  <artifactId>${name}</artifactId>
  <packaging>jar</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>${name}</name>
  <url>http://maven.apache.org</url>
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.13.2</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
  <build>
  <plugins>
  	<plugin>
  		<groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-compiler-plugin</artifactId>
      <version>3.8.1</version>
      <configuration>
      	<source>11</source>
      	<target>11</target>
      </configuration>
  	</plugin>
  	
  	<plugin>
  		<groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-surefire-plugin</artifactId>
      <version>2.22.2</version>
  	</plugin> 
  </plugins>
  </build>
</project>
EOF
mvn compile
mvn test
mvn package
mvn clean
