#!/bin/bash
# Ollian Linux Carbon 1.0 update script

echo "🔹 Starting update to Ollian Linux Carbon 1.0..."

# Update system packages
sudo apt update && sudo apt full-upgrade -y

# Update release info
sudo tee /etc/ollian-release > /dev/null <<EOF
NAME="Ollian Linux"
VERSION="1.0"
CODENAME="Carbon"
ARCHITECTURE="$(uname -m)"
EOF

# MOTD update
sudo tee /etc/motd > /dev/null <<EOF
Welcome to Ollian Linux 1.0 "Carbon"
Keep evolving with new elements!
EOF

echo "✅ Update to Carbon complete!"
