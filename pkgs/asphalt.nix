{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "asphalt";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "jackTabsCode";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-z8sJFpg5mob+mG8Y2yDwLJcd+02WE7KGk0VaRe4UVXg=";
  };

  cargoHash = "sha256-8uYDLqPOxasSWLaXZiXfbF3d/JX7q6z3B+CjI8efzmw=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Upload and reference Roblox assets in code";
    homepage = "https://github.com/jackTabsCode/asphalt";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
