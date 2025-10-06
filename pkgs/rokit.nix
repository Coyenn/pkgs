{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "rokit";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "rojo-rbx";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-7DVToKKq3omZOlLMIcthAS8PdvJ4zaKKDAU5HbDIEJc=";
  };

  cargoHash = "sha256-117kiiZ3ELP6S7SpNHJUBqqCKkVucxjfSmtRE83Zm/8=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Next-generation toolchain manager for Roblox projects";
    homepage = "https://github.com/rojo-rbx/rokit";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
