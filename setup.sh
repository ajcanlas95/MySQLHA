#!/bin/bash

#Download MySQL
sudo ./scripts/pre_installation.sh

#Installing Management
sudo ./scripts/install_man.sh

#Installing Data Nodes
for i in data{1..2};
do
	./scripts/man_pre_installation.sh $i;
	./scripts/man_install_data.sh $i;
done

#Installing MySQL Nodes
for i in mysql{1..2};
do
        ./scripts/man_pre_installation.sh $i;
	./scripts/man_install_mysql.sh $i;
done

