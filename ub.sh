#!/bin/bash

# Step 1: Update the system
echo "Updating the system..."
sudo apt update -y
sudo apt upgrade -y

# Step 2: Install necessary tools for upgrading
echo "Installing necessary tools for upgrading..."
sudo apt install update-manager-core -y

# Step 3: Modify the release-upgrades file
echo "Modifying the release-upgrades file..."
sudo sed -i '/^#Prompt=normal/s/^#//g' /etc/update-manager/release-upgrades  # Un-comment Prompt=normal
sudo sed -i '/^Prompt=normal/d' /etc/update-manager/release-upgrades           # Remove existing Prompt=normal if it exists
echo "Prompt=normal" | sudo tee -a /etc/update-manager/release-upgrades        # Add Prompt=normal

# Step 4: Run the upgrade command
echo "Starting upgrade to version 24..."
sudo do-release-upgrade -d

# If the upgrade doesn't run automatically, use the following command:
# sudo do-release-upgrade -d
