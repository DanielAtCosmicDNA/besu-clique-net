#!/bin/bash
MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")" # relative
MY_PATH="$(cd -- "$MY_PATH" && pwd)" # absolutized and normalized

ASSETS_PATH="$MY_PATH"/assets
NETWORK_CONFIG_FILE="$ASSETS_PATH"/networkConfig.json

NETWORK_NAME=`jq -r '.name' "$NETWORK_CONFIG_FILE"`
NUMBER_NODES=`jq -r '.nodes' "$NETWORK_CONFIG_FILE"`

mkdir "$NETWORK_NAME"
NET_PATH="$(cd -- "$NETWORK_NAME" && pwd)" # absolutized and normalized
cd "$NETWORK_NAME"

echo "Generating network setup..."

for ((i = 1; i <= $NUMBER_NODES; i++)); do
  node="Node-$i" && \
  mkdir "$node" && \
  cd "$node" && \
  mkdir data && \
  "$MY_PATH"/get-node-address.sh "$i" &
done

wait

NODE1_ADDRESS=`cat "$NET_PATH"/Node-1/data/node1Address`
template=`jq -r '.extraData' "$ASSETS_PATH"/cliqueGenesisTemplate.json`
jq --arg s "${template/\<Node 1 Address\>/${NODE1_ADDRESS:2}}" '.extraData = $s' "$ASSETS_PATH"/cliqueGenesisTemplate.json > "$NET_PATH"/genesis.json