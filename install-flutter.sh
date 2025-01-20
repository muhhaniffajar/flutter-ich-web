#!/bin/bash
# Install Flutter

# Install dependencies first (in case they are missing)
sudo apt-get update
sudo apt-get install -y wget curl git unzip

# Download and install Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"
echo "export PATH=\"$PATH:`pwd`/flutter/bin\"" >> ~/.bashrc

# Verify Flutter installation
flutter doctor
