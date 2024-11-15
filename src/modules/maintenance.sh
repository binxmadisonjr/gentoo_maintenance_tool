#!/bin/bash
system_maintenance_menu() {
    local menu_config="config/system_maintenance.menu"
    local menu_items=()
    local actions=()

    while IFS=":" read -r key title action; do
        menu_items+=("$key" "$title")
        actions["$key"]="$action"
    done < "$menu_config"

    dialog --colors --title "\\Zb\\Z5System Maintenance\\Zn" \
    --menu "Choose a maintenance task:" 15 50 5 "${menu_items[@]}" 2> runtime/menu_choice.txt

    choice=$(<runtime/menu_choice.txt)

    if [[ -n "$choice" ]]; then
        local action="${actions["$choice"]}"

        if [[ "$action" == "main_menu" ]]; then
            main_menu
        elif [[ -f "$action" ]]; then
            source "$action"
        else
            log "Unknown action: $action" "Error"
        fi
    fi
}
system_maintenance_menu
