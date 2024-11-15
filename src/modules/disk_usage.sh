#!/bin/bash

list_and_select_disk() {
    log "Generating disk menu" "Info"

    # Extract disk info into menu items
    menu_items=()
    while IFS= read -r line; do
        name=$(echo "$line" | awk '{print $1}')
        size=$(echo "$line" | awk '{print $2}')
        mountpoint=$(echo "$line" | awk '{print $3}')
        if [[ -z "$mountpoint" ]]; then
            mountpoint="Not Mounted"
        fi
        menu_items+=("$name" "$size ($mountpoint)")
    done < <(lsblk --noheadings --output NAME,SIZE,MOUNTPOINT)

    # Display menu dynamically
    dialog --menu "Select a disk or partition for details:" 20 60 15 "${menu_items[@]}" 2> runtime/menu_choice.txt

    # Get selected disk/partition
    choice=$(<runtime/menu_choice.txt)

    if [[ -n "$choice" ]]; then
        # Run blkid for the selected disk/partition
        blkid_output=$(blkid "/dev/$choice")

        # Check if blkid returned information
        if [[ -n "$blkid_output" ]]; then
            echo "$blkid_output" > runtime/disk_details.txt
        else
            echo "No blkid information available for /dev/$choice" > runtime/disk_details.txt
        fi

        # Display blkid details in a dialog box
        dialog --textbox runtime/disk_details.txt 20 60
    else
        log "No selection made" "Warning"
    fi
}

list_and_select_disk
