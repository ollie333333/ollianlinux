#!/bin/bash
# Ollian Linux Neon 1.4 update script

echo "🔹 Starting update to Ollian Linux Neon 1.4..."

# Update system packages
sudo apt update && sudo apt full-upgrade -y

# Update release info
sudo tee /etc/ollian-release > /dev/null <<EOF
NAME="Ollian Linux"
VERSION="1.4"
CODENAME="Neon"
ARCHITECTURE="$(uname -m)"
EOF

# MOTD update
sudo tee /etc/motd > /dev/null <<EOF
Welcome to Ollian Linux 1.4 "Neon"
Keep evolving with new elements!
EOF

echo "✅ Update to Neon complete!"
