#!/bin/sh

# check if DATA_DIR environment variable is set
if [ -z "$DATA_DIR" ]; then
  echo "DATA_DIR environment variable is not set"
  exit 1
fi

script_dir=$(dirname "$(readlink -f "$0")")
upstream_deploy_dir="$script_dir/upstream/deploy"
data_deploy_dir="$DATA_DIR/signoz/deploy"

# make sure the data deploy directory exists
sudo mkdir -p "$data_deploy_dir"
sudo cp -r "$upstream_deploy_dir/." "$data_deploy_dir"
