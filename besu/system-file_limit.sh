#!/bin/bash 
sudo sh -c 'echo "* hard nofile 100000" >> /etc/security/limits.conf'
sudo sh -c 'echo "* soft nofile 100000" >> /etc/security/limits.conf'
sudo sh -c 'echo "root hard nofile 100000" >> /etc/security/limits.conf'
sudo sh -c 'echo "root soft nofile 100000" >> /etc/security/limits.conf'
