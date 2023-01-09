#!/bin/bash

if [[ -z "$DOCKERCOMPOSE_FILE_PATH" ]]; then
  echo 'MISSING PARAMETER: You must provide DOCKERCOMPOSE_FILE_PATH=/home/lex/mwstakeorgdevclone/docker-compose.yml'
  exit
fi

sudo docker-compose --file $DOCKERCOMPOSE_FILE_PATH restart varnish