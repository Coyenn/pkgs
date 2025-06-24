{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "argon";
  version = "2.0.24";

  src = fetchFromGitHub {
    owner = "argon-rbx";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-2E9vyXTLCqW5zzCal9FjmV3LvLymjfUbzwZJB77FilU=";
  };

  cargoHash = "sha256-j9aSnyc65CeBdgoFevdn1xpJHs4xWMhFDoRiPizceTI=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Argon - Full featured tool for Roblox development";
    homepage = "https://github.com/argon-rbx/argon";
    license = licenses.mit;
    maintainers = ["Tim Ritter <hi@tim.cv>"];
    platforms = platforms.all;
  };
}
