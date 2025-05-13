#!/bin/bash

echo "Starting IB Gateway using IBC..."

# Run IB Gateway in headless mode with a virtual display
xvfb-run --auto-servernum --server-args='-screen 0 1024x768x24' \
  ./ibc/scripts/ibcstart.sh \
  /root/Jts \
  ./ibc/resources \
  --gateway \
  --config ./ibc/resources/config.ini

echo "IB Gateway is running (via IBC)"