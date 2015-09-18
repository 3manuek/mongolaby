#!/bin/bash

CORE_MONGO_FOLDER=/core/mongo
# Probably this file won't be needed

openssl rand -base64 741 > $CORE_MONGO_FOLDER/mongodb-keyfile

chmod 600 $CORE_MONGO_FOLDER/mongodb-keyfile

chown 999 $CORE_MONGO_FOLDER/mongodb-keyfile

docker pull mongo:latest
