#!/bin/bash
# Ollian Linux Twist Script
# Adds unique features for each element (Carbon → Neon)

# Detect current element
if [ -f /etc/ollian-release ]; then
    ELEMENT=$(grep CODENAME /etc/ollian-release | cut -d '=' -f2 | tr -d '"')
else
    echo "❌ Cannot detect current element. Please run an element update first."
    exit 1
fi

echo "✨ Applying twists for $ELEMENT ..."

case "$ELEMENT" in
    Carbon)
        # Carbon Twist: Dark terminal theme + alias
        echo "🔹 Carbon twist: dark terminal & aliases"
        gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark" 2>/dev/null || true
        echo "alias ll='ls -alF --color=auto'" >> ~/.bashrc
        ;;
    
    Silicon)
        # Silicon Twist: Quick Wi-Fi toggle script
        echo "🔹 Silicon twist: Wi-Fi quick toggle script"
        cat << 'EOF' > ~/toggle_wifi.sh
#!/bin/bash
STATUS=$(nmcli radio wifi)
if [ "$STATUS" = "enabled" ]; then
    nmcli radio wifi off
    echo "Wi-Fi disabled"
else
    nmcli radio wifi on
    echo "Wi-Fi enabled"
fi
EOF
        chmod +x ~/toggle_wifi.sh
        echo "Run ~/toggle_wifi.sh to toggle Wi-Fi"
        ;;
    
    Nitrogen)
        # Nitrogen Twist: System info dashboard on login
        echo "🔹 Nitrogen twist: system info dashboard"
        cat << 'EOF' >> ~/.bashrc
echo "=== Nitrogen Dashboard ==="
echo "CPU: $(lscpu | grep 'Model name')"
echo "Memory: $(free -h | grep Mem)"
echo "Disk: $(df -h / | tail -1)"
echo "=========================="
EOF
        ;;
    
    Oxygen)
        # Oxygen Twist: Random motivational quotes on login
        echo "🔹 Oxygen twist: motivational quotes"
        cat << 'EOF' >> ~/.bashrc
QUOTES=("Keep evolving!" "You are unstoppable!" "Think big, start small." "Code the future!")
echo "💡 ${QUOTES[$RANDOM % ${#QUOTES[@]}]}"
EOF
        ;;
    
    Neon)
        # Neon Twist: Colorful terminal prompt
        echo "🔹 Neon twist: rainbow prompt"
        cat << 'EOF' >> ~/.bashrc
PS1="\[\e[38;5;$((RANDOM%256))m\]\u@\h:\w$ \[\e[0m\]"
EOF
        ;;

    *)
        echo "❌ Unknown element. No twist applied."
        exit 1
        ;;
esac

echo "✅ Twist applied for $ELEMENT! Open a new terminal to see changes."
