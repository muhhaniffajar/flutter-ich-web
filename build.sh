#!/bin/bash
set -e

# Pindah ke channel stable dan pastikan Flutter up-to-date
echo "Switching to stable channel..."
flutter channel stable

echo "Upgrading Flutter..."
flutter upgrade

# Resolusi dependencies
echo "Resolving dependencies..."
flutter pub get

# Build untuk web
echo "Building for web (release)..."
flutter build web --release

# Periksa konfigurasi dan lingkungan
echo "Checking Flutter environment..."
flutter doctor
