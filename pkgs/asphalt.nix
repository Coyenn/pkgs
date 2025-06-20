{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:
rustPlatform.buildRustPackage rec {
  pname = "asphalt";
  version = "1.0.0-pre.11";

  src = fetchFromGitHub {
    owner = "jackTabsCode";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-3Hl7bYUUKBSYR451UZONfzuA9jDn6MBu3uBJC/hV41I=";
  };

  cargoHash = "sha256-+V9Avd5ruNrg671kvtIOPWQgTg7EPlK1zh84QwhWsbo=";

  meta = {
    description = "Upload and reference Roblox assets in code";
    homepage = "https://github.com/jackTabsCode/asphalt";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}
