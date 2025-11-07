{
  lib,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
  dbus,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "pesde";
  version = "0.7.1+registry.0.2.3";

  src = fetchFromGitHub {
    owner = "pesde-pkg";
    repo = pname;
    rev = "v0.7.1+registry.0.2.3";
    sha256 = "sha256-ad9ZDC7p2dsHEQHJltgBTgmy8Ew1tXk13isTDSumkZ4=";
  };

  cargoHash = "sha256-sdPGuEsdBt0TeEr7yqr5tROETLy/VG63n5+ulW72wzg=";

  cargoBuildFlags = ["--features" "bin"];

  passthru.updateScript = nix-update-script {};

  buildInputs = [openssl dbus];
  nativeBuildInputs = [pkg-config];

  meta = with lib; {
    description = "A package manager for the Luau programming language, supporting multiple runtimes including Roblox and Lune";
    homepage = "https://github.com/pesde-pkg/pesde";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
