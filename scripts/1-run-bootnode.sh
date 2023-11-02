#!/bin/bash
MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")" # relative
MY_PATH="$(cd -- "$MY_PATH" && pwd)" # absolutized and normalized

ASSETS_PATH="$MY_PATH"/assets
NETWORK_CONFIG_FILE="$ASSETS_PATH"/networkConfig.json
NETWORK_NAME=`jq -r '.name' "$NETWORK_CONFIG_FILE"`
NETWORK_ID=`jq -r '.id' "$NETWORK_CONFIG_FILE"`
cd "$NETWORK_NAME"

besu \
  --data-path=Node-1/data \
  --genesis-file=./genesis.json \
  --network-id "$NETWORK_ID" \
  --rpc-http-enabled \
  --rpc-http-api=ETH,NET,CLIQUE,MINER \
  --host-allowlist="*" \
  --rpc-http-cors-origins="all"