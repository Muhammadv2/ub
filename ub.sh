#!/bin/bash

while true; do
    echo "Select an option to proceed:"
    echo "1) Update the system"
    echo "2) Install necessary tools for upgrading"
    echo "3) Modify the release-upgrades file"
    echo "4) Start upgrade to version 22"
    echo "5) Reboot the system"
    echo "6) Exit"
    
    read -p "Enter your choice (1, 2, 3, 4, 5, or 6): " choice

    case $choice in
        1)
            # Step 1: Update the system
            echo "Updating the system..."
            sudo apt update -y
            sudo apt upgrade -y
            echo "Update completed. Press Enter to continue."
            read
            ;;
        2)
            # Step 2: Install necessary tools for upgrading
            echo "Installing necessary tools for upgrading..."
            sudo apt install update-manager-core -y
            echo "Tools installed. Press Enter to continue."
            read
            ;;
        3)
            # Step 3: Modify the release-upgrades file
            echo "Modifying the release-upgrades file..."
            sudo sed -i 's/^Prompt=lts$/Prompt=normal/' /etc/update-manager/release-upgrades
            echo "Release-upgrades file modified. Press Enter to continue."
            read
            ;;
        4)
            # Step 4: Start upgrade to version 22
            echo "Starting upgrade to version 22..."
            sudo do-release-upgrade -d
            echo "Upgrade process completed. Press Enter to continue."
            read
            ;;
        5)
            # Step 5: Reboot the system
            echo "Rebooting the system..."
            sudo shutdown -r now
            ;;
        6)
            # Exit the script
            echo "Exiting the script."
            break
            ;;
        *)
            echo "Invalid choice. Please select 1, 2, 3, 4, 5, or 6."
            ;;
    esac
done
