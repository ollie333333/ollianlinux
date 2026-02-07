#!/bin/bash
# Ollian Linux Silicon 1.1 update script

echo "🔹 Starting update to Ollian Linux Silicon 1.1..."

# Update system packages
sudo apt update && sudo apt full-upgrade -y

# Update release info
sudo tee /etc/ollian-release > /dev/null <<EOF
NAME="Ollian Linux"
VERSION="1.1"
CODENAME="Silicon"
ARCHITECTURE="$(uname -m)"
EOF

# MOTD update
sudo tee /etc/motd > /dev/null <<EOF
Welcome to Ollian Linux 1.1 "Silicon"
Keep evolving with new elements!
EOF

echo "✅ Update to Silicon complete!"
