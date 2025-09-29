{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "stylua";
  version = "2.3.0";

  src = fetchFromGitHub {
    owner = "JohnnyMorganz";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-iyZ30Gc32TQsQyMLwArfIRtM0NkbXkqmca46nI0526M=";
  };

  cargoHash = "sha256-H50/e/XyFvXHhwrKUbKZFZwSHfwAkAtddEvFiOr5220=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A Lua code formatter";
    homepage = "https://github.com/JohnnyMorganz/StyLua";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
