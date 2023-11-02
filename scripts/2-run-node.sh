#!/bin/bash
ENODE_URL="$1"
NODE_NUMBER="$2"
PORT_NUMBER=""$((8545-1+$NODE_NUMBER))""
P2P_PORT_NUMBER=""$((30303-1+$NODE_NUMBER))""


MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")" # relative
MY_PATH="$(cd -- "$MY_PATH" && pwd)" # absolutized and normalized

NETWORK_NAME="Clique-Network"
cd "$NETWORK_NAME"

besu \
  --data-path=Node-"$NODE_NUMBER"/data \
  --genesis-file=./genesis.json \
  --bootnodes="$ENODE_URL" \
  --network-id 123 \
  --p2p-port="$P2P_PORT_NUMBER" \
  --rpc-http-enabled \
  --rpc-http-api=ETH,NET,CLIQUE \
  --host-allowlist="*" \
  --rpc-http-cors-origins="all" \
  --rpc-http-port="$PORT_NUMBER"