{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "selene";
  version = "0.29.0";

  src = fetchFromGitHub {
    owner = "Kampfkarren";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-/KMLOZtCdvv76BDGj1oM6Q93cX6yPE4E5ZM+Xy6yRxA=";
  };

  cargoHash = "sha256-RlD4CbLJpmOSQJCMaXFC7/83qlPpnzd2wBn3xNu1yQ0=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A blazing-fast modern Lua linter written in Rust";
    homepage = "https://github.com/Kampfkarren/selene";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
