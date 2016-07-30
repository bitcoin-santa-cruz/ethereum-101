#!/bin/bash
geth --datadir testchain --networkid 403 --nodiscover --maxpeers 0 --rpc --rpcapi "admin,debug,eth,miner,net,personal,rpc,txpool,web3" --rpccorsdomain "*" console
