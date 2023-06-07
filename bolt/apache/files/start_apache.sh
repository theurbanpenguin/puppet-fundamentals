#!/usr/bin/bash

RUNNING=$(systemctl is-active apache2)
if [[ "$RUNNING" == "active" ]]; then
  echo "Apache is running"
else
  echo "Starting Apache"
  systemctl enable --now apache2
fi