#!/bin/bash

USER="ec2-user"

# Install dependencies
sudo yum -y update
sudo yum -y install ruby
sudo yum -y install wget

# Install CodeDeploy agent
cd /home/$USER
wget https://aws-codedeploy-eu-west-3.s3.eu-west-3.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
