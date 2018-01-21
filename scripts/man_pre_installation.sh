#!/bin/bash

#Create temporary mysql directory
ssh $1 "mkdir -p /tmp/mysql"

#Transfer MySQL binaries
scp /tmp/mysql/MySQL-Cluster-client-gpl-7.5.9-1.el7.x86_64.rpm $1:/tmp/mysql
scp /tmp/mysql/MySQL-Cluster-server-gpl-7.5.9-1.el7.x86_64.rpm $1:/tmp/mysql
scp /tmp/mysql/MySQL-Cluster-shared-gpl-7.5.9-1.el7.x86_64.rpm $1:/tmp/mysql
