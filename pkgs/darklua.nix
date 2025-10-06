{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "darklua";
  version = "0.17.2";

  src = fetchFromGitHub {
    owner = "seaofvoices";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-RNm2d0VeLgHEawvZQYUcXesNwLc2m9Q6R6kNZhZDslg=";
  };

  cargoHash = "sha256-WfXIMuqO1KTiWeqMOnsylNlJKv1cKNZvp8qhalPlcnc=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A command line tool that transforms Lua 5.1 and Roblox Lua scripts using rules";
    homepage = "https://github.com/seaofvoices/darklua";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
