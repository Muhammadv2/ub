#!/bin/bash

display_main_menu() {
    clear
    echo "========================================"
    echo "          System Update Menu          "
    echo "========================================"
    echo "Please select an option:"
    echo "1) Update and Upgrade Packages"
    echo "2) Install Update Manager Core"
    echo "3) Configure Release Upgrades"
    echo "4) Reboot System"
    echo "5) Perform Release Upgrade"
    echo "========================================"
}

while true; do
    display_main_menu
    read -p "Enter your choice (1-5): " choice

    case $choice in
        1)
            echo "Updating package lists and upgrading..."
            sudo apt update
            sudo apt upgrade -y
            echo "Done! Press Enter to continue..."
            read
            ;;
        2)
            echo "Installing update-manager-core..."
            sudo apt install update-manager-core -y
            echo "Done! Press Enter to continue..."
            read
            ;;
        3)
            echo "Configuring release upgrades to 'normal'..."
            sudo sed -i 's/^Prompt=lts$/Prompt=normal/' /etc/update-manager/release-upgrades
            echo "Done! Press Enter to continue..."
            read
            ;;
        4)
            echo "Rebooting system..."
            sudo reboot
            ;;
        5)
            echo "Starting release upgrade..."
            sudo do-release-upgrade
            echo "Done! Press Enter to continue..."
            read
            ;;
        *)
            echo "Invalid option! Please select 1-5."
            echo "Press Enter to continue..."
            read
            ;;
    esac
done
