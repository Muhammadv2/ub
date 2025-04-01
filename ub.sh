#!/bin/bash

# رنگ‌ها
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # بدون رنگ

while true; do
    # منو با رنگ
    echo -e "${CYAN}Select an option to proceed:${NC}"
    echo -e "${GREEN}1) Update the system${NC}"
    echo -e "${GREEN}2) Install necessary tools for upgrading${NC}"
    echo -e "${GREEN}3) Modify the release-upgrades file${NC}"
    echo -e "${GREEN}4) Start upgrade to version 22${NC}"
    echo -e "${RED}5) Reboot the system${NC}"
    echo -e "${YELLOW}6) Exit${NC}"
    
    # برای خواندن ورودی کاربر
    read -p "$(echo -e ${BLUE}Enter your choice (1, 2, 3, 4, 5, or 6): ${NC})" choice

    case $choice in
        1)
            # Step 1: Update the system
            echo -e "${BLUE}Updating the system...${NC}"
            sudo apt update -y
            sudo apt upgrade -y
            echo -e "${GREEN}Update completed. Press Enter to continue.${NC}"
            read
            ;;
        2)
            # Step 2: Install necessary tools for upgrading
            echo -e "${BLUE}Installing necessary tools for upgrading...${NC}"
            sudo apt install update-manager-core -y
            echo -e "${GREEN}Tools installed. Press Enter to continue.${NC}"
            read
            ;;
        3)
            # Step 3: Modify the release-upgrades file
            echo -e "${BLUE}Modifying the release-upgrades file...${NC}"
            sudo sed -i 's/^Prompt=lts$/Prompt=normal/' /etc/update-manager/release-upgrades
            echo -e "${GREEN}Release-upgrades file modified. Press Enter to continue.${NC}"
            read
            ;;
        4)
            # Step 4: Start upgrade to version 22
            echo -e "${BLUE}Starting upgrade to version 22...${NC}"
            sudo do-release-upgrade -d
            echo -e "${GREEN}Upgrade process completed. Press Enter to continue.${NC}"
            read
            ;;
        5)
            # Step 5: Reboot the system
            echo -e "${RED}Rebooting the system...${NC}"
            sudo shutdown -r now
            ;;
        6)
            # Exit the script
            echo -e "${PURPLE}Exiting the script.${NC}"
            break
            ;;
        *)
            echo -e "${RED}Invalid choice. Please select 1, 2, 3, 4, 5, or 6.${NC}"
            ;;
    esac
done
