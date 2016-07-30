#!/bin/bash
geth --datadir testchain --networkid 403 --nodiscover --maxpeers 0 --rpc --rpccorsdomain * console
