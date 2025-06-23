{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "foreman";
  version = "1.6.4";

  src = fetchFromGitHub {
    owner = "Roblox";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-CrD3dI/OlMncSftgR0GkDN4VxGYaKn3mqBBvobXOL8M=";
  };

  cargoHash = "sha256-CrD3dI/OlMncSftgR0GkDN4VxGYaKn3mqBBvobXOL8M=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Toolchain manager for Roblox projects";
    homepage = "https://github.com/Roblox/foreman";
    license = licenses.mit;
    maintainers = ["Tim Ritter <hi@tim.cv>"];
    platforms = platforms.all;
  };
}
