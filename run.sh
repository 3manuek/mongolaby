#!/bin/bash

REPLSET=test
STARTPORT=27020
NUMINST=4
DBPATH=db
LOGSFOLDER=logs

for i in $(seq 1 $NUMINST)
do
    [ ! -d test${i} ] && mkdir db/test${i}
    mongod --port $(( STARTPORT + 1 )) --dbpath ${DBPATH}/test${i} \
          --smallfiles --oplogSize 50  --fork --logpath ${LOGSFOLDER}/test${i}.log \
          --replSet test
done
