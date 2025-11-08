{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage {
  pname = "roblox-rs";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "roblox-rs";
    repo = "roblox-rs";
    rev = "master";
    sha256 = "sha256-3ycx4NJWegD+Hk+OqC5ZpHDq6IhVGX0FRbE0Tlz0fgs=";
  };

  cargoHash = "sha256-eaEVTw+KnQdgCL4j0C8AipkpGE+rZVnU6hD4WQqYtks=";

  cargoBuildFlags = ["-p" "roblox-rs-cli"];
  passthru.updateScript = nix-update-script {};
  doCheck = false;

  meta = with lib; {
    description = "Rust bindings for the Roblox standard library (CLI)";
    homepage = "https://github.com/roblox-rs/roblox-rs";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
