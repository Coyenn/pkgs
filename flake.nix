{
  description = "A flake holding my personal nix packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  nixConfig = {
    extra-substituters = ["https://coyenn.cachix.org"];
    extra-trusted-public-keys = ["coyenn.cachix.org-1:8trB3cwK38eykwl00GomXg4eSRZaYDM/WMKqpusTVyE="];
  };

  outputs = {
    self,
    nixpkgs,
    rust-overlay,
    flake-utils,
  }: let
    # Create packages for a given system
    mkPackages = system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [rust-overlay.overlays.default];
      };

      rustPlatform_1_79 = pkgs.makeRustPlatform {
        cargo = pkgs.rust-bin.stable."1.79.0".default;
        rustc = pkgs.rust-bin.stable."1.79.0".default;
      };

      # Nightly Rust for crates using unstable features (e.g., let_chains)
      rustPlatform_nightly = pkgs.makeRustPlatform {
        cargo = pkgs.rust-bin.nightly.latest.default;
        rustc = pkgs.rust-bin.nightly.latest.default;
      };

      # Automatically discover packages from pkgs/ directory
      packageFiles = builtins.readDir ./pkgs;

      # Filter to only .nix files and remove the .nix extension
      packageNames =
        builtins.map (name: builtins.substring 0 (builtins.stringLength name - 4) name)
        (builtins.filter (name: pkgs.lib.hasSuffix ".nix" name)
          (builtins.attrNames packageFiles));

      # Special case packages that need custom arguments
      specialPackages = {
        wally = pkgs.callPackage ./pkgs/wally.nix {rustPlatform = rustPlatform_1_79;};
        lune = pkgs.callPackage ./pkgs/lune.nix {rustPlatform = rustPlatform_nightly;};
        asphalt = pkgs.callPackage ./pkgs/asphalt.nix {rustPlatform = rustPlatform_nightly;};
      };

      # Generate packages automatically
      autoPackages = builtins.listToAttrs (builtins.map (name: {
          inherit name;
          value =
            if builtins.hasAttr name specialPackages
            then specialPackages.${name}
            else pkgs.callPackage (./pkgs + "/${name}.nix") {};
        })
        packageNames);
    in
      autoPackages;
  in
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [rust-overlay.overlays.default];
      };
      autoPackages = mkPackages system;
    in {
      packages = autoPackages;

      devShells.default = pkgs.mkShell {
        inputsFrom = [];
        packages = [pkgs.nix-update pkgs.jq];
      };
    })
    // {
      overlays.default = final: prev: mkPackages prev.system;
    };
}
