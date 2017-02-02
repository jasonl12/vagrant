#!/bin/sh

# vbox_path="/home/$USER/VirtualBox\ VMs"
# vbox_name="debian-jessie64"
vagrant up --provider virtualbox

if [ $? -eq 0 ]; then
  uuid=`vboxmanage list hdds | \
    grep -E 'debian-jessie64.*.vmdk' -B5 | \
    grep '^UUID:' | awk '{print $2}'`

  # UUID:           93f30387-ce11-4a38-b012-5a4a65f2d71f
  # Parent UUID:    base
  # State:          created
  # Type:           normal (base)
  # Location:       /home/$USER/VirtualBox VMs/debian-jessie64/box-disk1.vmdk
  # Storage format: VMDK
  # Capacity:       10140 MBytes
  # Encryption:     disabled
  #
  # not "locked write", successfully remove vmdk with closemedium
  # *.vmdk will be deleted
  vboxmanage closemedium disk $uuid --delete > /dev/null 2>&1
else
  echo 'vagrant up --provider virtualbox failed'
fi
