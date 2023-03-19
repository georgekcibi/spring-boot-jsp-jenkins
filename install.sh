#!/bin/bash
sudo systemctl stop springboot
cd /home/ubuntu/application/spring-boot-jsp-jenkins-code-pipeline/target
sudo rm news-v1.0.4.jar
cd /home/ubuntu && target/*.jar
sudo cp target/* /home/ubuntu/application/spring-boot-jsp-jenkins-code-pipeline/target
sudo systemctl start springboot
