#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi
rm -rf /etc/yum.repos.d/fedora*
rpm -e --nodeps fedora-workstation-repositories
wget http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fedora-release-common-38-0.4.noarch.rpm http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fedora-repos-38-0.3.noarch.rpm http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fedora-gpg-keys-38-0.3.noarch.rpm http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fedora-workstation-backgrounds-1.6-1.fc38.noarch.rpm  http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fedora-release-38-0.4.noarch.rpm http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fedora-release-identity-basic-38-0.4.noarch.rpm http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fedora-release-workstation-38-0.4.noarch.rpm https://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fedora-repos-rawhide-38-0.3.noarch.rpm https://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/f/fedora-workstation-repositories-35-4.fc37.noarch.rpm

dnf install --allowerasing fedora-release-common-38-0.4.noarch.rpm fedora-repos-38-0.3.noarch.rpm fedora-gpg-keys-38-0.3.noarch.rpm fedora-workstation-backgrounds-1.6-1.fc38.noarch.rpm fedora-release-38-0.4.noarch.rpm fedora-release-workstation-38-0.4.noarch.rpm fedora-release-identity-basic-38-0.4.noarch.rpm fedora-repos-rawhide-38-0.3.noarch.rpm fedora-workstation-repositories-35-4.fc37.noarch.rpm
dnf reinstall fedora-repos-38-0.3.noarch.rpm
dnf update -y
dnf upgrade -y
dnf install -y neofetch
clear
neofetch
export DONE="Your system has been updated to fedora 38 repositorys"
echo $DONE
exit 