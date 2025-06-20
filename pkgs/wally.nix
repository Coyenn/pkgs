{
  lib,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
}:
rustPlatform.buildRustPackage rec {
  pname = "wally";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "UpliftGames";
    repo = pname;
    rev = "v${version}";
    sha256 = "0h4dvbq6m40aijzlhciqqifa7i7ibx13cc7mnp56vhlnm27i9ccm";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-Zl69CPOHRcSdOfEajQ6n/eo6ZZbGgWQbnr1zE1HQ/Ok=";

  buildInputs = [openssl];
  nativeBuildInputs = [pkg-config];

  meta = {
    description = "Package manager for Roblox";
    homepage = "https://github.com/UpliftGames/wally";
    license = lib.licenses.mpl20;
    platforms = lib.platforms.all;
  };
}
