#!/bin/bash
ENODE_URL="$1"
NODE_NUMBER="$2"
PORT_NUMBER=""$((8545-1+$NODE_NUMBER))""
P2P_PORT_NUMBER=""$((30303-1+$NODE_NUMBER))""


MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")" # relative
MY_PATH="$(cd -- "$MY_PATH" && pwd)" # absolutized and normalized

ASSETS_PATH="$MY_PATH"/assets
NETWORK_CONFIG_FILE="$ASSETS_PATH"/networkConfig.json
NETWORK_NAME=`jq -r '.name' "$NETWORK_CONFIG_FILE"`
NETWORK_ID=`jq -r '.id' "$NETWORK_CONFIG_FILE"`

cd "$NETWORK_NAME"

besu \
  --data-path=Node-"$NODE_NUMBER"/data \
  --genesis-file=./genesis.json \
  --bootnodes="$ENODE_URL" \
  --network-id $NETWORK_ID \
  --p2p-port="$P2P_PORT_NUMBER" \
  --rpc-http-enabled \
  --rpc-http-api=ETH,NET,CLIQUE \
  --host-allowlist="*" \
  --rpc-http-cors-origins="all" \
  --rpc-http-port="$PORT_NUMBER"