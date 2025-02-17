#!/bin/bash

# Define the path of the plist file
PLIST_PATH="/Library/Preferences/com.philandro.anydesk.plist"

# Write the plist file with a predefined password
sudo tee "$PLIST_PATH" > /dev/null <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Password</key>
    <string>YourSecurePassword</string>
</dict>
</plist>
EOF

# Set correct permissions for the file
sudo chmod 644 "$PLIST_PATH"
sudo chown root:wheel "$PLIST_PATH"

# Restart AnyDesk service to apply changes
sudo launchctl unload /Library/LaunchDaemons/com.philandro.anydesk.Helper.plist
sudo launchctl load /Library/LaunchDaemons/com.philandro.anydesk.Helper.plist

echo "AnyDesk password has been set successfully."
