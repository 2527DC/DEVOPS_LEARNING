#!/bin/bash
yum update -y
yum install -y htop telnet nc

echo "Bastion host is ready for SSH tunneling to private instances" > /etc/motd

yum install -y mysql-client