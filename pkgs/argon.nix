{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "argon";
  version = "2.0.25";

  src = fetchFromGitHub {
    owner = "argon-rbx";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-nQdh263qFS3seazdoNxme7SxQ7aJsRmFdoyfsZMDjw0=";
  };

  cargoHash = "sha256-s3/i7RnwadgGBg0lZmttxpLC/hZUba+PGc8WD30aAQI=";
  passthru.updateScript = nix-update-script {};
  doCheck = false;

  meta = with lib; {
    description = "Argon - Full featured tool for Roblox development";
    homepage = "https://github.com/argon-rbx/argon";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
