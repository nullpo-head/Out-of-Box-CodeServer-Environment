#!/bin/bash

if [[ -z $(which pstree) ]]; then
  echo "pstree is not installed" >&2
  exit 1
fi

if [[ -z "$1" ]]; then
  echo "Usage: $0 heartbeat_path"
  echo "keep touching heartbeat_path while 'pstree | grep "sshd.*bash"' return true. "
  exit 1
fi

while true; do
  if ( pstree | grep "sshd.*bash" > /dev/null ); then
    echo "update sshbash_heartbeat"
    touch "$1"
  else
    echo "no heartbeat of sshbash_heartbeat"
  fi
  sleep 60
done
