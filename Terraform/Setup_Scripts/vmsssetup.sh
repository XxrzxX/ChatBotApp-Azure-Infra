#!/bin/bash
# This script sets up a Backend & Frontend environment with systemd services on a Linux machine.
# Check if the correct number of arguments is provided
if [ $# -ne 4 ]; then
    echo "Usage: $0 <PAT_token> <repo_url> <branch_name> <key_vault_name>"
    exit 1
fi

# Assign arguments to variables
PAT_TOKEN="$1"
REPO_URL="$2"
BRANCH_NAME="$3"
KEY_VAULT_NAME="$4"
REPO_NAME=$(basename "$REPO_URL" .git)
USER=$(whoami)
HOME_DIR=$(eval echo ~$USER)


# Set up Conda environment
echo "Setting up conda environment..."
source "$HOME_DIR/miniconda3/etc/profile.d/conda.sh"
if ! conda env list | grep -q "^project "; then
    conda create -y -n project python=3.11
fi

# Clone the repository
echo "Cloning repository..."
cd "$HOME_DIR"
if [ -d "$REPO_NAME" ]; then
    echo "Directory $REPO_NAME already exists. Please remove it or choose a different repository."
    exit 1
fi
export GITHUB_TOKEN="$PAT_TOKEN"
git clone -b "$BRANCH_NAME" "https://${GITHUB_TOKEN}@${REPO_URL}"
if [ $? -ne 0 ]; then
    echo "Failed to clone repository"
    exit 1
fi
cd "$REPO_NAME"

# Install requirements
echo "Installing requirements..."
if [ -f requirements.txt ]; then
    "$HOME_DIR/miniconda3/envs/project/bin/pip" install -r requirements.txt
else
    echo "No requirements.txt found"
fi

# Step 5: Create .env file in the repository directory
echo "Creating .env file..."
cat <<EOF | sudo tee $HOME_DIR/$REPO_NAME/.env
KEY_VAULT_NAME=$KEY_VAULT_NAME
EOF

# Create systemd services
echo "Creating systemd services..."

cat <<EOF | sudo tee /etc/systemd/system/backend.service
[Unit]
Description=backend
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$HOME_DIR/$REPO_NAME
ExecStart=$HOME_DIR/miniconda3/envs/project/bin/uvicorn backend:app --reload --port 5000
Restart=always

[Install]
WantedBy=multi-user.target
EOF

cat <<EOF | sudo tee /etc/systemd/system/frontend.service
[Unit]
Description=Streamlit
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$HOME_DIR/$REPO_NAME
ExecStart=$HOME_DIR/miniconda3/envs/project/bin/streamlit run chatbot.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and start services
echo "Reloading systemd and starting services..."
sudo systemctl daemon-reload
for service in backend frontend; do
    sudo systemctl enable $service
    sudo systemctl start $service
done

echo "Setup completed successfully"
