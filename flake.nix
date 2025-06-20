{
  description = "A flake holding my personal nix packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    rust-overlay,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [rust-overlay.overlays.default];
    };

    rustPlatform_1_79 = pkgs.makeRustPlatform {
      cargo = pkgs.rust-bin.stable."1.79.0".default;
      rustc = pkgs.rust-bin.stable."1.79.0".default;
    };

    rokit = pkgs.callPackage ./pkgs/rokit.nix {};
    wally = pkgs.callPackage ./pkgs/wally.nix {rustPlatform = rustPlatform_1_79;};
    rojo = pkgs.callPackage ./pkgs/rojo.nix {};
    aftman = pkgs.callPackage ./pkgs/aftman.nix {};
    tarmac = pkgs.callPackage ./pkgs/tarmac.nix {};
    asphalt = pkgs.callPackage ./pkgs/asphalt.nix {};
    lune = pkgs.callPackage ./pkgs/lune.nix {};
  in {
    packages.${system} = {
      inherit rokit wally rojo aftman tarmac asphalt lune;
    };

    devShells.${system}.default = pkgs.mkShell {
      inputsFrom = [];
      packages = [];
    };
  };
}
