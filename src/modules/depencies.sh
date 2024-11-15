#!/bin/bash

# Check and install missing dependencies
check_dependencies() {
    log "Checking dependencies..." "Info"

    if ! command -v dialog &> /dev/null; then
        log "Dialog not installed, attempting to install" "Warning"
        install_dialog
        if ! command -v dialog &> /dev/null; then
            log "Failed to install dialog. Please check your system." "Error"
            exit 1
        fi
    fi

    log "All dependencies are satisfied." "Success"
}
