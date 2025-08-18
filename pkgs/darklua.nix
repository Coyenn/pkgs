{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "darklua";
  version = "0.17.0";

  src = fetchFromGitHub {
    owner = "seaofvoices";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Ql3BHItFvfc2C3+/M7gxFJwValxNaBVVftm6+T5N4S8=";
  };

  cargoHash = "sha256-eJObrfhZMfgWUAqeTgOSic4u5fG5Eopqmvojiq+b54o=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A command line tool that transforms Lua 5.1 and Roblox Lua scripts using rules";
    homepage = "https://github.com/seaofvoices/darklua";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
