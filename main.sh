#!/bin/bash
# Set DIALOGRC
export DIALOGRC="./config/dialogrc"
LOG_FILE="./logs/maintenance.log"

# Source core modules
source ./src/utils/utils.sh
source ./src/modules/maintenance.sh
source ./src/modules/install_dialog.sh

log "Starting Gentoo Maintenance Script" "Success"

# Function to check if dialog is installed
check_dialog_installed() {
    if command -v dialog &> /dev/null; then
        echo "Dialog is already installed."
        return 0
    else
        echo "Dialog is not installed."
        return 1
    fi
}

# Main script logic
echo "Checking for dialog installation..."

if check_dialog_installed; then
    echo "Dialog is already available. No action needed."
else
    install_dialog
    if check_dialog_installed; then
        echo "Dialog installed successfully."
    else
        echo "Failed to install dialog. Please check for issues with Portage or network connection."
    fi
fi

# Main menu logic
while true; do
  dialog --colors --title "\Zb\Z5Gentoo Maintenance Tool\Zn" \
  --menu "Select an option:" 15 50 5 \
  1 "System Maintenance" \
  2 "Customization" \
  3 "Exit" 2> tmp/menu_choice.txt

  # Get the user's choice
  choice=$(<tmp/menu_choice.txt)

  case $choice in
    1)
      # Call the maintenance submenu function
      clear
      perform_maintenance
      ;;
    2)
      clear
      echo "Customization module is under development."
      sleep 2
      ;;
    3)
      clear
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid option, please try again."
      sleep 2
      ;;
  esac
done
