{
  lib,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "rbxcloud";
  version = "0.17.0";

  src = fetchFromGitHub {
    owner = "Sleitnick";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-TBgfbuxe9JQ1g1hZiv+G6LuLQZO5qra14RF6iPL0ZDk=";
  };

  cargoHash = "sha256-lS5JuoeARE+v/EZ0FlC4IwTsHVPl8FwTZNeVrWTRNkE=";

  passthru.updateScript = nix-update-script {};

  buildInputs = [openssl];
  nativeBuildInputs = [pkg-config];

  meta = with lib; {
    description = "CLI and library for the Roblox Open Cloud API";
    homepage = "https://github.com/Sleitnick/rbxcloud";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
