{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "asphalt";
  version = "1.0.0-pre.14";

  src = fetchFromGitHub {
    owner = "jackTabsCode";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-qfkXOKZ5CXz1vzeDu8m3i8ZYP2dyRPAskL0p02Qjl7U=";
  };

  cargoHash = "sha256-tBlElO2zXehAcAOPdJnhLf/iejpjtO6dE5dzCzXeHO8=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Upload and reference Roblox assets in code";
    homepage = "https://github.com/jackTabsCode/asphalt";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
