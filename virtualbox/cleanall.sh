#!/bin/sh

vbox_path="/home/$USER/VirtualBox\ VMs"
vbox_name="debian-jessie64"

vagrant halt && vagrant destroy -f

if [ $? -eq 0 ]; then
  eval rm -rf $vbox_path/$vbox_name
fi
