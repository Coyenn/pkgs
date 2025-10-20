{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "lune";
  version = "0.10.4";

  src = fetchFromGitHub {
    owner = "lune-org";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-NMAHARiRh47SnliCV25//491BjmTzibxLv6eBXQvE3s=";
  };

  cargoHash = "sha256-QSQ+SsvLa7f9EVGi6i/SlpL8yWXVP47zkw4beDy5UIQ=";

  doCheck = false;

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A standalone Luau runtime";
    homepage = "https://github.com/lune-org/lune";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
