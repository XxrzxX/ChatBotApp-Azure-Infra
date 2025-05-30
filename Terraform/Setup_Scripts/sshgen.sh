#!/bin/bash
# This script generates SSH keys for Terraform to use with Azure.
#Make sure to store the key in safe place and not to share it with anyone.
cd ..
mkdir -p SSHKeys
ssh-keygen -t rsa -b 4096 -f SSHKeys/ChromaVM -N "" 
chmod 400 SSHKeys/ChromaVM

ssh-keygen -t rsa -b 4096 -f SSHKeys/VMSS -N "" 
chmod 400 SSHKeys/VMSS

echo "SSH keys generated in SSHKeys directory."
