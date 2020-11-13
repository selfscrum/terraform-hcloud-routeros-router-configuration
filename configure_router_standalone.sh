#!/bin/bash
#
# configure_router_standalone.sh - send commands to a routeros router box installed somewhere else.

#                       Synopsis:  configure_router_standalone.sh <router_ip> <user> <password> <routeros-command-list>
#
#                       This code is supposed to work on a Terraform Cloud runner which is 
#                       as of current an Ubuntu machine but not an offical service.
#                       So, be prepared to adopt or to lose this functionality.
#                       In this case, you will have to revert to local terraform.
#                       -written by selfscrum. C 2020, MIT-Licence
#     

cd $HOME

# get sshpass. 
# Luckily, there is a c compiler on the terraform runners, so we don't need to install this, too
wget http://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz 
tar -xvf sshpass.tar.gz
rm sshpass.tar.gz
dir=`ls -1d sshpass*`
cd $dir 
./configure --prefix=$HOME/$dir/
make
make install
sleep 5

echo "Calling command-list with user \"$2\"..."

ret=0
OIFS=IFS
IFS="^"
for v in $4
do
        echo -n "    Calling '$v' ..."
        ./bin/sshpass -p $3 ssh -o StrictHostKeyChecking=No $2@$1 $v
        success=$?
        echo "    ... status: $success"
        ret=$((ret + $success))
done
IFS=OIFS
exit $ret

