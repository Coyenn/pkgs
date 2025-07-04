{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
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

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Upload and reference Roblox assets in code";
    homepage = "https://github.com/jackTabsCode/asphalt";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
