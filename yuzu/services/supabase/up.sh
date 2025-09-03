#!/bin/sh

# request for DATA_DIR, default to /data
read -p "Enter DATA_DIR (default: /data/supabase): " INPUT_DIR
DATA_DIR=$(realpath "${INPUT_DIR:-/data/supabase}")
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
UPSTREAM_DEPLOY_DIR="$SCRIPT_DIR/upstream/docker/volumes"

# if DATA_DIR does not exist, create it
if [ ! -d "$DATA_DIR" ]; then
  sudo mkdir -p "$DATA_DIR"
fi

# test if docker external network "proxy" exists
if ! sudo docker network ls | grep -q "proxy"; then
  echo "Creating docker external network 'proxy'"
  sudo docker network create -d bridge proxy
fi

sudo cp -r "$UPSTREAM_DEPLOY_DIR/." "$DATA_DIR"

op run --env-file=./.env.op -- docker compose -f docker-compose.yaml -f docker-compose.s3.yaml up -d
