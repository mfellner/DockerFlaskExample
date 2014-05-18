#!/bin/sh

if [ -a $PWD/boot2docker ];
then
  BOOT2DOCKER_BIN=$PWD/boot2docker
elif [ -a $PWD/../boot2docker ];
then
  BOOT2DOCKER_BIN=$PWD/../boot2docker
else
  echo "boot2docker not found"
  exit -1
fi

if [ `./boot2docker status` != "running" ];
then
  echo "boot2docker is not running"
  exit -1
fi

# Fix issue https://github.com/boot2docker/boot2docker-cli/issues/102
${BOOT2DOCKER_BIN} ssh 2>/dev/null "echo 'nameserver 8.8.8.8' > /etc/resolv.conf && cat /etc/resolv.conf && exit"
