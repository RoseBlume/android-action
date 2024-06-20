#!/bin/sh -l
apt-get install openjdk-21-jre
apt-get install gradle
apt-get install rustup
apt-get install npm
npm install --force -g npm@latest
npm install --force -g nodejs@latest

rustup target add aarch64-linux-android armv7-linux-androideabi i686-linux-android x86_64-linux-android

mkdir Android
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
unzip *.zip -d Android

cd Android/cmdline-tools
yes | bin/sdkmanager --licenses --sdk_root=..> /dev/null || true

# Install SDK Platform
bin/sdkmanager --sdk_root=.. "platforms;android-33"
# Install Platform Tools
bin/sdkmanager --sdk_root=.. "platform-tools"
# Install Build Tools
bin/sdkmanager --sdk_root=.. "build-tools;34.0.0"
# Install NDK
bin/sdkmanager --sdk_root=.. "ndk;27.0.11718014"
