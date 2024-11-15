#!/bin/bash
# src/modules/install_dialog.sh

# Function to check and install dialog if missing
install_dialog() {
    if ! command -v dialog &> /dev/null; then
        echo -e "\\033[1;33mDialog not found. Installing now...\\033[0m"
        if run_as_root emerge --ask dev-util/dialog; then
            echo -e "\\033[1;32mDialog installed successfully.\\033[0m"
        else
            echo -e "\\033[1;31mFailed to install dialog. Please install it manually.\\033[0m"
            exit 1
        fi
    fi
}
