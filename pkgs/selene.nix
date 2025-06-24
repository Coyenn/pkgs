{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "selene";
  version = "0.28.0";

  src = fetchFromGitHub {
    owner = "Kampfkarren";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-QE9kXGQWg0pHtSI1bTppn5IE+53KoxqFED1VvwkumEI=";
  };

  cargoHash = "sha256-7mAtTOnrNT8280TOAqtsykfdLq6XAQkDjR5JXZGwCFM=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A blazing-fast modern Lua linter written in Rust";
    homepage = "https://github.com/Kampfkarren/selene";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
