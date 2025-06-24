{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "moonwave";

  src = fetchFromGitHub {
    owner = "evaera";
    repo = pname;
    rev = "v1.3.0";
    sha256 = "sha256-XCNldIngk+u25NJ8Yn16hhynJ+5uWZM+GD9xww6QD5s=";
  };

  sourceRoot = "${src.name}/extractor";
  cargoHash = "sha256-6o2CMGT7Nyd2594U7/Lkgty9bEM9dVOFBOSd3hTVq0Q=";
  passthru.updateScript = nix-update-script {};

  postInstall = ''
    mkdir -p $out/bin
    mv $out/bin/moonwave-extractor $out/bin/moonwave
  '';

  meta = with lib; {
    description = "Moonwave is a tool for generating documentation from comments in Lua source code.";
    homepage = "https://github.com/evaera/moonwave";
    license = licenses.mit;
    maintainers = ["Tim Ritter <hi@tim.cv>"];
    platforms = platforms.all;
  };
}
