#!/bin/bash

# Removing and Addning nescessary pacakges
yum -y install perl-Data-Dumper net-tools
yum -y remove mariadb-libs

#Set SELinux to permissive
setenforce 0

#Removing Firewall
systemctl stop firewall

#install MySQL Binaries
echo "install MySQL binaries"
rpm -Uvh /tmp/mysql/MySQL-Cluster-client-gpl-7.5.9-1.el7.x86_64.rpm
rpm -Uvh /tmp/mysql/MySQL-Cluster-server-gpl-7.5.9-1.el7.x86_64.rpm
rpm -Uvh /tmp/mysql/MySQL-Cluster-shared-gpl-7.5.9-1.el7.x86_64.rpm

#creating mysql cluster directory
mkdir -p /var/lib/mysql-cluster

#Add Management node configuration
echo "Add Management node configuration"
cat > /var/lib/mysql-cluster/config.ini << "EOF"
[ndb_mgmd default]
# Directory for MGM node log files
DataDir=/var/lib/mysql-cluster
 
[ndb_mgmd]
HostName=master.localhost
 
[ndbd default]
NoOfReplicas=2      # Number of replicas
DataMemory=256M     # Memory allocate for data storage
IndexMemory=128M    # Memory allocate for index storage
#Directory for Data Node
DataDir=/var/lib/mysql-cluster

[ndbd]
HostName=data1.localhost
 
[ndbd]
HostName=data2.localhost
 
[mysqld]
HostName=mysql1.localhost
 
[mysqld]
HostName=mysql2.localhost
EOF

#Start Management Node
echo "Start Management Node"
ndb_mgmd --config-file=/var/lib/mysql-cluster/config.ini


