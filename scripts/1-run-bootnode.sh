#!/bin/bash
MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")" # relative
MY_PATH="$(cd -- "$MY_PATH" && pwd)" # absolutized and normalized

NETWORK_NAME="Clique-Network"
cd "$NETWORK_NAME"

besu \
  --data-path=Node-1/data \
  --genesis-file=./genesis.json \
  --network-id 123 \
  --rpc-http-enabled \
  --rpc-http-api=ETH,NET,CLIQUE,MINER \
  --host-allowlist="*" \
  --rpc-http-cors-origins="all"