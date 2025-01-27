#!/bin/bash
# Stop build jika ada error
set -e

# Install Flutter jika belum ditemukan
if ! command -v flutter &> /dev/null; then
    echo "Flutter tidak ditemukan. Mengunduh Flutter..."
    
    # Periksa apakah wget atau curl tersedia
    if command -v wget &> /dev/null; then
        wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.1-stable.tar.xz
    elif command -v curl &> /dev/null; then
        curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.1-stable.tar.xz
    else
        echo "wget atau curl tidak ditemukan, instal salah satu untuk melanjutkan."
        exit 1
    fi

    tar xf flutter_linux_3.13.1-stable.tar.xz
    export PATH="$PWD/flutter/bin:$PATH"
fi

# Debugging: Cek apakah Flutter sudah terpasang
echo "PATH: $PATH"
flutter --version

# Pastikan menggunakan stable channel
flutter channel stable
flutter upgrade

# Aktifkan dukungan web
flutter config --enable-web

# Install dependencies
flutter pub get

# Build aplikasi untuk web
flutter build web
