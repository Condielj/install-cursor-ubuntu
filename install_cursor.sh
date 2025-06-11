#!/bin/bash

# Cursor Installation Script for Ubuntu 24.04
# Author: Abdul's Setup Script

CURSOR_URL="$(curl -fsSL \
  'https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable' \
  | jq -r '.downloadUrl')"
CURSOR_APPIMAGE_PATH="$HOME/Downloads/Cursor.AppImage"
APPIMAGE_DEST="/opt/cursor.appimage"
ICON_URL="https://raw.githubusercontent.com/rahuljangirwork/copmany-logos/refs/heads/main/cursor.png"
ICON_PATH="/opt/cursor.png"
DESKTOP_ENTRY_PATH="/usr/share/applications/cursor.desktop"

# Function to check and install dependencies
install_dependencies() {
    echo "Updating package lists..."
    sudo apt update

    echo "Installing FUSE 2 (Required for AppImage support)..."
    sudo apt install -y libfuse2 curl
}

# Function to download Cursor AppImage if not found
download_cursor() {
    if [ ! -f "$CURSOR_APPIMAGE_PATH" ]; then
        echo "Cursor.AppImage not found in Downloads folder."
        echo "Downloading Cursor AppImage..."
        curl -L "$CURSOR_URL" -o "$CURSOR_APPIMAGE_PATH"

        if [ ! -f "$CURSOR_APPIMAGE_PATH" ]; then
            echo "Error: Failed to download Cursor AppImage."
            exit 1
        fi
    fi
}

# Function to move and set permissions for the AppImage
install_cursor() {
    echo "Moving Cursor AppImage to /opt..."
    sudo mv "$CURSOR_APPIMAGE_PATH" "$APPIMAGE_DEST"
    sudo chmod +x "$APPIMAGE_DEST"

    echo "Fixing permissions to prevent sandbox issues..."
    sudo chown root:root "$APPIMAGE_DEST"
    sudo chmod 4755 "$APPIMAGE_DEST"
}

# Function to create a .desktop entry for Cursor AI IDE
create_desktop_entry() {
    echo "Downloading Cursor icon..."
    sudo curl -L "$ICON_URL" -o "$ICON_PATH"

    echo "Creating .desktop entry for Cursor..."
    sudo bash -c "cat > $DESKTOP_ENTRY_PATH" <<EOL
[Desktop Entry]
Name=Cursor AI IDE
Exec=$APPIMAGE_DEST --no-sandbox
Icon=$ICON_PATH
Type=Application
Categories=Development;
EOL

    echo "Updating desktop database..."
    sudo chmod 644 "$DESKTOP_ENTRY_PATH"
}

# Function to run Cursor for verification
run_cursor() {
    echo "Launching Cursor AI IDE..."
    $APPIMAGE_DEST --no-sandbox &
}

# Main execution function
main() {
    install_dependencies
    download_cursor
    install_cursor
    create_desktop_entry
    echo "Cursor AI IDE installed successfully! You can find it in your application menu."
    run_cursor
}

# Execute main function
main
