# Code for running consensus mechanism of article XXX

## Running Instructions
### Network configuration
Edit `networkConfig.json` file within scripts/assets folder accordingly to the following desired network parameters:

- name: the name of the network
- id: network id to be used
- nodes: number of nodes

```json
{
  "name": "Clique-Network",
  "id": 123,
  "nodes": 4
}
```

### Generate network setup

In the terminal run the script `0-generate-network-setup.sh`.

### Run bootnode

In the terminal run the script `1-run-bootnode.sh`.

### Run nodes

In another terminal run the script `2-run-nodes.sh`.

### Check number of peers

In another terminal run the following command:

```bash
curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' localhost:8545 --silent | jq
```

Where you should have a similar output to:

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": "0x3"
}
```

where the result is the number of additional nodes other than the bootnode.

## Future works

- Dockerize the entire network architecture.