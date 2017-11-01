#!/bin/sh

if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

echo "› sudo softwareupdate -ia"
sudo softwareupdate -ia
