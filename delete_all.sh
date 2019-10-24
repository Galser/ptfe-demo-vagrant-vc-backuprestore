#!/usr/bin/env bash

mountpoint /var/lib/replicated/snapshots
if [ $? -eq 0 ]; then
  umount /var/lib/replicated/snapshots
fi
  
[ -d /var/lib/replicated/snapshots/ ] && rsync -PavzHl /var/lib/replicated/snapshots/ ~/snap/

systemctl stop replicated replicated-operator replicated-ui
service docker stop

rm -rf /var/lib/replicated /var/lib/replicated-operator /etc/replicated.alias /var/lib/tfe-vault/ /etc/default/replicated-operator /etc/default/replicated 

mkdir -p  /var/lib/replicated/snapshots
mount -a

rm -fr /var/lib/docker

service docker start

docker ps -a

[ -d ~/snap/ ] && {
  mkdir -p /var/lib/replicated/
  rsync -PavzHl ~/snap/ /var/lib/replicated/snapshots/
}