#!/bin/bash

scp ./scripts/install_mysql.sh $1:/tmp
scp /etc/hosts $1:/tmp
ssh $1 "sudo cp /tmp/hosts /etc/hosts"
ssh $1 "sudo /tmp/install_mysql.sh"
