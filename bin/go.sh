#!/usr/bin/env bash
#
# Go Config
#

GOPATH=$HOME/go

## Install GVM if not present
if [ ! -e GOPATH ]; then
  echo "Creating gopath"
  mkdir -p GOPATH
  echo "export GOPATH=$GOPATH"     >> ~/.zshrc
  echo "export PATH=\$PATH:$GOPATH/bin" >> ~/.zshrc
fi

