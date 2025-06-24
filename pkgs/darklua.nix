{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "darklua";

  src = fetchFromGitHub {
    owner = "seaofvoices";
    repo = pname;
    rev = "v0.16.0";
    sha256 = "sha256-D83cLJ6voLvgZ51qLoCUzBG83VFB3Y7HxuaZHpaiOn4=";
  };

  cargoHash = "sha256-DQkj4t+l6FJnJQ+g96CXypssbRzHbS6X9AOG0LGDclg=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A command line tool that transforms Lua 5.1 and Roblox Lua scripts using rules";
    homepage = "https://github.com/seaofvoices/darklua";
    license = licenses.mit;
    maintainers = ["Tim Ritter <hi@tim.cv>"];
    platforms = platforms.all;
  };
}
