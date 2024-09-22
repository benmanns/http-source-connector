{ pkgs, lib, config, inputs, ... }:

{
  packages = [
    pkgs.git
    pkgs.bats
    pkgs.gnumake
    pkgs.cargo-cross
    pkgs.rustup
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    pkgs.darwin.apple_sdk.frameworks.SystemConfiguration
  ];

  languages.rust.enable = true;
  languages.rust.channel = "stable";
  languages.rust.targets = [
    "wasm32-wasi"
    "aarch64-unknown-linux-musl"
    "aarch64-unknown-linux-gnu"
    "x86_64-unknown-linux-musl"
    "x86_64-unknown-linux-gnu"
    "x86_64-apple-darwin"
    "aarch64-apple-darwin"
  ];

  pre-commit.hooks.rustfmt.enable = true;
}
