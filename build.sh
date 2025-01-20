#!/bin/bash

# Install Flutter SDK
git clone https://github.com/flutter/flutter.git /opt/flutter
export PATH="$PATH:/opt/flutter/bin"

# Menjalankan perintah build
flutter doctor
flutter build web
