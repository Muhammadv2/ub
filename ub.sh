#!/bin/bash

# Step 1: Update the system
echo "Updating the system..."
sudo apt update -y
sudo apt upgrade -y

# Step 2: Install necessary tools for upgrading
echo "Installing necessary tools for upgrading..."
sudo apt install update-manager-core -y

# Step 3: Configure the release-upgrades file
echo "Configuring the release-upgrades file..."
sudo sed -i 's/^#Prompt=normal/Prompt=normal/' /etc/update-manager/release-upgrades

# Step 4: Run the upgrade command
echo "Starting upgrade to version 24..."
sudo do-release-upgrade -d

# If the upgrade doesn't run automatically, you can use the following command:
# sudo do-release-upgrade -d
