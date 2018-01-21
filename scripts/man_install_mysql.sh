#!/bin/bash

scp install_mysql.sh mscu@$1:/tmp
scp /etc/hosts mscu@$1:/tmp
ssh mscu@$1 "sudo cp /tmp/hosts /etc/hosts"
ssh mscu@$1 "sudo /tmp/install_mysql.sh"
