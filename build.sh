#!/bin/bash
# Install Flutter if not found
if ! command -v flutter &> /dev/null
then
    echo "Flutter could not be found, installing..."
    git clone https://github.com/flutter/flutter.git -b stable --depth 1
    export PATH="$PATH:`pwd`/flutter/bin"
fi

# Debugging: Cek apakah Flutter ada di path
echo "PATH: $PATH"
echo "Listing contents of /opt/build/repo:"
ls -al /opt/build/repo
echo "Listing contents of flutter directory:"
ls -al /opt/build/repo/flutter

# Pastikan flutter/bin ada di direktori yang benar
if [ ! -d "/opt/build/repo/flutter/bin" ]; then
  echo "Flutter not found in the specified directory!"
  exit 1
fi

# Check flutter installation
flutter --version

# Switch to stable channel
flutter channel stable
flutter upgrade

# Get dependencies
flutter pub get

# Build the Flutter web app
flutter build web
