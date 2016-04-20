# cdh5-hadoop-pseudo-env

[![Circle CI](https://circleci.com/gh/qilab-/cdh5-hadoop-pseudo-env/tree/master.svg?style=svg)](https://circleci.com/gh/qilab-/cdh5-hadoop-pseudo-env/tree/master)

This is an Ansible playbook that installs Hadoop Pseudo-distributed Mode based on CDH 5.x with HBase, Hive, etc.
Vagrantfile (in [vagrant](./vagrant)) that creates an Hadoop environment provisioned by the playbook is available.

## Ansible playbook ([ansible](./ansible))

The Ansible playbook in [ansible](./ansible) consists of following roles:

* [`cdh_common`](./ansible/roles/cdh_common/): sets up Cloudera's repository and key
* [`common`](./ansible/roles/common/): sets up OS settings and install common packages
* [`hadoop`](./ansible/roles/hadoop/): installs Hadoop
* [`hbase`](./ansible/roles/hbase/): installs HBase
* [`hive`](./ansible/roles/hive/): installs Hive (it requires Metastore DB is installed)
* [`mariadb`](./ansible/roles/mariadb/): installs MariaDB for Hive Metastore
* [`mysql_connector_java`](./ansible/roles/mysql_connector_java/): installs MySQL Connector/J for Hive Metastore
* [`oracle_jdk`](./ansible/roles/oracle_jdk/): installs Oracle JDK
* [`zookeeper`](./ansible/roles/zookeeper/): installs ZooKeeper Server

### Requirements

* [Ansible](https://www.ansible.com/) 2.0.0 or later

This playbook is designed for following OS:

* CentOS 6.7
* CentOS 7.2
* Ubuntu 12.04 (precise)
* Ubuntu 14.04 (trusty)

## Vagrant ([vagrant](./vagrant))

You can use the Vagrantfile in [vagrant](./vagrant) to create an Hadoop environment provisioned by the playbook.

### Requirements

* [VirtualBox](https://www.virtualbox.org/) 5.0.0 or later
* [Vagrant](https://www.vagrantup.com/) 1.7.0 or later

### Usage

Change directory `cd ./vagrant` and run `vagrant up`.
As default, CentOS 7.2 and all provision is run.

additional settings:
If ansible is installed in your host OS, the provision is run by using it.
If ansible is not installed in your host OS,
you should set the parameter `ANSIBLE_IS_INSTALLED` to be `false` and choose proper shell script file as `PROVISION_SHELL` in Vagrantfile.
Then(?), when you run `vagrant up` ansible will be installed in the guest OS and provision will be run using it.
