#!/bin/sh

# check if DATA_DIR environment variable is set
if [ -z "$DATA_DIR" ]; then
  echo "DATA_DIR environment variable is not set"
  exit 1
fi

# forgejo-runner data dir
forgejo_runner_data_dir=${DATA_DIR}/forgejo-runner
forgejo_runner_cache_dir=${forgejo_runner_data_dir}/.cache
forgejo_runner_config_dir=${forgejo_runner_data_dir}/.runner

# fix permissions
sudo chown -R 1000:1000 ${forgejo_runner_cache_dir}
sudo chown -R 1000:1000 ${forgejo_runner_config_dir}
sudo chmod 755 ${forgejo_runner_cache_dir}
sudo chmod 755 ${forgejo_runner_config_dir}
sudo chmod g+s ${forgejo_runner_cache_dir}
sudo chmod g+s ${forgejo_runner_config_dir}
