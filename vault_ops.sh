#!/bin/bash

VAULT_DIR="secure_vault"

# Check if secure_vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: Directory '$VAULT_DIR' does not exist."
    echo "Please run vault_setup.sh first."
    exit 1
fi

# Menu loop
while true; do
    echo ""
    echo "=== SECURE VAULT MENU ==="
    echo "1. Add Secret"
    echo "2. Update Secret"
    echo "3. Add Log Entry"
    echo "4. Access Keys"
    echo "5. Exit"
    echo ""
    read -p "Select an option (1-5): " choice

    case $choice in
        1)
            # Add Secret
            read -p "Enter new secret: " secret
            echo "$secret" >> $VAULT_DIR/secrets.txt
            echo "Secret added successfully!"
            ;;
        2)
            # Update Secret
            read -p "Enter the secret to replace: " old_secret
            read -p "Enter the new secret: " new_secret

            # Use sed to replace and check if replacement occurred
            sed -i "" "s/$old_secret/$new_secret/g" $VAULT_DIR/secrets.txt 2>/dev/null

            # Check if the new secret exists in the file
            if grep -q "$new_secret" $VAULT_DIR/secrets.txt; then
                echo "Secret updated successfully!"
            else
                echo "No match found."
            fi
            ;;
        3)
            # Add Log Entry
            read -p "Enter log message: " log_message
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")
            echo "[$timestamp] $log_message" >> $VAULT_DIR/logs.txt
            echo "Log entry added successfully!"
            ;;
        4)
            # Access Keys
            echo "ACCESS DENIED 🚫"
VAULT_DIR="secure_vault"

# Check if secure_vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: Directory '$VAULT_DIR' does not exist."
    echo "Please run vault_setup.sh first."
    exit 1
fi

# Menu loop
while true; do
    echo ""
    echo "=== SECURE VAULT MENU ==="
    echo "1. Add Secret"
    echo "2. Update Secret"
    echo "3. Add Log Entry"
    echo "4. Access Keys"
    echo "5. Exit"
    echo ""
    read -p "Select an option (1-5): " choice

    case $choice in
        1)
            # Add Secret
            read -p "Enter new secret: " secret
            echo "$secret" >> $VAULT_DIR/secrets.txt
            echo "Secret added successfully!"
            ;;
        2)
            # Update Secret
            read -p "Enter the secret to replace: " old_secret
            read -p "Enter the new secret: " new_secret

            # Use sed to replace and check if replacement occurred
            sed -i "" "s/$old_secret/$new_secret/g" $VAULT_DIR/secrets.txt 2>/dev/null

            # Check if the new secret exists in the file
            if grep -q "$new_secret" $VAULT_DIR/secrets.txt; then
                echo "Secret updated successfully!"
            else
                echo "No match found."
            fi
            ;;
        3)
            # Add Log Entry
            read -p "Enter log message: " log_message
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")
            echo "[$timestamp] $log_message" >> $VAULT_DIR/logs.txt
            echo "Log entry added successfully!"
            ;;
        4)
            # Access Keys
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            # Exit
            echo "Exiting vault menu. Goodbye!"
            break
            ;;
        *)
            echo "Invalid option. Please select 1-5."
            ;;
    esac
done

