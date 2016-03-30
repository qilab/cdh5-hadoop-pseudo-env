#!/bin/bash

ANSIBLE_PLAYBOOK=/test_ansible/ansible/site.yml
ANSIBLE_HOSTS=/test_ansible/ansible/hosts
ANSIBLE_HOSTS_TMP=/tmp/ansible_hosts

if [ ! -f $ANSIBLE_PLAYBOOK ]; then
  echo "Cannot find Ansible playbook"
  exit 1
fi

if [ ! -f $ANSIBLE_HOSTS ]; then
  echo "Cannot find Ansible hosts"
  exit 2
fi

apt-get -y install python-software-properties
apt-add-repository -y ppa:ansible/ansible
apt-get -y update
apt-get -y install ansible

cp $ANSIBLE_HOSTS $ANSIBLE_HOSTS_TMP
chmod -x $ANSIBLE_HOSTS_TMP
echo "Running Ansible"
ansible-playbook -i $ANSIBLE_HOSTS_TMP $ANSIBLE_PLAYBOOK --extra-vars "test=yes" -v --connection=local
