{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  nix-update-script,
}:
buildNpmPackage rec {
  pname = "rostar";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "tacheometry";
    repo = "Rostar";
    rev = version;
    sha256 = "sha256-svlpTSV/JkFdWhjYs5rYDlr+T9jDKvZhk9+CQnkYZ6Y=";
  };

  npmDepsHash = "sha256-ceCz4I4rAxvqkrZ5JgitX41nqNAiNkTQ+FNqjTqO/Uk=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "Dead simple fully managed Rojo helper for Roblox projects";
    homepage = "https://github.com/tacheometry/Rostar";
    license = licenses.mit;
    platforms = platforms.all;
    mainProgram = "rostar";
  };
}
