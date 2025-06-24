{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "selene";

  src = fetchFromGitHub {
    owner = "Kampfkarren";
    repo = pname;
    rev = "v0.28.0";
    sha256 = "sha256-QE9kXGQWg0pHtSI1bTppn5IE+53KoxqFED1VvwkumEI=";
  };

  cargoHash = "sha256-7mAtTOnrNT8280TOAqtsykfdLq6XAQkDjR5JXZGwCFM=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A blazing-fast modern Lua linter written in Rust";
    homepage = "https://github.com/Kampfkarren/selene";
    license = licenses.mpl20;
    maintainers = ["Tim Ritter <hi@tim.cv>"];
    platforms = platforms.all;
  };
}
