# "stdin: is not a tty"
sed -i 's/mesg n/tty -s \&\& mesg n/g' /root/.profile

apt-get update -y > /dev/null 2>&1
# apt-get upgrade -y > /dev/null 2>&1
apt-get install -y vim zsh git chrony > /dev/null 2>&1

systemctl stop exim4.service
systemctl stop nfs-common.service
systemctl disable exim4.service > /dev/null 2>&1
systemctl disable nfs-common.service > /dev/null 2>&1
timedatectl set-timezone America/Los_Angeles

grep -q 'vboxsf' /etc/initramfs-tools/modules
if [ $? -ne 0 ]; then
  echo "vboxsf" >> /etc/initramfs-tools/modules
  echo "shared /shared vboxsf defaults,uid=`id -u vagrant`,\
gid=`id -g vagrant` 0 0" >> /etc/fstab
  update-initramfs -u
fi

if [ ! -f /home/vagrant/get-pip.py ]; then
  su - vagrant
  wget https://bootstrap.pypa.io/get-pip.py
  sudo python get-pip.py
  mkdir /home/vagrant/.pip
  cat <<EOF > /home/vagrant/.pip/pip.conf
[list]
format=columns
EOF
fi
