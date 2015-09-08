#!/bin/bash

REPLSET=test
STARTPORT=2700
NUMINST=4

for i in $(seq 1 $NUMINST)
do
    [ ! -d test${i} ] && mkdir test${i}
    mongod --port ${STARTPORT}$(( i + 1 )) --dbpath test${i} --smallfiles --oplogSize 50  --fork --logpath test${i}.log --replSet test
done
