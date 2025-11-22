#!/bin/bash
set -e

name="pushlive"
USER_HOME="/home/yan"

docker stop $name

docker rm $name

docker image rm yan/$name:latest

docker build -t yan/$name:latest .

docker run -d \
  --name $name \
  -p 8080:8080 \
  -e STREAM_KEY=live \
  -v ${USER_HOME}/docker/$name/video:/opt/data/video \
  --restart unless-stopped \
  yan/$name:latest

