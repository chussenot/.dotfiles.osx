#!/bin/sh
if [[ ! -f ~/go ]]; then
  mkdir -p ~/go/bin
fi
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
