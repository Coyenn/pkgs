{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "lune";
  version = "0.10.1";

  src = fetchFromGitHub {
    owner = "lune-org";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-ICablHaXz0lfOJhnj2KxbJA4e2GL7U5zwsIvI6JEyVo=";
  };

  cargoHash = "sha256-zGXxck/cH8nIS1B/bPTJf1LLCl1viOGSDL0TRQSNaRk=";

  doCheck = false;

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A standalone Luau runtime";
    homepage = "https://github.com/lune-org/lune";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
