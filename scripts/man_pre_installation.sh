#!/bin/bash

#Create temporary mysql directory
ssh mscu@$1 "mkdir -p /tmp/mysql"

#Transfer MySQL binaries
scp /tmp/mysql/MySQL-Cluster-client-gpl-7.4.10-1.el7.x86_64.rpm mscu@$1:/tmp/mysql
scp /tmp/mysql/MySQL-Cluster-server-gpl-7.4.10-1.el7.x86_64.rpm mscu@$1/tmp/mysql
scp /tmp/mysql/MySQL-Cluster-shared-gpl-7.4.10-1.el7.x86_64.rpm mscu@$1/tmp/mysql
