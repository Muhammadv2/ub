#!/bin/bash

# Option 1: Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Option 2: Install update-manager-core
sudo apt install update-manager-core -y

# Option 3: Modify release-upgrades config
sudo sed -i 's/^Prompt=lts$/Prompt=normal/' /etc/update-manager/release-upgrades

# Option 4: Perform release upgrade
sudo do-release-upgrade
