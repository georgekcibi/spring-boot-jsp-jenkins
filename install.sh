#!/bin/bash
sudo kill -9 $(lsof -i:8082 -t) || true
cd /home/ubuntu && sudo /usr/bin/java -jar -Dserver.port=8082 target/*.jar &
