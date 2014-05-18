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

IP=`${BOOT2DOCKER_BIN} ssh 2>/dev/null ip addr show eth1 | grep -o -E '\d+\.\d+\.\d+\.\d+' | head -1 && exit`

if [ "$1" == "curl" ]
then
  curl $IP
else
  echo $IP
fi
