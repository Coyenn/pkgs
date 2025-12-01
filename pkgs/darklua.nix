{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "darklua";
  version = "0.17.3";

  src = fetchFromGitHub {
    owner = "seaofvoices";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-IpTTNt/AlaDRckWq1Ck0A822rAtzeOt9RcB2F7CI5ig=";
  };

  cargoHash = "sha256-0TtABG+MSz3wdxhLgTZCFVgN8KwcDkVTwn+sZV+abbE=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A command line tool that transforms Lua 5.1 and Roblox Lua scripts using rules";
    homepage = "https://github.com/seaofvoices/darklua";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
