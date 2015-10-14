#!/bin/bash

# This install all the things needed
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-debian/

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org mongodb-org-mongos mongodb-org-server 


