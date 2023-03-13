#!/bin/bash

# please set your cargo rustc python location
# more see https://github.com/mozilla/rust-android-gradle#specifying-paths-to-sub-commands-python-cargo-and-rustc
#export RUST_ANDROID_GRADLE_PYTHON_COMMAND=$HOME/.pyenv/shims/python # set the path on your computer
#export RUST_ANDROID_GRADLE_CARGO_COMMAND=$HOME/.cargo/bin/cargo # set the path on your computer
#export RUST_ANDROID_GRADLE_RUSTC_COMMAND=$HOME/.cargo/bin/rustc # set the path on your computer
#

if command -v rustc >/dev/null 2>&1; then
  echo 'rustc exists'
else
  apt-get install build-essential
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
  cargo install --force cargo-ndk
  rustup target add aarch64-linux-android armv7-linux-androideabi x86_64-linux-android i686-linux-android
fi

current_dir=$(pwd)
echo 'current_dir:'
echo "$current_dir"
export ANDROID_DEST=$current_dir/src/main/jniLibs
cd ./keystone-sdk-rust/libs/ur-registry-ffi
make
cd "$current_dir"
pwd
