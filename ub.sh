#!/bin/bash

# Script to upgrade Ubuntu 20.04 to 24.04 via 22.04 with automatic reboot

# Exit on any error
set -e

# Function to check if the script is run as root
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "This script must be run as root. Use sudo or switch to root user."
        exit 1
    fi
}

# Function to update and upgrade the current system
update_system() {
    echo "Updating and upgrading the current system..."
    apt update
    apt upgrade -y
    apt dist-upgrade -y
    apt autoremove -y
    apt autoclean
}

# Function to install update-manager-core (if not installed)
install_update_manager() {
    echo "Checking for update-manager-core..."
    if ! dpkg -l | grep -q update-manager-core; then
        echo "Installing update-manager-core..."
        apt install -y update-manager-core
    fi
}

# Function to configure LTS upgrade prompt
configure_lts_upgrade() {
    echo "Configuring system to allow LTS upgrades..."
    if [ -f /etc/update-manager/release-upgrades ]; then
        sed -i 's/Prompt=.*/Prompt=lts/' /etc/update-manager/release-upgrades
    else
        echo "Error: /etc/update-manager/release-upgrades not found!"
        exit 1
    fi
}

# Function to perform the upgrade to the next LTS version
do_release_upgrade() {
    local target_version=$1
    echo "Upgrading to Ubuntu $target_version..."
    do-release-upgrade -f DistUpgradeViewNonInteractive
    if [ $? -ne 0 ]; then
        echo "Error: Upgrade to $target_version failed!"
        exit 1
    fi
}

# Function to verify the current Ubuntu version
check_version() {
    local expected_version=$1
    current_version=$(lsb_release -rs)
    if [ "$current_version" != "$expected_version" ]; then
        echo "Error: Expected Ubuntu $expected_version, but found $current_version."
        exit 1
    else
        echo "Successfully upgraded to Ubuntu $current_version."
    fi
}

# Function to reboot the system
reboot_system() {
    echo "Upgrade to Ubuntu 24.04 LTS completed successfully!"
    echo "The system will now reboot in 10 seconds to apply all changes..."
    echo "After reboot, run 'lsb_release -a' to confirm the new version."
    sleep 10  # Give the user 10 seconds to read the message
    if command -v reboot >/dev/null 2>&1; then
        reboot
    else
        echo "Error: 'reboot' command not found. Please reboot manually."
        exit 1
    fi
}

# Main script execution
echo "Starting Ubuntu upgrade from 20.04 to 24.04..."

# Step 1: Check if running as root
check_root

# Step 2: Update the current system (20.04)
update_system

# Step 3: Install update-manager-core
install_update_manager

# Step 4: Configure for LTS upgrades
configure_lts_upgrade

# Step 5: Upgrade to 22.04
echo "Starting upgrade to Ubuntu 22.04 LTS..."
do_release_upgrade "22.04"

# Step 6: Verify upgrade to 22.04
check_version "22.04"

# Step 7: Update the system again (now on 22.04)
update_system

# Step 8: Upgrade to 24.04
echo "Starting upgrade to Ubuntu 24.04 LTS..."
do_release_upgrade "24.04"

# Step 9: Verify upgrade to 24.04
check_version "24.04"

# Step 10: Final system update and cleanup
update_system

# Step 11: Reboot the system
reboot_system

exit 0
