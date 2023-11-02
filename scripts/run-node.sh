#!/bin/bash
ENODE_URL=`curl -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' localhost:8545 --silent | jq -r '.result'`
NODE_NUMBER="$1"
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