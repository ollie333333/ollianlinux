#!/bin/bash
# Ollian Linux Nitrogen 1.2 update script

echo "🔹 Starting update to Ollian Linux Nitrogen 1.2..."

# Update system packages
sudo apt update && sudo apt full-upgrade -y

# Update release info
sudo tee /etc/ollian-release > /dev/null <<EOF
NAME="Ollian Linux"
VERSION="1.2"
CODENAME="Nitrogen"
ARCHITECTURE="$(uname -m)"
EOF

# MOTD update
sudo tee /etc/motd > /dev/null <<EOF
Welcome to Ollian Linux 1.2 "Nitrogen"
Keep evolving with new elements!
EOF

echo "✅ Update to Nitrogen complete!"
