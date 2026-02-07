#!/bin/bash
# Ollian Linux Oxygen 1.3 update script

echo "🔹 Starting update to Ollian Linux Oxygen 1.3..."

# Update system packages
sudo apt update && sudo apt full-upgrade -y

# Update release info
sudo tee /etc/ollian-release > /dev/null <<EOF
NAME="Ollian Linux"
VERSION="1.3"
CODENAME="Oxygen"
ARCHITECTURE="$(uname -m)"
EOF

# MOTD update
sudo tee /etc/motd > /dev/null <<EOF
Welcome to Ollian Linux 1.3 "Oxygen"
Keep evolving with new elements!
EOF

echo "✅ Update to Oxygen complete!"
