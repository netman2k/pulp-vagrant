#!/bin/bash
set -e 

echo -e "\nDisabling PEERDNS to prevent using a domain DHCP gave us"
echo "PEERDNS=no" >> /etc/sysconfig/network
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
systemctl restart network

echo -e "\nDisabling SELinux..."
setenforce 0
sed -i 's/^\(SELinux=\)Enforcing/\1disabled/' /etc/selinux/config

echo -e "\nDisabling FirewallD..."
systemctl disable firewalld && systemctl stop $_

echo -e "\nAdding the Puppet repository..."
rpm -Uhv https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm

yum clean expire-cache

echo -e "\nInstalling some packages..."
yum install -y puppet-agent

echo -e "\nDisable Puppet service..."
systemctl disable puppet && systemctl stop $_

source /etc/profile.d/puppet-agent.sh

puppet module install stahnma/epel
puppet module install katello-pulp --version 5.3.0

