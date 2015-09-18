#!/bin/bash

#DOCKER_HOST=192.168.99.100

ANSIBLE_HOSTS=ansible_hosts




ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=.vagrant/machines/default/virtualbox/private_key -u vagrant playbook.yml

ping $DOCKER_HOST
