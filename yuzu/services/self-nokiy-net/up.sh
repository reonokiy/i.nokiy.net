#!/bin/sh

# request for DATA_DIR, default to /data
read -p "Enter DATA_DIR (default: /data): " INPUT_DIR
DATA_DIR=$(realpath "${INPUT_DIR:-/data}/self-nokiy-net")
ENV_FILE=${DATA_DIR}/.env

# if DATA_DIR does not exist, create it
if [ ! -d "$DATA_DIR" ]; then
  sudo mkdir -p "$DATA_DIR"
fi

# if ENV_FILE does not exist, create it
if [ ! -f "$ENV_FILE" ]; then
  sudo touch "$ENV_FILE"
  echo "Created $ENV_FILE"
fi

sudo docker compose --env-file "$ENV_FILE" up -d
