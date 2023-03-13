#!/bin/bash

# please set your cargo rustc python location
# more see https://github.com/mozilla/rust-android-gradle#specifying-paths-to-sub-commands-python-cargo-and-rustc
#export RUST_ANDROID_GRADLE_PYTHON_COMMAND=$HOME/.pyenv/shims/python # set the path on your computer
#export RUST_ANDROID_GRADLE_CARGO_COMMAND=$HOME/.cargo/bin/cargo # set the path on your computer
#export RUST_ANDROID_GRADLE_RUSTC_COMMAND=$HOME/.cargo/bin/rustc # set the path on your computer

rustc -V

if command -v rustc >/dev/null 2>&1; then
  echo 'rustc exists'
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
  rustc -V
  export RUST_ANDROID_GRADLE_CARGO_COMMAND=$HOME/.cargo/bin/cargo # set the path on your computer
  export RUST_ANDROID_GRADLE_RUSTC_COMMAND=$HOME/.cargo/bin/rustc # set the path on your computer
fi
