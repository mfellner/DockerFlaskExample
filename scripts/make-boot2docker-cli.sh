#!/bin/sh

PLATFORM=darwin

ROOT_DIR=`pwd`
SRC_DIR=src/github.com/boot2docker/boot2docker-cli/
export GOPATH=${ROOT_DIR}/boot2docker-cli/

if hash go 2>/dev/null; then
  echo "Downloading/updating boot2docker-cli..."
  go get -u github.com/boot2docker/boot2docker-cli
  cd ${GOPATH}${SRC_DIR}
  make clean
  make ${PLATFORM}
  ln -sf `pwd`/boot2docker*${PLATFORM}* ${ROOT_DIR}/boot2docker
  echo "Successfully built boot2docker-cli. Run with './boot2docker'"
else
  echo "Error, Go not installed. Install with 'brew install go'"
  exit -1
fi
