{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "stylua";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "JohnnyMorganz";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-yVie8/aey77WbeUGM6rzuKBKLmAH1Jhhj9Y7LxbvIUw=";
  };

  cargoHash = "sha256-ow8lldu36qBHcXFgeBhHo2u+sSAFCEFbxUk2oZI7sj4=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A Lua code formatter";
    homepage = "https://github.com/JohnnyMorganz/StyLua";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
