#!/bin/bash

# Show Ubuntu version upgrade options
echo "Please select the Ubuntu version you want to upgrade to:"
echo "1. Ubuntu 22.04"
echo "2. Ubuntu 24.04"
read -p "Enter your choice (1 or 2): " version_choice

# Handle user choice
if [ "$version_choice" -eq 1 ]; then
    VERSION="22.04"
elif [ "$version_choice" -eq 2 ]; then
    VERSION="24.04"
else
    echo "Invalid selection. Exiting script."
    exit 1
fi

# Notify selected version
echo "Upgrading to Ubuntu $VERSION..."

# Update and upgrade current packages
sudo apt update && sudo apt upgrade -y
sudo apt dist-upgrade -y

# Start Ubuntu release upgrade
echo "Starting the release upgrade to Ubuntu $VERSION..."
sudo do-release-upgrade -d

echo "Upgrade to Ubuntu $VERSION completed successfully!"
