#!/bin/bash

# Kothari UI Font Download Script
# Downloads and sets up self-hosted fonts for maximum performance

set -e

echo "🎨 Downloading Kothari UI fonts..."

FONTS_DIR="web/fonts"
LATO_DIR="$FONTS_DIR/lato"
JETBRAINS_DIR="$FONTS_DIR/jetbrains-mono"

# Create directories
mkdir -p "$LATO_DIR" "$JETBRAINS_DIR"

# Download Lato
echo "📥 Downloading Lato..."
if command -v curl &> /dev/null; then
    curl -L "https://fonts.google.com/download?family=Lato" -o /tmp/lato.zip
    unzip -q /tmp/lato.zip -d /tmp/lato-temp
    find /tmp/lato-temp -name "*.woff2" -exec cp {} "$LATO_DIR/" \;
    rm -rf /tmp/lato-temp /tmp/lato.zip
    echo "✅ Lato downloaded to $LATO_DIR"
else
    echo "⚠️  curl not found. Please download Lato manually from https://fonts.google.com/specimen/Lato"
    echo "   Place woff2 files in: $LATO_DIR"
fi

# Download JetBrains Mono
echo "📥 Downloading JetBrains Mono..."
if command -v curl &> /dev/null; then
    curl -L "https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip" -o /tmp/jetbrains-mono.zip
    unzip -q /tmp/jetbrains-mono.zip -d /tmp/jetbrains-temp
    find /tmp/jetbrains-temp -name "*.woff2" -exec cp {} "$JETBRAINS_DIR/" \;
    rm -rf /tmp/jetbrains-temp /tmp/jetbrains-mono.zip
    echo "✅ JetBrains Mono downloaded to $JETBRAINS_DIR"
else
    echo "⚠️  curl not found. Please download JetBrains Mono manually from https://www.jetbrains.com/lp/mono/"
    echo "   Place woff2 files in: $JETBRAINS_DIR"
fi

echo ""
echo "✨ Font setup complete!"
echo "   Fonts are now self-hosted and will load fast from your domain."
echo "   No external dependencies required!"

