#!/bin/bash

# please set your cargo rustc python location
# more see https://github.com/mozilla/rust-android-gradle#specifying-paths-to-sub-commands-python-cargo-and-rustc
#export RUST_ANDROID_GRADLE_PYTHON_COMMAND=$HOME/.pyenv/shims/python # set the path on your computer
#export RUST_ANDROID_GRADLE_CARGO_COMMAND=$HOME/.cargo/bin/cargo # set the path on your computer
#export RUST_ANDROID_GRADLE_RUSTC_COMMAND=$HOME/.cargo/bin/rustc # set the path on your computer
#

current_dir=$(pwd)
echo 'current_dir:'
echo "$current_dir"

env
ls -l "$NDK_HOME"

#if command -v rustc >/dev/null 2>&1; then
#  echo 'rustc exists'
#else
#  wget https://dl.google.com/android/repository/android-ndk-r25c-linux.zip
#  unzip android-ndk-r25c-linux.zip -q
#  export RUSTUP_HOME=$current_dir/.rust
#  export CARGO_HOME=$current_dir/.cargo
#  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
#  export RUST_ANDROID_GRADLE_RUSTC_COMMAND=$CARGO_HOME/bin/rustc
#  export RUST_ANDROID_GRADLE_CARGO_COMMAND=$CARGO_HOME/bin/cargo
#  export ANDROID_NDK_HOME=$NDK_HOME
#fi

env
ls -l "$"

# install rust
if command -v rustc >/dev/null 2>&1; then
  echo 'rustc exists'
else
  # download NDK
  wget -q https://dl.google.com/android/repository/android-ndk-r25c-linux.zip
  unzip -q android-ndk-r25c-linux.zip
  export ANDROID_NDK_HOME=$current_dir/android-ndk-r25c
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
  cargo install cargo-ndk
  rustup target add aarch64-linux-android armv7-linux-androideabi x86_64-linux-android i686-linux-android
fi

# build rust
export ANDROID_DEST=$current_dir/src/main/jniLibs
cd ./keystone-sdk-rust/libs/ur-registry-ffi
make
cd "$current_dir"
