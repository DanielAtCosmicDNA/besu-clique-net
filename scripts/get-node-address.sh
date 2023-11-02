#!/bin/sh
besu \
  --data-path=data \
  public-key export-address --to=data/node"$1"Address