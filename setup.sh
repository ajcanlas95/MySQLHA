#!/bin/bash

yum install sshpass -y &>> /dev/null 
echo "Welcome to MySQLHA installation"
read -sp "Root password: " PASSWORD
printf "\n"

./scripts/create_user.sh
./scripts/pre_installation.sh

#preparing everything
for i in $(data1 data2 mysql1 mysql2);
do
	sshpass -p $PASSORD scp ./script/create_user.sh root@$i:/tmp;
	sshpass -p $PASSWORD root@$i "/tmp/create_user.sh";
	./scripts/man_pre_installation.sh $i
done


#Installing Management
./scripts/install_man.sh

for i in data{1..2};
do
	cp -a ./scripts/man_install_data.sh /tmp;
	su - mscu -c "sudo /tmp/man_install_data.sh $i";
done

for i in mysql{1..2};
do
        cp -a ./scripts/man_install_mysql.sh /tmp;
        su - mscu -c "sudo /tmp/man_install_mysql.sh $i";
done

