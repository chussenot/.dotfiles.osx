#!/bin/sh
#
# Apex
#

# Check for Apex
if test ! "$(which apex)"; then
  echo "  Installing Apex for you."
  # Install the correct apex for each OS type
  curl https://raw.githubusercontent.com/apex/apex/master/install.sh | sh
fi

exit 0
