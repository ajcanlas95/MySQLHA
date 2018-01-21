#Adding mysql cluster user
useradd mscu

#Adding universal password
usermod --password mYSqlH@ mscu

#Add mscu ssh keygen
su - mscu -c "ssh-keygen -f id_rsa -t rsa -N ''"

#Add public key
su - mscu -c "cp /home/mscu/.ssh/id_rsa.pub /home/mscu/.ssh/authorized_keys"
su - mscu -c "chmod 600 /home/mscu/.ssh/authorized_keys

#Add mscu in sudoers
echo "mscu ALL=(ALL)    NOPASSWD:ALL"  >> /etc/sudoers
