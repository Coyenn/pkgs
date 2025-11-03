{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "stylua";
  version = "2.3.1";

  src = fetchFromGitHub {
    owner = "JohnnyMorganz";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-wpFp6K5O1Vb/yHq+Lm0235nbeOdOgBK0NrlVAthz12A=";
  };

  cargoHash = "sha256-+llL9WoKnrXJjlaPNqdN4jGPjSHz2EuI2V44fghF5aM=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A Lua code formatter";
    homepage = "https://github.com/JohnnyMorganz/StyLua";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
