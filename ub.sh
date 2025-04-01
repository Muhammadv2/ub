#!/bin/bash

# Simple ASCII art header
echo "================================="
echo "      SYSTEM UPDATE SCRIPT      "
echo "================================="
echo "          .-""""""""-."
echo "        .'          '."
echo "       /   ʕ ˵• ₒ •˵ ʔ  \\"
echo "      : ,          : '"
echo "       ''._         _.'"
echo "          '|'"""""|'"
echo "================================="
echo ""

# Option 1: Update and upgrade packages
echo "Step 1: Updating package lists and upgrading..."
echo "----------------------------------------"
sudo apt update
sudo apt upgrade -y
echo "----------------------------------------"
echo "Step 1 Complete!"
echo ""

# Option 2: Install update-manager-core
echo "Step 2: Installing update-manager-core..."
echo "----------------------------------------"
sudo apt install update-manager-core -y
echo "----------------------------------------"
echo "Step 2 Complete!"
echo ""

# Option 3: Modify release-upgrades config
echo "Step 3: Configuring release upgrades to 'normal'..."
echo "----------------------------------------"
sudo sed -i 's/^Prompt=lts$/Prompt=normal/' /etc/update-manager/release-upgrades
echo "----------------------------------------"
echo "Step 3 Complete!"
echo ""

# Option 4: Perform release upgrade
echo "Step 4: Starting release upgrade..."
echo "----------------------------------------"
sudo do-release-upgrade
echo "----------------------------------------"
echo "Step 4 Complete!"
echo ""

# ASCII art footer
echo "================================="
echo "     UPDATE PROCESS FINISHED!    "
echo "================================="
echo "          .-""""""""-."
echo "        .'          '."
echo "       /   ʕ ˵• ₒ •˵ ʔ  \\"
echo "      : ,          : '"
echo "       ''._         _.'"
echo "          '|'"""""|'"
echo "================================="
