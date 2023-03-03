#!/bin/bash
sudo kill -9 $(lsof -i:8082 -t) || true
pwd
cd target && sudo /usr/bin/java -jar -Dserver.port=8082 news-v1.0.4.jar &
