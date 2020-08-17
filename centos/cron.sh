#!/bin/bash

sudo yum -y install yum-cron
sudo sed -i 's/^update_cmd =.*/update_cmd = default/g' /etc/yum/yum-cron.conf
sudo sed -i 's/^download_updates =.*/download_updates = yes/g' /etc/yum/yum-cron.conf
sudo sed -i 's/^apply_updates =.*/apply_updates = yes/g' /etc/yum/yum-cron.conf
sudo systemctl enable yum-cron
sudo systemctl start yum-cron
