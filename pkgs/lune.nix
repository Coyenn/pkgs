{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "lune";
  version = "0.10.2";

  src = fetchFromGitHub {
    owner = "lune-org";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-jaYasQDCTxcgN2aYTfrhB1ZWxBaAgwovGzYZBnpaxdw=";
  };

  cargoHash = "sha256-vgnt76GyKYJhrnMqJNKj5YMXubDzSgsab07nd5Y8+qY=";

  doCheck = false;

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A standalone Luau runtime";
    homepage = "https://github.com/lune-org/lune";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
