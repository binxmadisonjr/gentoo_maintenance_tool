k#!/bin/bash

# Function to display menu
main_menu() {
    local menu_config="config/main.menu"
    local menu_items=()
    local actions=()

    # Read the menu configuration
    while IFS=":" read -r key title action; do
        menu_items+=("$key" "$title")
        actions["$key"]="$action"
    done < "$menu_config"

    while true; do
        # Display the menu
        dialog --colors --title "\\Zb\\Z5Gentoo Maintenance Tool\\Zn" \
        --menu "Select an option:" 15 50 5 "${menu_items[@]}" 2> runtime/menu_choice.txt

        # Get the user's choice
        choice=$(<runtime/menu_choice.txt)

        # Execute the action associated with the choice
        if [[ -n "$choice" ]]; then
            local action="${actions["$choice"]}"

            if [[ "$action" == "exit_script" ]]; then
                log "Exiting Gentoo Maintenance Tool" "Success"
                exit 0
            elif [[ "$action" == "show_logs" ]]; then
                log "Viewing logs" "Info"
                dialog --textbox "$LOG_FILE" 20 60
            elif [[ -f "$action" ]]; then
                log "Executing $title module" "Info"
                source "$action"
            else
                log "Unknown action: $action" "Error"
            fi
        else
            log "No valid choice selected" "Warning"
        fi
    done
}

