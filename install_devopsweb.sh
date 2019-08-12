#!/bin/bash
yum -y update
yum -y install epel-release
yum -y install docker git htop tree vim wget
systemctl start docker
systemctl enable docker
docker run --env DEVOPSWEB_CONFIG_MODE=Test1 -d --rm --name devopswebnl -p 80:5000 rgdevops123/devopswebnl
echo "Deployed via Terraform"
