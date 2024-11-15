#!/bin/bash
export DIALOGRC="./config/dialogrc"
LOG_FILE="./logs/maintenance.log"

> "$LOG_FILE"

source ./src/utils/utils.sh
source ./src/modules/install_dialog.sh
source ./src/modules/menu.sh

log "Starting Gentoo Maintenance Tool" "Success"

if ! command -v dialog &> /dev/null; then
    log "Dialog not installed, attempting to install" "Warning"
    install_dialog
fi

main_menu
