
# Mongolaby

--

# Sections

- mongou are the mongo M102 scripts
- remove node_modules and force download when installing

# TODO

AWS support:

https://crate.io/docker/machine/


# Starting docs

This is a laboratory just for educational purposes.

Recommendable links:

http://blog.codefresh.io/docker-machine-basics/

# Installation

> As this lab is interely intended to be a Mongo sandbox, we are not going to spend much time with docker.

If you are on Linux Debian, please navigate and follow to (http://docs.docker.com/installation/debian/).

Starting the service and  checking if it's running correctly:
```
sudo service docker start
sudo docker run hello-world

sudo groupadd docker

# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for
# this to take effect.
sudo gpasswd -a $(whoami) docker

# Restart the Docker daemon.
sudo service docker restart
```


Pull latest Mongo image:

```
docker pull mongo
```


In the future, this lab will start several docker machine in order to allow multiple host deploy:


```
docker-machine create --driver virtualbox dev
docker-machine ls
```
More information: https://github.com/docker/machine .


# Tools required

- Ansible
- Docker 
- MongoDB
- Node.js 
- npm


# Documentation

Please read about TLS [https://docs.docker.com/articles/https/]

Mongo Docker image configuration: (https://hub.docker.com/\_/mongo/)


# Dependencies

[https://github.com/apocas/dockerode]


A good documentation about dockerode:

https://www.npmjs.com/package/dockerode
