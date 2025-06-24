{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "aftman";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "LPGhatguy";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-wrSkfhmKlV2W3KaEazjPd4er7OSfpqWELHdSaDgX5n4=";
  };

  cargoHash = "sha256-OiP7SEIq3m2qNw7v09SVPKGECpvN/s6O1Xg5Pzhmr00=";

  # Aftman tests on main are literally broken
  doCheck = false;

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Aftman is a command line toolchain manager";
    homepage = "https://github.com/LPGhatguy/aftman";
    license = licenses.mit;
    maintainers = ["Tim Ritter <hi@tim.cv>"];
    platforms = platforms.all;
  };
}
