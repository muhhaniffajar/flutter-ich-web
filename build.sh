#!/bin/bash

# Install Flutter SDK
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Cek apakah Flutter berhasil diinstall
flutter doctor

# Membuat build web untuk Flutter
flutter build web
