#!/bin/bash
MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")" # relative
MY_PATH="$(cd -- "$MY_PATH" && pwd)" # absolutized and normalized

ASSETS_PATH="$MY_PATH"/assets
NETWORK_CONFIG_FILE="$ASSETS_PATH"/networkConfig.json

NETWORK_NAME=`jq -r '.name' "$NETWORK_CONFIG_FILE"`
NUMBER_NODES=`jq -r '.nodes' "$NETWORK_CONFIG_FILE"`

# for ((i = 2; i <= $NUMBER_NODES; i++)); do
#   $MY_PATH/run-node.sh "$i" &
# done

N="$(($NUMBER_NODES-1))"
seq 2 $NUMBER_NODES | xargs -I{} -n1 -P"$N" "$MY_PATH"/run-node.sh {}