#!/bin/bash

#disable spotlight indexing
sudo mdutil -i off -a

# Assign the value random password to the password variable
rustdesk_pw=$1

echo "Password: $rustdesk_pw"
