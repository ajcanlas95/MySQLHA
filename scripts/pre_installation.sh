#!/bin/bash


#Create Temporary MYSQL Directory
mkdir -p /tmp/mysql

#Change Directory in Teamporary MYSQL
cd /tmp/mysql

#Downloading MYSQL tarball
curl -L http://dev.mysql.com/get/Downloads/MySQL-Cluster-7.5/MySQL-Cluster-gpl-7.5.9-1.el7.x86_64.rpm-bundle.tar -o mysql.tar

#Extract Tarball
tar -xvf mysql.tar


