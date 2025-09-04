#!/bin/sh

# request for DATA_DIR, default to /data
read -p "Enter DATA_DIR (default: /data/mongo): " INPUT_DIR
DATA_DIR=$(realpath "${INPUT_DIR:-/data/mongo}")
export DATA_DIR

# if DATA_DIR does not exist, create it
if [ ! -d "$DATA_DIR" ]; then
  sudo mkdir -p "$DATA_DIR"
fi

op run --env-file=./.env.op -- docker compose up -d
