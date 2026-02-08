#!/bin/bash
DIR="secure_vault"
# Check if secure_vault exists
if [ ! -d "$DIR" ]; then
  echo "Error: Directory '$DIR' does not exist."
  exit 1
fi

# Function to update file permissions
update_permission() {
    local file=$1
    local default_perm=$2

    echo ""
    echo "Current permissions for $file:"
    ls -l ~/secure_vault/$file

    read -p "Do you want to update the permission? (yes/no): " answer

    if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
        read -p "Enter new permission (or press Enter for default $default_perm): " new_perm

        if [ -z "$new_perm" ]; then
            new_perm=$default_perm
        fi

        chmod $new_perm ~/secure_vault/$file
        echo "Permission updated to $new_perm for $file"
    else
        echo "Permission unchanged for $file"
    fi
}
# Update permissions for each file with their default values
update_permission "keys.txt" "600"
update_permission "secrets.txt" "640"
update_permission "logs.txt" "644"

# Display all file permissions at the end
echo ""
echo "Final permissions for all files:"
ls -l ~/secure_vault

