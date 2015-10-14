#!/bin/bash
sudo pkill -9 mongod
sudo pkill -9 mongos
sudo rm -f /tmp/mongo* #remove possible hang sockets
sudo rm -rf cfg/ shard*
rm mongos.log init.js
