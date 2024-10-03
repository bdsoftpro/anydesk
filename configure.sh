#!/bin/bash

#disable spotlight indexing
sudo mdutil -i off -a

# Assign the value random password to the password variable
rustdesk_pw=$1

#Create new account
sudo dscl . -create /Users/admin
sudo dscl . -create /Users/admin UserShell /bin/bash
sudo dscl . -create /Users/admin RealName "Admin"
sudo dscl . -create /Users/admin UniqueID 1001
sudo dscl . -create /Users/admin PrimaryGroupID 80
sudo dscl . -create /Users/adminr NFSHomeDirectory /Users/admin
sudo dscl . -passwd /Users/admin $1
sudo dscl . -passwd /Users/admin $1
sudo createhomedir -c -u admin > /dev/null

sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -users admin -access -on -privs -all

sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent -console
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate
