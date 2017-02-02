#!/bin/sh

# size of swapfile in megabyte
swapsize=512
grep -q "swapfile" /etc/fstab

if [ $? -ne 0 ]; then
  fallocate -l ${swapsize}M /swapfile
  chmod 600 /swapfile
  mkswap /swapfile > /dev/null 2>&1
  swapon /swapfile
  echo '/swapfile none swap defaults 0 0' >> /etc/fstab
fi
