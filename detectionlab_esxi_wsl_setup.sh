#!/bin/bash

# DetectionLab Ubuntu 18.04 provisioning host setup script
# toddslab.net

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'


printf "\n${yel}Updating System...${end} "
apt update > /dev/null 2>&1 && upgrade -y > /dev/null 2>&1
printf "${grn}Done!${end}\n"

sleep 3

printf "${yel}Adding Ansible Repository...${end} "
apt-add-repository –yes –update ppa:ansible/ansible > /dev/null 2>&1
printf "${grn}Done!${end}\n"

sleep 3

printf "${yel}Installing required packages...${end} "
apt install python python-pip ansible unzip sshpass libffi-dev libssl-dev -y > /dev/null 2>&1
pip install pywinrm > /dev/null 2>&1
printf "${grn}Done!${end}\n"

sleep 3

printf "${yel}Switching to home directory...${end}\n"

cd ~

sleep 2

#install terraform

printf "${yel}Downloading and installing Terraform...${end} "
wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip > /dev/null 2>&1
unzip terraform_0.12.29_linux_amd64.zip > /dev/null 2>&1
mv terraform /usr/bin/ > /dev/null 2>&1
printf "${grn}Done!${end}\n"

sleep 3

#install packer

printf "${yel}Downloading and installing Packer...${end} "
wget https://releases.hashicorp.com/packer/1.6.1/packer_1.6.1_linux_amd64.zip > /dev/null 2>&1
unzip packer_1.6.1_linux_amd64.zip > /dev/null 2>&1
mv packer /usr/bin/ > /dev/null 2>&1
printf "${grn}Done!${end}\n"

sleep 3

#install terraform-esxi-provider

printf "${yel}Downloading and installing Terraform-Provider-ESXi...${end} "
wget https://github.com/josenk/terraform-provider-esxi/releases/download/v1.7.1/terraform-provider-esxi_1.7.1_linux_amd64.zip > /dev/null 2>&1
unzip terraform-provider-esxi_1.7.1_linux_amd64.zip > /dev/null 2>&1
mv terraform-provider-esxi_v1.7.1 /usr/bin/ > /dev/null 2>&1
printf "${grn}Done!${end}\n"

sleep 3

# clone detectionlab

printf "${yel}Cloning DetectionLab from GitHub...${end} "
git clone https://github.com/clong/DetectionLab.git
printf "${grn}Done!${end}\n\n"

printf "${red}Provision host setup complete. Don't forget to install ovftool from${end} https://my.vmware.com/web/vmware/details?downloadGroup=OVFTOOL420&productId=618 \n\n"
