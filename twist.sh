#!/bin/bash
# Ollian Linux Twist Script: Element Color Themes
USER_HOME="/home/ollianlinux"
BASHRC="$USER_HOME/.bashrc"

# Detect current element
if [ -f /etc/ollian-release ]; then
    ELEMENT=$(grep CODENAME /etc/ollian-release | cut -d '=' -f2 | tr -d '"')
else
    echo "❌ Cannot detect current element."
    exit 1
fi

echo "✨ Applying color theme for $ELEMENT ..."

case "$ELEMENT" in
    Carbon)
        echo "🔹 Carbon: dark gray terminal"
        cat << 'EOF' >> "$BASHRC"
# Carbon Theme
PS1="\[\e[1;32m\]\u@\h:\w$ \[\e[0m\]"
EOF
        ;;
    Silicon)
        echo "🔹 Silicon: electric blue prompt"
        cat << 'EOF' >> "$BASHRC"
# Silicon Theme
PS1="\[\e[1;34m\]\u@\h:\w$ \[\e[0m\]"
EOF
        ;;
    Nitrogen)
        echo "🔹 Nitrogen: green dashboard"
        cat << 'EOF' >> "$BASHRC"
# Nitrogen Theme
PS1="\[\e[1;32m\]\u@\h:\w$ \[\e[0m\]"
EOF
        ;;
    Oxygen)
        echo "🔹 Oxygen: cyan text + quotes"
        cat << 'EOF' >> "$BASHRC"
# Oxygen Theme
PS1="\[\e[1;36m\]\u@\h:\w$ \[\e[0m\]"
EOF
        ;;
    Neon)
        echo "🔹 Neon: rainbow prompt"
        cat << 'EOF' >> "$BASHRC"
# Neon Theme
PS1="\[\e[38;5;$((RANDOM%256))m\]\u@\h:\w$ \[\e[0m\]"
EOF
        ;;
    *)
        echo "❌ Unknown element"
        ;;
esac

echo "✅ Color theme applied! Open a new terminal to see it."
