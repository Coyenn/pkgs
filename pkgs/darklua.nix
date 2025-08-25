{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "darklua";
  version = "0.17.1";

  src = fetchFromGitHub {
    owner = "seaofvoices";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Jcq6zZ0KaDHXkIapPd38BR+ikVQAha3Bq5HuPEnKV0o=";
  };

  cargoHash = "sha256-yF+h7IiirvLw3WqqyCmcXbRa+fnsOpHrrmxkwl4lIG4=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A command line tool that transforms Lua 5.1 and Roblox Lua scripts using rules";
    homepage = "https://github.com/seaofvoices/darklua";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
