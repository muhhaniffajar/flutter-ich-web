#!/bin/bash
# Install Flutter
apt-get update
apt-get install -y git curl unzip

# Download and install Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"
echo "export PATH=\"$PATH:`pwd`/flutter/bin\"" >> ~/.bashrc

# Verify Flutter installation
flutter doctor
