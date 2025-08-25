#!/bin/sh

# request for DATA_DIR, default to /data
read -p "Enter DATA_DIR (default: /data): " INPUT_DIR
DATA_DIR=$(realpath "${INPUT_DIR:-/data}/traefik")
ACME_DATA_FILE=${DATA_DIR}/acme.json

# if DATA_DIR does not exist, create it
if [ ! -d "$DATA_DIR" ]; then
  sudo mkdir -p "$DATA_DIR"
fi

# if acme.json does not exist, create it
if [ ! -f "$ACME_DATA_FILE" ]; then
  sudo touch "$ACME_DATA_FILE"
  echo "Created $ACME_DATA_FILE"
fi
# fix permission for acme.json
sudo chmod 600 "$ACME_DATA_FILE"

op run --env-file=./.env -- sudo docker compose up -d
