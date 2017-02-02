sed -i 's/mesg n/tty -s \&\& mesg n/g' /root/.profile

apt-get update -y > /dev/null 2>&1
# apt-get upgrade -y > /dev/null 2>&1
apt-get install -y vim zsh git chrony > /dev/null 2>&1

systemctl stop exim4.service
systemctl stop nfs-common.service
systemctl disable exim4.service > /dev/null 2>&1
systemctl disable nfs-common.service > /dev/null 2>&1
timedatectl set-timezone America/Los_Angeles
