#!/bin/bash

# Removing and Addning nescessary pacakges
yum -y install perl-Data-Dumper net-tools
yum -y remove mariadb-libs

#install MySQL Binaries
echo "install MySQL binaries"
rpm -Uvh /tmp/mysql/MySQL-Cluster-client-gpl-7.5.9-1.el7.x86_64.rpm
rpm -Uvh /tmp/mysql/MySQL-Cluster-server-gpl-7.5.9-1.el7.x86_64.rpm
rpm -Uvh /tmp/mysql/MySQL-Cluster-shared-gpl-7.5.9-1.el7.x86_64.rpm

#Set SELinux to permissive
setenforce 0

#Removing Firewall
systemctl stop firewall

#Add Data node configuration
echo "Add Data node configuration"
cat > /etc/my.cnf << "EOF"

[mysqld]
ndbcluster
ndb-connectstring=master.localhost
default_storage_engine=ndbcluster
 
[mysql_cluster]
ndb-connectstring=master.localhost
EOF

#Create database directory
echo "Create database directory"
mkdir -p /var/lib/mysql-cluster

#Start Data Node
echo "Start MySQL Node"
systemctl start mysql


