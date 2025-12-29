{
  lib,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
  dbus,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "pesde";
  version = "0.7.2+registry.0.2.3";

  src = fetchFromGitHub {
    owner = "pesde-pkg";
    repo = pname;
    rev = "v0.7.2+registry.0.2.3";
    sha256 = "sha256-AZR9B4eMdPU4Ve1cCLCIEZvdjoP4HFnng4NcfA4NDhs=";
  };

  cargoHash = "sha256-1HcQdQqMcpePlO1WzPY4li+Kei9VDN4jfewPyAEDAWw=";

  cargoBuildFlags = ["--features" "bin"];

  passthru.updateScript = nix-update-script {};

  buildInputs = [openssl dbus];
  nativeBuildInputs = [pkg-config];

  meta = with lib; {
    description = "A package manager for the Luau programming language, supporting multiple runtimes including Roblox and Lune";
    homepage = "https://github.com/pesde-pkg/pesde";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
