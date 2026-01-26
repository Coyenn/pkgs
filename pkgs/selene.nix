{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:
rustPlatform.buildRustPackage rec {
  pname = "selene";
  version = "0.30.0";

  src = fetchFromGitHub {
    owner = "Kampfkarren";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-zsqgLE9igxGGjymMJSt6JR453bw63TWeZwRVmkDm6ag=";
  };

  cargoHash = "sha256-RxIDFE+FGKUDvM1Fy/doSy/mf2JuklhoMGpSqoHhAV4=";

  passthru.updateScript = nix-update-script {};

  meta = with lib; {
    description = "A blazing-fast modern Lua linter written in Rust";
    homepage = "https://github.com/Kampfkarren/selene";
    license = licenses.mpl20;
    platforms = platforms.all;
  };
}
