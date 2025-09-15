{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "stylua";
  version = "2.2.0";

  src = fetchFromGitHub {
    owner = "JohnnyMorganz";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-PBe3X4YUFUV2xQdYYOdPNgJCnCOzrzogP/2sECef4ck=";
  };

  cargoHash = "sha256-C9g6kA+xc0nixiPAijc5MIF9xHbbeXBHtmdM4QRdf/Q=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A Lua code formatter";
    homepage = "https://github.com/JohnnyMorganz/StyLua";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
