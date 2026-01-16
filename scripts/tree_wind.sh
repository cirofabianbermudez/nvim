#!/bin/bash

function print_tree() {
    local directory="$1"
    local prefix="$2"

    # Get a list of directories and files in alphabetical order
    local items=($(ls -1 "$directory" | sort))

    # Determine the last index
    local last_index=$((${#items[@]} - 1))

    # Loop through each item in the directory
    for index in "${!items[@]}"; do
        local item="${items[index]}"

        # Determine the prefix for the current item
        local item_prefix="${prefix}├──"
        local sub_prefix="${prefix}│   "
        [ "$index" -eq "$last_index" ] && item_prefix="${prefix}└──" && sub_prefix="${prefix}    "

        # Print current item with appropriate prefix for file or directory
        if [ -d "$directory/$item" ]; then
            echo "${item_prefix} $(basename "$item")/"
            print_tree "$directory/$item" "$sub_prefix"
        else
            echo "${item_prefix} $(basename "$item")"
        fi
    done
}

# Check if a directory is provided as an argument
if [ $# -eq 0 ]; then
    # If no directory provided, use the current directory
    echo "$(pwd)"
    print_tree "." ""
else
    # If a directory is provided, use that directory
    echo "$1"
    print_tree "$1" ""
fi
