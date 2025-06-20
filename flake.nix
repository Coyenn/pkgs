{
  description = "A flake holding my personal nix packages";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    rokit = pkgs.callPackage ./pkgs/rokit.nix {};
  in {
    packages.${system}.rokit = rokit;

    devShells.${system}.default = pkgs.mkShell {
      inputsFrom = [];
      packages = [];
    };
  };
}
