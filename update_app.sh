#!/bin/bash
set -e

date
echo "Updating Python application on VM..."

APP_DIR="/home/azureuser/SDA_CC"
GIT_REPO="https://github.com/XxrzxX/SDA_CC.git"
BRANCH="main"

# Update code
if [ -d "$APP_DIR" ]; then
    sudo -u azureuser bash -c "cd $APP_DIR && git pull origin $BRANCH"
else
    sudo -u azureuser git clone -b $BRANCH "https://$GITHUB_TOKEN@$GIT_REPO" "$APP_DIR"
    sudo -u azureuser bash -c "cd $APP_DIR"
fi

# Install dependencies
sudo -u azureuser /home/azureuser/miniconda3/envs/project/bin/pip install --upgrade pip
sudo -u azureuser /home/azureuser/miniconda3/envs/project/bin/pip install -r "$APP_DIR/requirements.txt"

# Restart the service
sudo -u azureuser systemctl restart backend.service
sudo -u azureuser systemctl restart frontend.service
sudo -u azureuser systemctl restart chromadb.service 

echo "Python application update completed!"
